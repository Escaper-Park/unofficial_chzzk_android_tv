import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../core/tv/back/back.dart';
import '../../../../core/tv/focus/focus.dart';
import '../../../../core/ui/ui.dart';
import '../../../live/presentation/live_player_entry_flow.dart';
import '../../../vod/presentation/vod_player_entry_flow.dart';
import '../../domain/repositories/search_tag_results_repository.dart';
import '../bloc/search_tag_results_bloc.dart';
import '../search_tag_results_screen_design.dart';
import '../search_tag_results_screen_ui_mapper.dart';
import 'layout/search_tag_results_layout.dart';
import 'sections/grid/search_tag_results_card_mapper.dart';
import 'sections/header/search_tag_results_header.dart';
import 'sections/sort/search_tag_results_sort_panel.dart';

part 'search_tag_results_screen_content.dart';

class SearchTagResultsScreen extends StatelessWidget {
  const SearchTagResultsScreen({
    super.key,
    required this.tag,
  });

  final String tag;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      key: ValueKey(tag),
      create: (context) => SearchTagResultsBloc(
        repository: context.read<SearchTagResultsRepository>(),
      )..add(SearchTagResultsEvent.started(tag: tag)),
      child: const _SearchTagResultsScreenView(),
    );
  }
}

class _SearchTagResultsScreenView extends HookWidget {
  const _SearchTagResultsScreenView();

  @override
  Widget build(BuildContext context) {
    final tabsNode = useFocusScopeNode(debugLabel: 'search tag results tabs');
    final gridNode = useFocusScopeNode(debugLabel: 'search tag results grid');
    final sortNode = useFocusScopeNode(
      debugLabel: 'search tag results sort modal',
    );
    final sortOverlayController = useMemoized(
      () => OverlayPortalController(
        debugLabel: 'search tag results sort modal',
      ),
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
        duration: SearchTagResultsScreenDesign.snackbarDuration,
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

    return BlocConsumer<SearchTagResultsBloc, SearchTagResultsState>(
      listenWhen: (previous, current) {
        return previous.feedbackSerial != current.feedbackSerial &&
            current.feedbackType != null;
      },
      buildWhen: _shouldRebuildSearchTagResultsScreen,
      listener: (context, state) {
        final feedbackType = state.feedbackType;
        if (feedbackType != null &&
            handledFeedbackSerial.value != state.feedbackSerial) {
          handledFeedbackSerial.value = state.feedbackSerial;
          showSnackbar(searchTagResultsFeedbackMessage(feedbackType));
        }
      },
      builder: (context, state) {
        return TvScaffold(
          backController: TvBackController(
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
          body: OverlayPortal(
            controller: sortOverlayController,
            overlayLocation: OverlayChildLocation.rootOverlay,
            overlayChildBuilder: (_) => showSortPanel.value
                ? SearchTagResultsSortPanel(
                    key: ValueKey(state.selectedTab),
                    node: sortNode,
                    selectedTab: state.selectedTab,
                    selectedLiveOption: state.liveSortOption,
                    selectedVodOption: state.vodSortOption,
                    onLiveSelected: (option) {
                      hideSortPanel();
                      context.read<SearchTagResultsBloc>().add(
                        SearchTagResultsEvent.liveSortSelected(option),
                      );
                    },
                    onVodSelected: (option) {
                      hideSortPanel();
                      context.read<SearchTagResultsBloc>().add(
                        SearchTagResultsEvent.vodSortSelected(option),
                      );
                    },
                    onDismiss: hideSortPanel,
                  )
                : const SizedBox.shrink(),
            child: _searchTagResultsScreenContent(
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
    );
  }

  void _handleBack({
    required BuildContext context,
    required ValueNotifier<bool> showSortPanel,
    required OverlayPortalController sortOverlayController,
    required FocusScopeNode tabsNode,
    required FocusScopeNode gridNode,
  }) {
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

    _popOrSearch(context);
  }

  void _popOrSearch(BuildContext context) {
    if (context.canPop()) {
      context.pop();
      return;
    }

    context.go(AppRoute.search.path);
  }
}

bool _shouldRebuildSearchTagResultsScreen(
  SearchTagResultsState previous,
  SearchTagResultsState current,
) {
  return previous.copyWith(feedbackType: null, feedbackSerial: 0) !=
      current.copyWith(feedbackType: null, feedbackSerial: 0);
}
