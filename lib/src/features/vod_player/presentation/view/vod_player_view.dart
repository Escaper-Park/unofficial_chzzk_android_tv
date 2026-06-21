import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../core/tv/back/back.dart';
import '../../../../core/tv/focus/focus.dart';
import '../../../../core/ui/ui.dart';
import '../../../player_shared/presentation/overlay_controls/overlay_controls.dart';
import '../../../player_shared/presentation/player_content/player_content.dart';
import '../../../settings/domain/entities/settings_preferences.dart';
import '../../../settings/domain/repositories/settings_preferences_repository.dart';
import '../../../vod/presentation/vod_player_entry_flow.dart';
import '../bloc/vod_player_bloc.dart';
import '../vod_player_screen_design.dart';
import '../vod_player_screen_string.dart';
import '../vod_player_screen_ui_mapper.dart';
import 'vod_player_browse_overlay.dart';
import 'vod_player_chat_shortcuts.dart';
import 'vod_player_controls_overlay.dart';
import 'vod_player_playback_helpers.dart';
import 'vod_player_playback_snapshot.dart';
import 'vod_player_seek_feedback_controller.dart';
import 'vod_player_seek_feedback_overlay.dart';
import 'vod_player_status_surface.dart';
import 'vod_player_surface.dart';
import 'vod_player_video_surface.dart';

part 'vod_player_view_actions.dart';
part 'vod_player_view_content.dart';
part 'vod_player_view_foreground.dart';
part 'vod_player_view_lifecycle.dart';
part 'vod_player_view_listeners.dart';
part 'vod_player_view_overlays.dart';
part 'vod_player_view_seek.dart';
part 'vod_player_view_status.dart';

class VodPlayerView extends HookWidget {
  const VodPlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    final controllerNode = useFocusScopeNode(
      debugLabel: 'vod player controller section',
    );
    final controllerFocusNode = useFocusNode(
      debugLabel: 'vod player input controller',
    );
    final controlsNode = useFocusScopeNode(
      debugLabel: 'vod player controls section',
    );
    final browseNode = useFocusScopeNode(
      debugLabel: 'vod player browse section',
    );
    final feedbackController = useMemoized(
      TvSnackbarFeedbackController.new,
      const [],
    );
    final playbackPaused = useState(false);
    final muted = useState(false);
    final seekSerial = useState(0);
    final seekRequest = useState<VodPlayerSeekRequest?>(null);
    final seekFeedbackController = useMemoized(
      () => VodPlayerSeekFeedbackController(
        displayDuration: VodPlayerScreenDesign.seekFeedbackDuration,
      ),
      const [],
    );
    useListenable(seekFeedbackController);
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
        displayDuration: VodPlayerScreenDesign.exitNoticeDuration,
      ),
      const [],
    );
    useListenable(exitNoticeController);
    final lastVisibleChatWindowIndex = useRef(
      visibleVodChatWindowIndex(
        context
            .read<VodPlayerBloc>()
            .state
            .settingsPreferences
            .vodSettings
            .chatWindowIndex,
      ),
    );
    final playbackSnapshot = useMemoized(
      () => ValueNotifier(const VodPlayerPlaybackSnapshot()),
      const [],
    );

    void exitPlayer() {
      overlayAutoHideController.cancel();
      feedbackController.cancel();
      exitNoticeController.hide();
      seekFeedbackController.clear();

      if (context.canPop()) {
        context.pop();
        return;
      }

      context.go(AppRoute.home.path);
    }

    void closeControls() {
      overlayAutoHideController.dismissModal();
      context.read<VodPlayerBloc>().add(
        const VodPlayerEvent.controlsClosed(),
      );
      requestTvSectionFocus(controllerNode);
    }

    void closeBrowse() {
      overlayAutoHideController.dismissModal();
      context.read<VodPlayerBloc>().add(
        const VodPlayerEvent.browseClosed(),
      );
      requestTvSectionFocus(controllerNode);
    }

    void closeCurrentOverlay() {
      final overlayMode = context.read<VodPlayerBloc>().state.overlayMode;
      switch (overlayMode) {
        case VodPlayerOverlayMode.none:
          requestTvSectionFocus(controllerNode);
        case VodPlayerOverlayMode.controls:
          closeControls();
        case VodPlayerOverlayMode.browse:
          closeBrowse();
      }
    }

    void restartControlsTimer() {
      overlayAutoHideController.restart(closeControls);
    }

    void updateControlsModalVisibility({required bool visible}) {
      overlayAutoHideController.setModalVisible(visible: visible);

      if (!visible &&
          context.read<VodPlayerBloc>().state.overlayMode ==
              VodPlayerOverlayMode.controls) {
        restartControlsTimer();
      }
    }

    final doubleBackExitController = useMemoized(
      () => TvBackController.doubleBackExit(
        window: VodPlayerScreenDesign.exitNoticeDuration,
        onFirstBack: exitNoticeController.show,
        onExit: exitPlayer,
      ),
      const [],
    );
    final backController = TvBackController(
      onBack: () {
        final bloc = context.read<VodPlayerBloc>();
        if (bloc.state.overlayMode != VodPlayerOverlayMode.none) {
          if (bloc.state.overlayMode == VodPlayerOverlayMode.controls &&
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

    _useVodPlayerOverlayDisplayDuration(
      context: context,
      overlayAutoHideController: overlayAutoHideController,
    );
    _useVodPlayerViewControllerDisposal(
      playbackSnapshot: playbackSnapshot,
      doubleBackExitController: doubleBackExitController,
      exitNoticeController: exitNoticeController,
      overlayAutoHideController: overlayAutoHideController,
      feedbackController: feedbackController,
      seekFeedbackController: seekFeedbackController,
    );

    return TvScaffold(
      backController: backController,
      backgroundColor: VodPlayerScreenDesign.backgroundColor,
      body: _VodPlayerViewListeners(
        playbackSnapshot: playbackSnapshot,
        lastVisibleChatWindowIndex: lastVisibleChatWindowIndex,
        feedbackController: feedbackController,
        child: BlocBuilder<VodPlayerBloc, VodPlayerState>(
          buildWhen: (previous, current) {
            return !isOnlyVodPlaybackPositionStateChange(previous, current);
          },
          builder: (context, state) {
            return _vodPlayerContentFor(
              context: context,
              state: state,
              controllerNode: controllerNode,
              controllerFocusNode: controllerFocusNode,
              controlsNode: controlsNode,
              browseNode: browseNode,
              playbackPaused: playbackPaused,
              muted: muted,
              seekSerial: seekSerial,
              seekRequest: seekRequest,
              playbackSnapshot: playbackSnapshot,
              lastVisibleChatWindowIndex: lastVisibleChatWindowIndex,
              seekFeedbackController: seekFeedbackController,
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
