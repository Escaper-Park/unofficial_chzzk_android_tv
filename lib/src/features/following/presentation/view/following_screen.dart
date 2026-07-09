import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../app/shell/shell.dart';
import '../../../../core/tv/back/back.dart';
import '../../../../core/tv/focus/focus.dart';
import '../../../../core/ui/ui.dart';
import '../../../auth/presentation/bloc/auth_session_bloc.dart';
import '../../../category/domain/entities/category_item.dart';
import '../../../category/domain/repositories/category_repository.dart';
import '../../../channel/domain/repositories/channel_repository.dart';
import '../../../group/domain/entities/group_collection.dart';
import '../../../group/domain/repositories/group_repository.dart';
import '../../../live/presentation/live_player_entry_flow.dart';
import '../../../vod/domain/repositories/vod_repository.dart';
import '../../../vod/presentation/vod_player_entry_flow.dart';
import '../../domain/entities/following_feed.dart';
import '../../domain/repositories/following_repository.dart';
import '../bloc/following_bloc.dart';
import '../following_screen_design.dart';
import '../following_screen_string.dart';
import '../following_screen_ui_mapper.dart';
import 'layout/following_layout.dart';
import 'sections/channel_modal/following_channel_modal.dart';
import 'sections/sort/following_sort_panel.dart';
import 'shared/following_channel_focus_registry.dart';

part 'following_screen_helpers.dart';
part 'following_screen_content.dart';
part 'following_screen_channel_overlay.dart';
part 'following_screen_overlay_host.dart';

class FollowingScreen extends StatelessWidget {
  const FollowingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isSignedIn = context.read<AuthSessionBloc>().state.hasRequiredCookies;

    return BlocProvider(
      create: (context) => FollowingBloc(
        followingRepository: context.read<FollowingRepository>(),
        vodRepository: context.read<VodRepository>(),
        categoryRepository: context.read<CategoryRepository>(),
        channelRepository: context.read<ChannelRepository>(),
        groupRepository: context.read<GroupRepository>(),
        initialIsSignedIn: isSignedIn,
      )..add(FollowingEvent.started(isSignedIn: isSignedIn)),
      child: const _FollowingScreenView(),
    );
  }
}

class _FollowingScreenView extends HookWidget {
  const _FollowingScreenView();

  @override
  Widget build(BuildContext context) {
    final tabsNode = useFocusScopeNode(debugLabel: 'following tabs');
    final gridNode = useFocusScopeNode(debugLabel: 'following grid');
    final modalNode = useFocusScopeNode(debugLabel: 'following channel modal');
    final sortNode = useFocusScopeNode(debugLabel: 'following sort modal');
    final focusRegistry = useMemoized(FollowingChannelFocusRegistry.new);
    final sortOverlayController = useMemoized(
      () => OverlayPortalController(debugLabel: 'following sort modal'),
    );
    final channelOverlayController = useMemoized(
      () => OverlayPortalController(debugLabel: 'following channel modal'),
    );
    final showSortPanel = useState(false);
    final handledFeedbackSerial = useRef(0);
    final snackbarMessage = useState<String?>(null);
    final snackbarFeedbackController = useMemoized(
      TvSnackbarFeedbackController.new,
      const [],
    );
    final lastChannelModalChannelId = useRef<String?>(null);

    useEffect(() {
      return () {
        snackbarFeedbackController.dispose();
        focusRegistry.dispose();
      };
    }, [snackbarFeedbackController, focusRegistry]);

    void showSnackbar(String message) {
      snackbarFeedbackController.showMessage(
        message: message,
        duration: FollowingScreenDesign.snackbarDuration,
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

    return BlocListener<AuthSessionBloc, AuthSessionState>(
      listenWhen: (previous, current) {
        return previous.hasRequiredCookies != current.hasRequiredCookies;
      },
      listener: (context, state) {
        context.read<FollowingBloc>().add(
          FollowingEvent.authStateChanged(
            isSignedIn: state.hasRequiredCookies,
          ),
        );
      },
      child: BlocConsumer<FollowingBloc, FollowingState>(
        listenWhen: (previous, current) {
          final feedbackChanged =
              previous.feedbackSerial != current.feedbackSerial &&
              current.feedbackType != null;
          final channelModalChanged =
              previous.activeChannelModal != current.activeChannelModal;

          return feedbackChanged || channelModalChanged;
        },
        buildWhen: _shouldRebuildFollowingScreen,
        listener: (context, state) {
          final feedbackType = state.feedbackType;
          if (feedbackType != null &&
              handledFeedbackSerial.value != state.feedbackSerial) {
            handledFeedbackSerial.value = state.feedbackSerial;
            showSnackbar(followingFeedbackMessage(feedbackType));
          }

          final activeChannelModal = state.activeChannelModal;
          if (activeChannelModal == null) {
            if (channelOverlayController.isShowing) {
              channelOverlayController.hide();
            }
            final channelId = lastChannelModalChannelId.value;
            if (channelId != null) {
              focusRegistry.maybeNodeFor(channelId)?.requestFocus();
              lastChannelModalChannelId.value = null;
            }
          } else {
            lastChannelModalChannelId.value =
                activeChannelModal.channel.channelId;
            channelOverlayController.show();
          }
        },
        builder: (context, state) {
          return AppShellContentBackScope(
            controller: TvBackController(
              onBack: () {
                _handleBack(
                  context: context,
                  state: state,
                  showSortPanel: showSortPanel,
                  sortOverlayController: sortOverlayController,
                  tabsNode: tabsNode,
                  gridNode: gridNode,
                  focusRegistry: focusRegistry,
                );
              },
            ),
            child: _FollowingModalOverlayHost(
              sortController: sortOverlayController,
              channelController: channelOverlayController,
              sortOverlay: showSortPanel.value
                  ? FollowingSortPanel(
                      node: sortNode,
                      selectedOption: state.liveSortOption,
                      onSelected: (option) {
                        hideSortPanel();
                        context.read<FollowingBloc>().add(
                          FollowingEvent.liveSortSelected(option),
                        );
                      },
                      onDismiss: hideSortPanel,
                    )
                  : const SizedBox.shrink(),
              channelOverlay: _followingScreenChannelOverlay(
                context: context,
                state: state,
                modalNode: modalNode,
                focusRegistry: focusRegistry,
              ),
              child: _followingScreenContent(
                context: context,
                state: state,
                tabsNode: tabsNode,
                gridNode: gridNode,
                focusRegistry: focusRegistry,
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

bool _shouldRebuildFollowingScreen(
  FollowingState previous,
  FollowingState current,
) {
  return previous.copyWith(feedbackType: null, feedbackSerial: 0) !=
      current.copyWith(feedbackType: null, feedbackSerial: 0);
}
