import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../core/tv/back/back.dart';
import '../../../../core/tv/focus/focus.dart';
import '../../../../core/ui/ui.dart';
import '../../../auth/presentation/bloc/auth_session_bloc.dart';
import '../../../group/domain/repositories/group_repository.dart';
import '../../../live/domain/repositories/live_repository.dart';
import '../../../live/presentation/live_player_entry_flow.dart';
import '../../../vod/presentation/vod_player_entry_flow.dart';
import '../../domain/repositories/channel_repository.dart';
import '../bloc/channel_bloc.dart';
import '../channel_screen_design.dart';
import '../channel_screen_string.dart';
import '../channel_screen_ui_mapper.dart';
import 'layout/channel_layout.dart';
import 'sections/group/channel_group_panel.dart';
import 'sections/header/channel_header.dart';
import 'sections/sort/channel_sort_panel.dart';

part 'channel_screen_helpers.dart';
part 'channel_screen_content.dart';
part 'channel_screen_overlay_host.dart';

class ChannelScreen extends StatelessWidget {
  const ChannelScreen({
    super.key,
    required this.channelId,
  });

  final String channelId;

  @override
  Widget build(BuildContext context) {
    final isSignedIn = context.read<AuthSessionBloc>().state.hasRequiredCookies;

    return BlocProvider(
      create: (context) => ChannelBloc(
        channelId: channelId,
        channelRepository: context.read<ChannelRepository>(),
        liveRepository: context.read<LiveRepository>(),
        groupRepository: context.read<GroupRepository>(),
        initialIsSignedIn: isSignedIn,
      )..add(const ChannelEvent.started()),
      child: const _ChannelScreenView(),
    );
  }
}

class _ChannelScreenView extends HookWidget {
  const _ChannelScreenView();

  @override
  Widget build(BuildContext context) {
    final tabsNode = useFocusScopeNode(debugLabel: 'channel tabs');
    final homeStateNode = useFocusScopeNode(debugLabel: 'channel home state');
    final homeLiveNode = useFocusScopeNode(debugLabel: 'channel live rail');
    final homeVodNode = useFocusScopeNode(
      debugLabel: 'channel latest vod rail',
    );
    final vodGridNode = useFocusScopeNode(debugLabel: 'channel vod grid');
    final sortNode = useFocusScopeNode(debugLabel: 'channel sort modal');
    final groupNode = useFocusScopeNode(debugLabel: 'channel group modal');
    final sortOverlayController = useMemoized(
      () => OverlayPortalController(debugLabel: 'channel sort modal'),
    );
    final groupOverlayController = useMemoized(
      () => OverlayPortalController(debugLabel: 'channel group modal'),
    );
    final showSortPanel = useState(false);
    final homePreferredContentNode = useState<FocusScopeNode?>(null);
    final handledFeedbackSerial = useRef(0);
    final snackbarMessage = useState<String?>(null);
    final snackbarFeedbackController = useMemoized(
      TvSnackbarFeedbackController.new,
      const [],
    );

    useEffect(() {
      return snackbarFeedbackController.dispose;
    }, [snackbarFeedbackController]);

    useEffect(() {
      void rememberHomeContentFocus() {
        final focusedNode = switch (true) {
          _ when homeLiveNode.hasFocus => homeLiveNode,
          _ when homeVodNode.hasFocus => homeVodNode,
          _ when homeStateNode.hasFocus => homeStateNode,
          _ => null,
        };

        if (focusedNode != null &&
            homePreferredContentNode.value != focusedNode) {
          homePreferredContentNode.value = focusedNode;
        }
      }

      homeLiveNode.addListener(rememberHomeContentFocus);
      homeVodNode.addListener(rememberHomeContentFocus);
      homeStateNode.addListener(rememberHomeContentFocus);

      return () {
        homeLiveNode.removeListener(rememberHomeContentFocus);
        homeVodNode.removeListener(rememberHomeContentFocus);
        homeStateNode.removeListener(rememberHomeContentFocus);
      };
    }, [homeLiveNode, homeVodNode, homeStateNode]);

    void showSnackbar(String message) {
      snackbarFeedbackController.showMessage(
        message: message,
        duration: ChannelScreenDesign.snackbarDuration,
        onMessageChanged: (message) => snackbarMessage.value = message,
      );
    }

    void hideSortPanel() {
      showSortPanel.value = false;
      if (sortOverlayController.isShowing) {
        sortOverlayController.hide();
      }
      requestTvSectionFocus(tabsNode);
    }

    void hideGroupPanel() {
      context.read<ChannelBloc>().add(const ChannelEvent.groupPanelDismissed());
      if (groupOverlayController.isShowing) {
        groupOverlayController.hide();
      }
      requestTvSectionFocus(tabsNode);
    }

    return BlocListener<AuthSessionBloc, AuthSessionState>(
      listenWhen: (previous, current) {
        return previous.hasRequiredCookies != current.hasRequiredCookies;
      },
      listener: (context, state) {
        context.read<ChannelBloc>().add(
          ChannelEvent.authStateChanged(isSignedIn: state.hasRequiredCookies),
        );
      },
      child: BlocConsumer<ChannelBloc, ChannelState>(
        listenWhen: (previous, current) {
          final feedbackChanged =
              previous.feedbackSerial != current.feedbackSerial &&
              current.feedbackType != null;
          final groupPanelChanged = previous.groupPanel != current.groupPanel;

          return feedbackChanged || groupPanelChanged;
        },
        listener: (context, state) {
          final feedbackType = state.feedbackType;
          if (feedbackType != null &&
              handledFeedbackSerial.value != state.feedbackSerial) {
            handledFeedbackSerial.value = state.feedbackSerial;
            showSnackbar(channelFeedbackMessage(feedbackType));
          }

          if (state.groupPanel == null) {
            if (groupOverlayController.isShowing) {
              groupOverlayController.hide();
            }
          } else {
            groupOverlayController.show();
          }
        },
        builder: (context, state) {
          return TvScaffold(
            backController: TvBackController(
              onBack: () {
                _handleBack(
                  context: context,
                  state: state,
                  showSortPanel: showSortPanel,
                  sortOverlayController: sortOverlayController,
                  tabsNode: tabsNode,
                  homeStateNode: homeStateNode,
                  homeLiveNode: homeLiveNode,
                  homeVodNode: homeVodNode,
                  vodGridNode: vodGridNode,
                );
              },
            ),
            body: _ChannelModalOverlayHost(
              sortController: sortOverlayController,
              groupController: groupOverlayController,
              sortOverlay: showSortPanel.value
                  ? ChannelSortPanel(
                      node: sortNode,
                      selectedOption: state.vodSortOption,
                      onSelected: (option) {
                        hideSortPanel();
                        context.read<ChannelBloc>().add(
                          ChannelEvent.vodSortSelected(option),
                        );
                      },
                      onDismiss: hideSortPanel,
                    )
                  : const SizedBox.shrink(),
              groupOverlay: state.groupPanel == null
                  ? const SizedBox.shrink()
                  : ChannelGroupPanel(
                      node: groupNode,
                      panel: state.groupPanel!,
                      onAddToGroup: (group) {
                        context.read<ChannelBloc>().add(
                          ChannelEvent.groupAddRequested(group),
                        );
                      },
                      onDismiss: hideGroupPanel,
                    ),
              child: _channelScreenContent(
                context: context,
                state: state,
                tabsNode: tabsNode,
                homeStateNode: homeStateNode,
                homeLiveNode: homeLiveNode,
                homeVodNode: homeVodNode,
                homePreferredContentNode: homePreferredContentNode.value,
                vodGridNode: vodGridNode,
                showSortPanel: showSortPanel,
                sortOverlayController: sortOverlayController,
                snackbarMessage: snackbarMessage.value,
              ),
            ),
          );
        },
      ),
    );
  }
}
