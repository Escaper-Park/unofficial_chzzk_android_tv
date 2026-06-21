import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../core/tv/back/back.dart';
import '../../../../core/tv/focus/focus.dart';
import '../../../../core/ui/ui.dart';
import '../../../../core/utils/serialized_wakelock_controller.dart';
import '../../../auth/presentation/bloc/auth_session_bloc.dart';
import '../../../chat/domain/entities/chat.dart';
import '../../../chat/domain/repositories/chat_repository.dart';
import '../../../chat/domain/use_cases/live_chat_service.dart';
import '../../../live/presentation/live_player_entry_flow.dart';
import '../../../player_shared/presentation/overlay_controls/overlay_controls.dart';
import '../../../player_shared/presentation/player_content/player_content.dart';
import '../../../settings/domain/entities/settings_preferences.dart';
import '../../../settings/domain/repositories/settings_preferences_repository.dart';
import '../bloc/live_player_bloc.dart';
import '../live_player_screen_design.dart';
import '../live_player_screen_string.dart';
import 'live_player_browse_overlay.dart';
import 'live_player_chat_layer.dart';
import 'live_player_chat_shortcuts.dart';
import 'live_player_controls_overlay.dart';
import 'live_player_multiview_chat_policy.dart';
import 'live_player_multiview_playback_layout.dart';
import 'live_player_playback_session_controller.dart';
import 'live_player_status_surface.dart';

part 'live_player_view_actions.dart';
part 'live_player_view_build_when.dart';
part 'live_player_view_chat_layer.dart';
part 'live_player_view_content.dart';
part 'live_player_view_foreground.dart';
part 'live_player_view_lifecycle.dart';
part 'live_player_view_listeners.dart';
part 'live_player_view_overlays.dart';
part 'live_player_view_status.dart';

class LivePlayerView extends HookWidget {
  const LivePlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    final controllerNode = useFocusScopeNode(
      debugLabel: 'live player controller section',
    );
    final controllerFocusNode = useFocusNode(
      debugLabel: 'live player input controller',
    );
    final controlsNode = useFocusScopeNode(
      debugLabel: 'live player controls section',
    );
    final browseNode = useFocusScopeNode(
      debugLabel: 'live player browse section',
    );
    final feedbackController = useMemoized(
      TvSnackbarFeedbackController.new,
      const [],
    );
    final playbackPaused = useState(false);
    final muted = useState(false);
    final appLifecycleState = _useLivePlayerAppLifecycleState();
    final overlayAutoHideController = useMemoized(
      () => TvPlayerOverlayAutoHideController(
        displayDuration: Duration(
          seconds: defaultGeneralSetting.overlayControlsDisplayTime,
        ),
      ),
      const [],
    );
    useListenable(overlayAutoHideController);
    final exitNoticeController = useMemoized(
      () => TvPlayerExitNoticeController(
        displayDuration: LivePlayerScreenDesign.exitNoticeDuration,
      ),
      const [],
    );
    useListenable(exitNoticeController);
    final liveChatService = useMemoized(
      () => LiveChatService(
        chatRepository: context.read<ChatRepository>(),
      ),
      const [],
    );
    final playbackSessionController = useMemoized(
      LivePlayerPlaybackSessionController.new,
      const [],
    );
    final lastVisibleChatWindowIndex = useRef(
      visibleLiveChatWindowIndex(
        context
            .read<LivePlayerBloc>()
            .state
            .settingsPreferences
            .liveSettings
            .chatWindowIndex,
      ),
    );
    final appPlaybackSuspended = appLifecycleState != AppLifecycleState.resumed;
    final effectivePlaybackPaused =
        playbackPaused.value || appPlaybackSuspended;

    void exitPlayer() {
      playbackSessionController.suspendAll();
      overlayAutoHideController.cancel();
      feedbackController.cancel();
      exitNoticeController.hide();

      if (context.canPop()) {
        context.pop();
        return;
      }

      context.go(AppRoute.home.path);
    }

    void closeControls() {
      overlayAutoHideController.dismissModal();
      context.read<LivePlayerBloc>().add(
        const LivePlayerEvent.controlsClosed(),
      );
      requestTvSectionFocus(controllerNode);
    }

    void closeBrowse() {
      overlayAutoHideController.dismissModal();
      context.read<LivePlayerBloc>().add(
        const LivePlayerEvent.browseClosed(),
      );
      requestTvSectionFocus(controllerNode);
    }

    void closeCurrentOverlay() {
      final overlayMode = context.read<LivePlayerBloc>().state.overlayMode;
      switch (overlayMode) {
        case LivePlayerOverlayMode.none:
          requestTvSectionFocus(controllerNode);
        case LivePlayerOverlayMode.controls:
          closeControls();
        case LivePlayerOverlayMode.browse:
          closeBrowse();
      }
    }

    void restartControlsTimer() {
      overlayAutoHideController.restart(closeControls);
    }

    void updateControlsModalVisibility({required bool visible}) {
      overlayAutoHideController.setModalVisible(visible: visible);

      if (!visible &&
          context.read<LivePlayerBloc>().state.overlayMode ==
              LivePlayerOverlayMode.controls) {
        restartControlsTimer();
      }
    }

    final doubleBackExitController = useMemoized(
      () => TvBackController.doubleBackExit(
        window: LivePlayerScreenDesign.exitNoticeDuration,
        onFirstBack: exitNoticeController.show,
        onExit: exitPlayer,
      ),
      const [],
    );
    final backController = TvBackController(
      onBack: () {
        final bloc = context.read<LivePlayerBloc>();
        if (bloc.state.overlayMode != LivePlayerOverlayMode.none) {
          if (bloc.state.overlayMode == LivePlayerOverlayMode.controls &&
              overlayAutoHideController.modalOpen) {
            overlayAutoHideController.dismissModal();
            restartControlsTimer();
            return;
          }

          closeCurrentOverlay();
          return;
        }

        if (controllerNode.hasFocus) {
          doubleBackExitController.handleBack();
          return;
        }

        controllerNode.requestFocus();
      },
    );

    _useLivePlayerOverlayDisplayDuration(
      context: context,
      overlayAutoHideController: overlayAutoHideController,
    );
    _useLivePlayerViewControllerDisposal(
      doubleBackExitController: doubleBackExitController,
      exitNoticeController: exitNoticeController,
      overlayAutoHideController: overlayAutoHideController,
      feedbackController: feedbackController,
      playbackSessionController: playbackSessionController,
    );

    return TvScaffold(
      backController: backController,
      backgroundColor: LivePlayerScreenDesign.backgroundColor,
      body: _LivePlayerViewListeners(
        lastVisibleChatWindowIndex: lastVisibleChatWindowIndex,
        feedbackController: feedbackController,
        child: BlocBuilder<LivePlayerBloc, LivePlayerState>(
          buildWhen: _livePlayerViewBuildWhen,
          builder: (context, state) {
            return _livePlayerContentFor(
              context: context,
              state: state,
              controllerNode: controllerNode,
              controllerFocusNode: controllerFocusNode,
              controlsNode: controlsNode,
              browseNode: browseNode,
              playbackPaused: playbackPaused,
              muted: muted,
              appPlaybackSuspended: appPlaybackSuspended,
              effectivePlaybackPaused: effectivePlaybackPaused,
              connectLiveChat: liveChatService.connect,
              lastVisibleChatWindowIndex: lastVisibleChatWindowIndex,
              playbackSessionController: playbackSessionController,
              overlayAutoHideController: overlayAutoHideController,
              exitNoticeController: exitNoticeController,
              onControlsInteraction: restartControlsTimer,
              onControlsModalVisibilityChanged: (visible) {
                updateControlsModalVisibility(visible: visible);
              },
            );
          },
        ),
      ),
    );
  }
}
