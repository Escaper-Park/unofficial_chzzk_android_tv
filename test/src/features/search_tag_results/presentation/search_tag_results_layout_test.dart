import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/ui/ui.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search_tag_results/domain/entities/search_tag_feed.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search_tag_results/presentation/bloc/search_tag_results_bloc.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search_tag_results/presentation/search_tag_results_screen_design.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search_tag_results/presentation/search_tag_results_screen_string.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search_tag_results/presentation/view/layout/search_tag_results_layout.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search_tag_results/presentation/view/sections/header/search_tag_results_header.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search_tag_results/presentation/view/sections/sort/search_tag_results_sort_panel.dart';

void main() {
  testWidgets('header uses AppShell height and tag result title', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColorTokens.brandColor,
            brightness: Brightness.dark,
          ),
        ),
        home: const Scaffold(
          body: SearchTagResultsHeader(tag: 'game'),
        ),
      ),
    );

    final header = tester.widget<SizedBox>(
      find.ancestor(
        of: find.text(SearchTagResultsScreenString.headerTitle('game')),
        matching: find.byType(SizedBox),
      ),
    );
    expect(header.height, SearchTagResultsScreenDesign.headerHeight);
  });

  testWidgets('renders tabs and selected sort action', (tester) async {
    await _pumpLayout(
      tester,
      state: SearchTagResultsState.initial().copyWith(
        tag: 'game',
        live: searchTagResultsPageReady<SearchTagLive, SearchTagLiveCursor>(
          items: const [],
        ),
      ),
    );

    expect(
      find.text(
        SearchTagResultsScreenString.tabLabel(SearchTagResultsTab.live),
      ),
      findsOneWidget,
    );
    expect(
      find.text(SearchTagResultsScreenString.tabLabel(SearchTagResultsTab.vod)),
      findsOneWidget,
    );
    expect(
      find.text(
        SearchTagResultsScreenString.sortLabel(
          SearchTagResultsState.initial().copyWith(
            liveSortOption: SearchTagResultsLiveSortOption.popular,
          ),
        ),
      ),
      findsOneWidget,
    );
    expect(find.text(SearchTagResultsScreenString.liveEmpty), findsOneWidget);

    final layout = tester.widget<GridContentLayout>(
      find.byType(GridContentLayout),
    );
    expect(
      layout.headerRowPadding,
      SearchTagResultsScreenDesign.headerRowPadding,
    );
    expect(
      layout.headerContentGap,
      SearchTagResultsScreenDesign.headerContentGap,
    );
  });

  testWidgets('sort action label changes with the selected tab', (
    tester,
  ) async {
    final state = SearchTagResultsState.initial().copyWith(
      selectedTab: SearchTagResultsTab.vod,
      vod: searchTagResultsPageReady<SearchTagVideo, SearchTagVideoCursor>(
        items: const [],
      ),
    );

    await _pumpLayout(tester, state: state);

    expect(
      find.text(SearchTagResultsScreenString.sortLabel(state)),
      findsOneWidget,
    );
  });

  testWidgets('uses shared feed grid spacing for live cards', (tester) async {
    tester.view.physicalSize = const Size(960, 540);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    const live = SearchTagLive(
      liveId: 1,
      title: 'Live',
      concurrentUserCount: 1,
      adult: false,
      channel: SearchTagChannel(
        channelId: 'live-channel',
        channelName: 'Live Channel',
        verifiedMark: false,
      ),
    );

    await _pumpLayout(
      tester,
      state: SearchTagResultsState.initial().copyWith(
        live: searchTagResultsPageReady<SearchTagLive, SearchTagLiveCursor>(
          items: [live],
        ),
      ),
    );

    final grid = tester.widget<TvGrid>(find.byType(TvGrid));
    final padding = grid.padding! as EdgeInsets;

    expect(grid.mainAxisSpacing, SearchTagResultsScreenDesign.gridMainAxisGap);
    expect(
      grid.crossAxisSpacing,
      SearchTagResultsScreenDesign.gridCrossAxisGap,
    );
    expect(
      grid.mainAxisExtent,
      SearchTagResultsScreenDesign.mediaGridItemHeight,
    );
    expect(
      padding,
      SearchTagResultsScreenDesign.gridPadding(
        availableWidth: 960,
        variant: TvGridVariant.feedCard,
      ),
    );
  });

  testWidgets('renders sort panel as a large modal with VOD filters', (
    tester,
  ) async {
    final node = FocusScopeNode(debugLabel: 'test search tag sort panel');
    addTearDown(node.dispose);

    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColorTokens.brandColor,
            brightness: Brightness.dark,
          ),
        ),
        home: Scaffold(
          body: SearchTagResultsSortPanel(
            node: node,
            selectedTab: SearchTagResultsTab.vod,
            selectedLiveOption: SearchTagResultsLiveSortOption.popular,
            selectedVodOption: SearchTagResultsVodSortOption.popular,
            onLiveSelected: (_) {},
            onVodSelected: (_) {},
            onDismiss: () {},
          ),
        ),
      ),
    );

    expect(
      tester.widget<TvModalPanel>(find.byType(TvModalPanel)).type,
      TvModalPanelType.large,
    );
    expect(
      tester.widget<TvModalPanel>(find.byType(TvModalPanel)).header,
      SearchTagResultsScreenString.sortAction,
    );
    expect(
      find.text(
        SearchTagResultsScreenString.vodSortLabel(
          SearchTagResultsVodSortOption.popular,
        ),
      ),
      findsOneWidget,
    );
    expect(
      find.text(
        SearchTagResultsScreenString.vodSortLabel(
          SearchTagResultsVodSortOption.latest,
        ),
      ),
      findsOneWidget,
    );
  });
}

Future<void> _pumpLayout(
  WidgetTester tester, {
  required SearchTagResultsState state,
}) async {
  final nodes = _SearchTagResultsLayoutNodes();
  addTearDown(nodes.dispose);

  await tester.pumpWidget(
    MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColorTokens.brandColor,
          brightness: Brightness.dark,
        ),
      ),
      home: Scaffold(
        body: SizedBox(
          width: 960,
          height: 540,
          child: SearchTagResultsLayout(
            state: state,
            tabsNode: nodes.tabsNode,
            gridNode: nodes.gridNode,
            onTabSelected: (_) {},
            onSortPressed: () {},
            onRetry: () {},
            onLoadMore: () {},
            onLivePressed: (_) {},
            onVodPressed: (_) {},
          ),
        ),
      ),
    ),
  );
}

final class _SearchTagResultsLayoutNodes {
  final tabsNode = FocusScopeNode(debugLabel: 'test search tag tabs');
  final gridNode = FocusScopeNode(debugLabel: 'test search tag grid');

  void dispose() {
    tabsNode.dispose();
    gridNode.dispose();
  }
}
