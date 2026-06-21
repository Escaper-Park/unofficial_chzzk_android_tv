import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/app/shell/shell.dart';
import 'package:unofficial_chzzk_android_tv/src/core/tv/focus/focus.dart';
import 'package:unofficial_chzzk_android_tv/src/core/ui/ui.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/entities/category_item.dart';
import 'package:unofficial_chzzk_android_tv/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:unofficial_chzzk_android_tv/src/features/home/presentation/home_screen_design.dart';
import 'package:unofficial_chzzk_android_tv/src/features/home/presentation/home_screen_string.dart';
import 'package:unofficial_chzzk_android_tv/src/features/home/presentation/view/layout/home_layout.dart';
import 'package:unofficial_chzzk_android_tv/src/features/home/presentation/view/sections/immersive/home_immersive_list_exports.dart';
import 'package:unofficial_chzzk_android_tv/src/features/home/presentation/view/sections/rails/home_category_rail_section.dart';
import 'package:unofficial_chzzk_android_tv/src/features/home/presentation/view/sections/rails/home_live_rail_section.dart';
import 'package:unofficial_chzzk_android_tv/src/features/home/presentation/view/sections/rails/home_vod_rail_section.dart';
import 'package:unofficial_chzzk_android_tv/src/features/home/presentation/view/shared/home_category_card.dart';
import 'package:unofficial_chzzk_android_tv/src/features/home/presentation/view/shared/home_category_card_design.dart';
import 'package:unofficial_chzzk_android_tv/src/features/home/presentation/view/shared/home_focus_registry.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_feed.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/domain/entities/settings_preferences.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_feed.dart';

void main() {
  test('uses the six-card category width for Home category rails', () {
    expect(HomeCategoryCardDesign.width, TvCardWidth.six);
    expect(
      HomeCategoryCardDesign.thumbnailRatio,
      TvCardThumbnailRatio.ratio3x4,
    );
    expect(
      HomeCategoryCardDesign.height,
      HomeCategoryCardDesign.width.value /
          HomeCategoryCardDesign.thumbnailRatio.value,
    );
    expect(
      HomeScreenDesign.categoryRailItemExtent,
      HomeCategoryCardDesign.width.value,
    );
    expect(HomeScreenDesign.categoryRailHeight, HomeCategoryCardDesign.height);
    expect(HomeCategoryCardDesign.focusOutlineWidth, 2);
    expect(HomeScreenDesign.scrollBottomPadding, 24);
  });

  testWidgets('renders Home category metadata inside the poster card', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: HomeCategoryCard(item: _categoryItem(), onPressed: () {}),
          ),
        ),
      ),
    );

    final cardSize = tester.getSize(find.byType(TvCard));

    expect(cardSize.width, HomeCategoryCardDesign.width.value);
    expect(cardSize.height, HomeCategoryCardDesign.height);
    expect(find.byType(TvCard), findsOneWidget);
    expect(find.text('Game'), findsOneWidget);
    expect(find.byIcon(Icons.live_tv_rounded), findsOneWidget);
    expect(find.text('12'), findsOneWidget);
    expect(find.byIcon(Icons.visibility_rounded), findsOneWidget);
    expect(find.text('3,456'), findsOneWidget);
    expect(
      tester.widget<Text>(find.text('Game')).style?.fontSize,
      HomeCategoryCardDesign.compactBadgeFontSize,
    );
    expect(
      tester.widget<Text>(find.text('12')).style?.fontSize,
      HomeCategoryCardDesign.compactBadgeFontSize,
    );
    expect(
      tester.widget<Text>(find.text('3,456')).style?.fontSize,
      HomeCategoryCardDesign.compactBadgeFontSize,
    );
    final thumbnail = tester.widget<TvMediaThumbnail>(
      find.byType(TvMediaThumbnail),
    );

    expect(
      thumbnail.imageUrl,
      'https://nng-phinf.pstatic.net/game.jpg?type=w375',
    );

    final metadataBadgeSize = tester.getSize(
      find.byKey(const ValueKey('category-poster-metadata-badge')),
    );

    expect(metadataBadgeSize.width, HomeCategoryCardDesign.badgeAvailableWidth);
    expect(metadataBadgeSize.height, lessThan(HomeCategoryCardDesign.height));

    final openLiveSlotSize = tester.getSize(
      find.byKey(const ValueKey('category-poster-open-live-metric-slot')),
    );
    final viewerSlotSize = tester.getSize(
      find.byKey(const ValueKey('category-poster-viewer-metric-slot')),
    );

    expect(openLiveSlotSize.width, viewerSlotSize.width);
    expect(
      openLiveSlotSize.width,
      (HomeCategoryCardDesign.badgeAvailableWidth -
              HomeCategoryCardDesign.badgePadding.horizontal) /
          2,
    );
  });

  testWidgets('draws Home category focus outline over the poster', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: HomeCategoryCard(
              item: _categoryItem(),
              autofocus: true,
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
    await tester.pump();

    final frame = tester.widget<DecoratedBox>(
      find.byWidgetPredicate((widget) {
        if (widget is! DecoratedBox) {
          return false;
        }

        final decoration = widget.decoration;

        return decoration is BoxDecoration && decoration.border != null;
      }),
    );
    final decoration = frame.decoration as BoxDecoration;

    expect(decoration.border, isNotNull);
    expect(
      decoration.border!.top.width,
      HomeCategoryCardDesign.focusOutlineWidth,
    );
    expect(_focusedHomeCard(), findsOneWidget);
  });

  testWidgets(
    'Home live rail cards use level1 focus elevation and surface shadow',
    (
      tester,
    ) async {
      final node = FocusScopeNode();
      addTearDown(node.dispose);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HomeLiveRailSection(
              sectionId: HomeSectionId.popularLive,
              node: node,
              data: homeSectionReady<Live>([_live(1)]),
              autofocus: true,
              onRetry: () {},
              onItemPressed: (_) {},
              onMorePressed: () {},
            ),
          ),
        ),
      );
      await tester.pump();

      expect(_focusedHomeCard(), findsOneWidget);
    },
  );

  testWidgets('Home live rail appends a more item', (tester) async {
    final node = FocusScopeNode();
    var morePressed = false;
    addTearDown(node.dispose);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: HomeLiveRailSection(
            sectionId: HomeSectionId.popularLive,
            node: node,
            data: homeSectionReady<Live>([_live(1)]),
            onRetry: () {},
            onItemPressed: (_) {},
            onMorePressed: () => morePressed = true,
          ),
        ),
      ),
    );

    expect(find.text(HomeScreenString.more), findsOneWidget);

    await tester.tap(find.text(HomeScreenString.more));

    expect(morePressed, isTrue);
  });

  testWidgets(
    'Home live rail loading placeholder reserves the media rail height',
    (tester) async {
      final node = FocusScopeNode();
      addTearDown(node.dispose);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: HomeLiveRailSection(
                sectionId: HomeSectionId.popularLive,
                node: node,
                data: homeSectionLoading<Live>(),
                onRetry: () {},
                onItemPressed: (_) {},
                onMorePressed: () {},
              ),
            ),
          ),
        ),
      );

      expect(
        tester.getSize(find.byType(ContentStateView)).height,
        HomeScreenDesign.mediaRailHeight,
      );
    },
  );

  testWidgets(
    'Home VOD rail cards use level1 focus elevation and surface shadow',
    (
      tester,
    ) async {
      final node = FocusScopeNode();
      addTearDown(node.dispose);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HomeVodRailSection(
              sectionId: HomeSectionId.popularVod,
              node: node,
              data: homeSectionReady<Vod>([_vod()]),
              autofocus: true,
              onRetry: () {},
              onItemPressed: (_) {},
              onMorePressed: () {},
            ),
          ),
        ),
      );
      await tester.pump();

      expect(_focusedHomeCard(), findsOneWidget);
    },
  );

  testWidgets(
    'Home VOD rail loading placeholder reserves the media rail height',
    (tester) async {
      final node = FocusScopeNode();
      addTearDown(node.dispose);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: HomeVodRailSection(
                sectionId: HomeSectionId.popularVod,
                node: node,
                data: homeSectionLoading<Vod>(),
                onRetry: () {},
                onItemPressed: (_) {},
                onMorePressed: () {},
              ),
            ),
          ),
        ),
      );

      expect(
        tester.getSize(find.byType(ContentStateView)).height,
        HomeScreenDesign.mediaRailHeight,
      );
    },
  );

  testWidgets(
    'Home category rail loading placeholder reserves the category rail height',
    (tester) async {
      final node = FocusScopeNode();
      addTearDown(node.dispose);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: HomeCategoryRailSection(
                sectionId: HomeSectionId.trendingCategory,
                node: node,
                data: homeSectionLoading<CategoryItem>(),
                onRetry: () {},
                onItemPressed: (_) {},
                onMorePressed: () {},
              ),
            ),
          ),
        ),
      );

      expect(
        tester.getSize(find.byType(ContentStateView)).height,
        HomeScreenDesign.categoryRailHeight,
      );
    },
  );

  testWidgets(
    'Home section exits ensure target scopes instead of rail children',
    (
      tester,
    ) async {
      final focusRegistry = HomeFocusRegistry();
      addTearDown(focusRegistry.dispose);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 960,
              height: 540,
              child: HomeLayout(
                state: _homeState(
                  immersiveItems: [_live(1)],
                  popularLive: homeSectionReady<Live>([_live(2)]),
                ),
                focusRegistry: focusRegistry,
                onRetry: () {},
                onLivePressed: (_) {},
                onVodPressed: (_) {},
                onCategoryPressed: (_) {},
                onSectionMorePressed: (_) {},
              ),
            ),
          ),
        ),
      );

      final immersiveExit = tester
          .widgetList<TvFocusExit>(
            find.byType(TvFocusExit),
          )
          .singleWhere(
            (exit) =>
                exit.down == focusRegistry.nodeFor(HomeSectionId.popularLive),
          );
      final railExit = tester
          .widgetList<TvFocusExit>(
            find.byType(TvFocusExit),
          )
          .singleWhere(
            (exit) => exit.up == focusRegistry.nodeFor(HomeSectionId.immersive),
          );

      expect(immersiveExit.downEnsureVisibleScope, isTrue);
      expect(
        immersiveExit.downFocusAlignment,
        HomeScreenDesign.verticalScrollAlignment,
      );
      expect(railExit.upEnsureVisibleScope, isTrue);
      expect(
        railExit.upFocusAlignment,
        HomeScreenDesign.verticalScrollAlignment,
      );
    },
  );

  testWidgets('renders Home loading sections without loading text', (
    tester,
  ) async {
    final focusRegistry = HomeFocusRegistry();
    addTearDown(focusRegistry.dispose);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: 960,
            height: 360,
            child: HomeLayout(
              state: _homeState(
                immersive: homeSectionLoading<Live>(),
                popularLive: homeSectionLoading<Live>(),
              ),
              focusRegistry: focusRegistry,
              onRetry: () {},
              onLivePressed: (_) {},
              onVodPressed: (_) {},
              onCategoryPressed: (_) {},
              onSectionMorePressed: (_) {},
            ),
          ),
        ),
      ),
    );
  });

  testWidgets('renders an immersive background placeholder while loading', (
    tester,
  ) async {
    final focusRegistry = HomeFocusRegistry();
    addTearDown(focusRegistry.dispose);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: 960,
            height: 540,
            child: HomeLayout(
              state: _homeState(
                immersive: homeSectionLoading<Live>(),
                popularLive: homeSectionLoading<Live>(),
              ),
              focusRegistry: focusRegistry,
              onRetry: () {},
              onLivePressed: (_) {},
              onVodPressed: (_) {},
              onCategoryPressed: (_) {},
              onSectionMorePressed: (_) {},
            ),
          ),
        ),
      ),
    );

    final scrim = find.byType(TvScrim);

    expect(scrim, findsOneWidget);
    expect(tester.getTopLeft(scrim).dy, 0);
    expect(tester.getSize(scrim), HomeImmersiveListDesign.thumbnailSize);
  });

  testWidgets(
    'moves the immersive background with the vertical scroll offset',
    (
      tester,
    ) async {
      final focusRegistry = HomeFocusRegistry();
      addTearDown(focusRegistry.dispose);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 960,
              height: 240,
              child: HomeLayout(
                state: _homeState(immersiveItems: [_live(1)]),
                focusRegistry: focusRegistry,
                onRetry: () {},
                onLivePressed: (_) {},
                onVodPressed: (_) {},
                onCategoryPressed: (_) {},
                onSectionMorePressed: (_) {},
              ),
            ),
          ),
        ),
      );

      final scrim = find.byType(TvScrim);
      final scrollable = tester.state<ScrollableState>(
        find.byType(Scrollable).first,
      );

      expect(scrim, findsOneWidget);
      expect(tester.getTopLeft(scrim).dy, 0);

      focusRegistry.nodeFor(HomeSectionId.popularLive).requestFocus();
      await tester.pump(HomeScreenDesign.verticalScrollDuration);
      await tester.pump();

      expect(
        tester.getTopLeft(scrim).dy,
        -scrollable.position.pixels,
      );
    },
  );

  testWidgets('notifies the shell when immersive focus changes', (
    tester,
  ) async {
    final focusRegistry = HomeFocusRegistry();
    final notifications = <bool>[];
    addTearDown(focusRegistry.dispose);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: NotificationListener<AppShellNavigationBackdropNotification>(
            onNotification: (notification) {
              notifications.add(notification.translucent);
              return true;
            },
            child: SizedBox(
              width: 960,
              height: 360,
              child: HomeLayout(
                state: _homeState(immersiveItems: [_live(1)]),
                focusRegistry: focusRegistry,
                onRetry: () {},
                onLivePressed: (_) {},
                onVodPressed: (_) {},
                onCategoryPressed: (_) {},
                onSectionMorePressed: (_) {},
              ),
            ),
          ),
        ),
      ),
    );

    focusRegistry.nodeFor(HomeSectionId.immersive).requestFocus();
    await tester.pump();

    focusRegistry.nodeFor(HomeSectionId.popularLive).requestFocus();
    await tester.pump();

    expect(notifications, containsAllInOrder([true, false]));
  });

  testWidgets(
    'notifies the shell when the focused immersive backdrop disappears',
    (
      tester,
    ) async {
      final focusRegistry = HomeFocusRegistry();
      final notifications = <bool>[];
      addTearDown(focusRegistry.dispose);

      Future<void> pumpHome(HomeState state) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body:
                  NotificationListener<AppShellNavigationBackdropNotification>(
                    onNotification: (notification) {
                      notifications.add(notification.translucent);
                      return true;
                    },
                    child: SizedBox(
                      width: 960,
                      height: 360,
                      child: HomeLayout(
                        state: state,
                        focusRegistry: focusRegistry,
                        onRetry: () {},
                        onLivePressed: (_) {},
                        onVodPressed: (_) {},
                        onCategoryPressed: (_) {},
                        onSectionMorePressed: (_) {},
                      ),
                    ),
                  ),
            ),
          ),
        );
      }

      await pumpHome(_homeState(immersiveItems: [_live(1)]));
      await tester.pump();

      if (!focusRegistry.nodeFor(HomeSectionId.immersive).hasFocus) {
        focusRegistry.nodeFor(HomeSectionId.immersive).requestFocus();
        await tester.pump();
      }
      expect(focusRegistry.nodeFor(HomeSectionId.immersive).hasFocus, true);
      notifications.clear();

      await pumpHome(_homeState(immersive: homeSectionLoading<Live>()));
      await tester.pump();

      expect(notifications, contains(false));
    },
  );
}

HomeState _homeState({
  List<Live> immersiveItems = const [],
  HomeSectionData<Live>? immersive,
  HomeSectionData<Live>? popularLive,
}) {
  return HomeState(
    loadStatus: HomeLoadStatus.ready,
    isSignedIn: false,
    generalSetting: defaultGeneralSetting,
    visibleSections: const [
      HomeSectionId.immersive,
      HomeSectionId.popularLive,
    ],
    immersive: immersive ?? homeSectionReady<Live>(immersiveItems),
    followingLive: homeSectionInitial<Live>(),
    popularLive: popularLive ?? homeSectionReady<Live>(const []),
    watchingHistory: homeSectionInitial<Vod>(),
    popularVod: homeSectionInitial<Vod>(),
    followingCategory: homeSectionInitial<CategoryItem>(),
    trendingCategory: homeSectionInitial<CategoryItem>(),
  );
}

CategoryItem _categoryItem() {
  return const CategoryItem(
    categoryId: 'game',
    categoryType: 'GAME',
    title: 'Game',
    posterImageUrl: 'https://nng-phinf.pstatic.net/game.jpg',
    openLiveCount: 12,
    concurrentUserCount: 3456,
  );
}

Live _live(int id) {
  return Live(
    liveId: id,
    title: 'Live $id',
    concurrentUserCount: 1000,
    adult: false,
    channel: LiveChannel(
      channelId: 'channel-$id',
      channelName: 'Channel $id',
      verifiedMark: false,
    ),
  );
}

Vod _vod() {
  return Vod(
    videoNo: 1,
    title: 'VOD 1',
    videoType: 'REPLAY',
    publishDate: '2026-06-01 12:00:00',
    duration: 120,
    readCount: 1234,
    publishDateAt: DateTime.now().millisecondsSinceEpoch,
    adult: false,
    livePv: 0,
  );
}

Finder _focusedHomeCard() {
  return find.byWidgetPredicate(
    (widget) =>
        widget is Card &&
        widget.elevation == HomeScreenDesign.focusedCardElevation.value &&
        widget.shadowColor == HomeScreenDesign.focusedCardShadowColor,
  );
}
