import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/ui/ui.dart';
import 'package:unofficial_chzzk_android_tv/src/features/browse/presentation/bloc/browse_bloc.dart';
import 'package:unofficial_chzzk_android_tv/src/features/browse/presentation/browse_screen_design.dart';
import 'package:unofficial_chzzk_android_tv/src/features/browse/presentation/browse_screen_string.dart';
import 'package:unofficial_chzzk_android_tv/src/features/browse/presentation/view/layout/browse_layout.dart';
import 'package:unofficial_chzzk_android_tv/src/features/browse/presentation/view/sections/sort/browse_sort_panel.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_feed.dart';

void main() {
  testWidgets('renders tabs and selected sort action', (tester) async {
    await _pumpLayout(
      tester,
      state: BrowseState.initial().copyWith(
        live: browsePageReady<Live, LiveCursor>(items: const []),
      ),
    );

    expect(
      find.text(BrowseScreenString.tabLabel(BrowseTab.live)),
      findsOneWidget,
    );
    expect(
      find.text(BrowseScreenString.tabLabel(BrowseTab.vod)),
      findsOneWidget,
    );
    expect(
      find.text(BrowseScreenString.liveSortLabel(BrowseLiveSortOption.popular)),
      findsOneWidget,
    );
    expect(find.text(BrowseScreenString.liveEmpty), findsOneWidget);

    final layout = tester.widget<GridContentLayout>(
      find.byType(GridContentLayout),
    );
    expect(layout.headerRowPadding, BrowseScreenDesign.headerRowPadding);
    expect(layout.headerContentGap, BrowseScreenDesign.headerContentGap);
  });

  testWidgets('keeps signed-in-only VOD filters visible with auth guidance', (
    tester,
  ) async {
    await _pumpLayout(
      tester,
      state: BrowseState.initial().copyWith(
        selectedTab: BrowseTab.vod,
        vodSortOption: BrowseVodSortOption.following,
      ),
    );

    expect(
      find.text(BrowseScreenString.tabLabel(BrowseTab.live)),
      findsOneWidget,
    );
    expect(
      find.text(BrowseScreenString.tabLabel(BrowseTab.vod)),
      findsOneWidget,
    );
    expect(
      find.text(BrowseScreenString.vodSortLabel(BrowseVodSortOption.following)),
      findsOneWidget,
    );
    expect(
      find.text(
        '${BrowseScreenString.authRequiredTitle}\n'
        '${BrowseScreenString.authRequiredMessage}',
      ),
      findsOneWidget,
    );
    expect(find.text(BrowseScreenString.moveToAuth), findsOneWidget);
  });

  testWidgets('uses shared feed grid spacing for live cards', (tester) async {
    tester.view.physicalSize = const Size(960, 540);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    const live = Live(
      liveId: 1,
      title: 'Live',
      concurrentUserCount: 1,
      adult: false,
      channel: LiveChannel(
        channelId: 'live-channel',
        channelName: 'Live Channel',
        verifiedMark: false,
      ),
    );

    await _pumpLayout(
      tester,
      state: BrowseState.initial().copyWith(
        live: browsePageReady<Live, LiveCursor>(items: [live]),
      ),
    );

    final grid = tester.widget<TvGrid>(find.byType(TvGrid));
    final padding = grid.padding! as EdgeInsets;

    expect(grid.mainAxisSpacing, BrowseScreenDesign.gridMainAxisGap);
    expect(grid.crossAxisSpacing, BrowseScreenDesign.gridCrossAxisGap);
    expect(grid.mainAxisExtent, BrowseScreenDesign.mediaGridItemHeight);
    expect(grid.clipBehavior, Clip.hardEdge);
    expect(
      padding,
      BrowseScreenDesign.gridPadding(
        availableWidth: 960,
        variant: TvGridVariant.feedCard,
      ),
    );
  });

  testWidgets('renders sort panel as a large modal with VOD filters', (
    tester,
  ) async {
    final node = FocusScopeNode(debugLabel: 'test browse sort panel');
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
          body: BrowseSortPanel(
            node: node,
            selectedTab: BrowseTab.vod,
            selectedLiveOption: BrowseLiveSortOption.popular,
            selectedVodOption: BrowseVodSortOption.popular,
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
      find.text(BrowseScreenString.vodSortLabel(BrowseVodSortOption.popular)),
      findsOneWidget,
    );
    expect(
      find.text(BrowseScreenString.vodSortLabel(BrowseVodSortOption.latest)),
      findsOneWidget,
    );
    expect(
      find.text(BrowseScreenString.vodSortLabel(BrowseVodSortOption.following)),
      findsOneWidget,
    );
    expect(
      find.text(
        BrowseScreenString.vodSortLabel(BrowseVodSortOption.watchingHistory),
      ),
      findsOneWidget,
    );
  });
}

Future<void> _pumpLayout(
  WidgetTester tester, {
  required BrowseState state,
}) async {
  final nodes = _BrowseLayoutNodes();
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
          child: BrowseLayout(
            state: state,
            tabsNode: nodes.tabsNode,
            gridNode: nodes.gridNode,
            onAuthPressed: () {},
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

final class _BrowseLayoutNodes {
  final tabsNode = FocusScopeNode(debugLabel: 'test browse tabs');
  final gridNode = FocusScopeNode(debugLabel: 'test browse grid');

  void dispose() {
    tabsNode.dispose();
    gridNode.dispose();
  }
}
