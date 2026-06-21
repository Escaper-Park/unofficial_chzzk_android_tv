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
import '../../../live/domain/repositories/live_repository.dart';
import '../../../live/presentation/live_player_entry_flow.dart';
import '../../../vod/domain/repositories/vod_repository.dart';
import '../../../vod/presentation/vod_player_entry_flow.dart';
import '../../../watching_history/domain/repositories/watching_history_repository.dart';
import '../bloc/browse_bloc.dart';
import '../browse_route_query.dart';
import '../browse_screen_design.dart';
import '../browse_screen_ui_mapper.dart';
import 'layout/browse_layout.dart';
import 'sections/sort/browse_sort_panel.dart';

part 'browse_screen_content.dart';

class BrowseScreen extends StatelessWidget {
  const BrowseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isSignedIn = context.read<AuthSessionBloc>().state.hasRequiredCookies;
    final queryParameters = GoRouterState.of(context).uri.queryParameters;
    final initialTab = BrowseRouteQuery.tabFrom(queryParameters);
    final initialLiveSortOption = BrowseRouteQuery.liveSortFrom(
      queryParameters,
    );
    final initialVodSortOption = BrowseRouteQuery.vodSortFrom(queryParameters);

    return BlocProvider(
      key: ValueKey(
        '${initialTab.name}:${initialLiveSortOption.name}:'
        '${initialVodSortOption.name}',
      ),
      create: (context) => BrowseBloc(
        liveRepository: context.read<LiveRepository>(),
        vodRepository: context.read<VodRepository>(),
        watchingHistoryRepository: context.read<WatchingHistoryRepository>(),
        initialTab: initialTab,
        initialLiveSortOption: initialLiveSortOption,
        initialVodSortOption: initialVodSortOption,
      )..add(BrowseEvent.started(isSignedIn: isSignedIn)),
      child: const _BrowseScreenView(),
    );
  }
}

class _BrowseScreenView extends HookWidget {
  const _BrowseScreenView();

  @override
  Widget build(BuildContext context) {
    final tabsNode = useFocusScopeNode(debugLabel: 'browse tabs');
    final gridNode = useFocusScopeNode(debugLabel: 'browse grid');
    final sortNode = useFocusScopeNode(debugLabel: 'browse sort modal');
    final sortOverlayController = useMemoized(
      () => OverlayPortalController(debugLabel: 'browse sort modal'),
    );
    final showSortPanel = useState(false);
    final handledFeedbackSerial = useRef(0);
    final snackbarMessage = useState<String?>(null);
    final snackbarFeedbackController = useMemoized(
      TvSnackbarFeedbackController.new,
      const [],
    );

    useEffect(() {
      return snackbarFeedbackController.dispose;
    }, [snackbarFeedbackController]);

    void showSnackbar(String message) {
      snackbarFeedbackController.showMessage(
        message: message,
        duration: BrowseScreenDesign.snackbarDuration,
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
        context.read<BrowseBloc>().add(
          BrowseEvent.authStateChanged(isSignedIn: state.hasRequiredCookies),
        );
      },
      child: BlocConsumer<BrowseBloc, BrowseState>(
        listenWhen: (previous, current) {
          return previous.feedbackSerial != current.feedbackSerial &&
              current.feedbackType != null;
        },
        listener: (context, state) {
          final feedbackType = state.feedbackType;
          if (feedbackType != null &&
              handledFeedbackSerial.value != state.feedbackSerial) {
            handledFeedbackSerial.value = state.feedbackSerial;
            showSnackbar(browseFeedbackMessage(feedbackType));
          }
        },
        builder: (context, state) {
          return AppShellContentBackScope(
            controller: TvBackController(
              onBack: () {
                _handleBack(
                  context: context,
                  showSortPanel: showSortPanel,
                  sortOverlayController: sortOverlayController,
                  tabsNode: tabsNode,
                  gridNode: gridNode,
                );
              },
            ),
            child: OverlayPortal(
              controller: sortOverlayController,
              overlayLocation: OverlayChildLocation.rootOverlay,
              overlayChildBuilder: (_) => showSortPanel.value
                  ? BrowseSortPanel(
                      node: sortNode,
                      selectedTab: state.selectedTab,
                      selectedLiveOption: state.liveSortOption,
                      selectedVodOption: state.vodSortOption,
                      onLiveSelected: (option) {
                        hideSortPanel();
                        context.read<BrowseBloc>().add(
                          BrowseEvent.liveSortSelected(option),
                        );
                      },
                      onVodSelected: (option) {
                        hideSortPanel();
                        context.read<BrowseBloc>().add(
                          BrowseEvent.vodSortSelected(option),
                        );
                      },
                      onDismiss: hideSortPanel,
                    )
                  : const SizedBox.shrink(),
              child: _browseScreenContent(
                context: context,
                state: state,
                tabsNode: tabsNode,
                gridNode: gridNode,
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

  void _handleBack({
    required BuildContext context,
    required ValueNotifier<bool> showSortPanel,
    required OverlayPortalController sortOverlayController,
    required FocusScopeNode tabsNode,
    required FocusScopeNode gridNode,
  }) {
    final navigationNode = AppShellFocusScope.maybeNavigationOf(context);
    if (navigationNode?.hasFocus ?? false) {
      return;
    }

    if (showSortPanel.value) {
      showSortPanel.value = false;
      if (sortOverlayController.isShowing) {
        sortOverlayController.hide();
      }
      requestTvSectionFocus(tabsNode);
      return;
    }

    if (gridNode.hasFocus) {
      requestTvSectionFocus(tabsNode);
      return;
    }

    navigationNode?.requestFocus();
  }
}
