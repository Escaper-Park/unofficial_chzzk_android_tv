import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/ui/ui.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/entities/category_item.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/presentation/view/shared/category_poster_card.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/presentation/view/shared/category_poster_card_design.dart';
import 'package:unofficial_chzzk_android_tv/src/features/following/domain/entities/following_feed.dart';
import 'package:unofficial_chzzk_android_tv/src/features/following/presentation/bloc/following_bloc.dart';
import 'package:unofficial_chzzk_android_tv/src/features/following/presentation/following_screen_design.dart';
import 'package:unofficial_chzzk_android_tv/src/features/following/presentation/following_screen_string.dart';
import 'package:unofficial_chzzk_android_tv/src/features/following/presentation/view/layout/following_layout.dart';
import 'package:unofficial_chzzk_android_tv/src/features/following/presentation/view/sections/channel_modal/following_channel_modal.dart';
import 'package:unofficial_chzzk_android_tv/src/features/following/presentation/view/sections/sort/following_sort_panel.dart';
import 'package:unofficial_chzzk_android_tv/src/features/following/presentation/view/shared/following_channel_focus_registry.dart';
import 'package:unofficial_chzzk_android_tv/src/features/group/domain/entities/group_collection.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_feed.dart';

void main() {
  testWidgets('renders signed-out guidance with auth action', (tester) async {
    await _pumpLayout(tester, state: FollowingState.initial());

    expect(find.text(FollowingScreenString.signedOutTitle), findsOneWidget);
    expect(find.text(FollowingScreenString.signedOutMessage), findsOneWidget);
    expect(find.text(FollowingScreenString.moveToAuth), findsOneWidget);
    expect(find.byType(GridContentLayout), findsNothing);
  });

  testWidgets('renders tabs and Live sort action for signed-in state', (
    tester,
  ) async {
    await _pumpLayout(
      tester,
      state: FollowingState.initial().copyWith(
        isSignedIn: true,
        live: followingSectionReady(const []),
      ),
    );

    expect(
      find.text(FollowingScreenString.tabLabel(FollowingTab.live)),
      findsOneWidget,
    );
    expect(
      find.text(FollowingScreenString.tabLabel(FollowingTab.vod)),
      findsOneWidget,
    );
    expect(
      find.text(FollowingScreenString.tabLabel(FollowingTab.channel)),
      findsOneWidget,
    );
    expect(
      find.text(FollowingScreenString.tabLabel(FollowingTab.category)),
      findsOneWidget,
    );
    expect(
      find.text(
        FollowingScreenString.liveSortLabel(FollowingLiveSortOption.popular),
      ),
      findsOneWidget,
    );
    final headerPadding =
        tester
                .widget<GridContentLayout>(find.byType(GridContentLayout))
                .headerRowPadding
            as EdgeInsets;

    expect(headerPadding.top, 24);
    expect(headerPadding.bottom, 24);
    expect(
      tester
          .widget<GridContentLayout>(find.byType(GridContentLayout))
          .headerContentGap,
      FollowingScreenDesign.headerContentGap,
    );
    expect(find.text(FollowingScreenString.liveEmpty), findsOneWidget);
  });

  testWidgets('uses shared tab grid spacing for feed and category grids', (
    tester,
  ) async {
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
    const category = CategoryItem(
      categoryId: 'category',
      categoryType: 'GAME',
      title: 'Category',
      posterImageUrl: null,
      openLiveCount: 1,
      concurrentUserCount: 10,
    );

    await _pumpLayout(
      tester,
      state: FollowingState.initial().copyWith(
        isSignedIn: true,
        selectedTab: FollowingTab.live,
        live: followingSectionReady([live]),
      ),
    );

    final liveGrid = tester.widget<TvGrid>(find.byType(TvGrid));
    final livePadding = liveGrid.padding! as EdgeInsets;

    expect(liveGrid.mainAxisSpacing, FollowingScreenDesign.gridMainAxisGap);
    expect(liveGrid.crossAxisSpacing, FollowingScreenDesign.gridCrossAxisGap);
    expect(liveGrid.clipBehavior, Clip.hardEdge);
    expect(
      livePadding,
      FollowingScreenDesign.gridPadding(
        availableWidth: 960,
        variant: TvGridVariant.feedCard,
      ),
    );

    await _pumpLayout(
      tester,
      state: FollowingState.initial().copyWith(
        isSignedIn: true,
        selectedTab: FollowingTab.category,
        category: followingSectionReady([category]),
      ),
    );

    final categoryGrid = tester.widget<TvGrid>(find.byType(TvGrid));
    final categoryPadding = categoryGrid.padding! as EdgeInsets;

    expect(categoryGrid.mainAxisSpacing, FollowingScreenDesign.gridMainAxisGap);
    expect(
      categoryGrid.crossAxisSpacing,
      FollowingScreenDesign.gridCrossAxisGap,
    );
    expect(categoryGrid.clipBehavior, Clip.hardEdge);
    expect(
      categoryPadding,
      FollowingScreenDesign.gridPadding(
        availableWidth: 960,
        variant: TvGridVariant.category,
      ),
    );
    expect(categoryPadding.left, livePadding.left);
    expect(categoryPadding.top, livePadding.top);
    expect(categoryPadding.top, FollowingScreenDesign.gridFocusPaintPadding);
    expect(categoryPadding.bottom, livePadding.bottom);
  });

  testWidgets('renders tab-specific loading messages', (tester) async {
    await _pumpLayout(
      tester,
      state: FollowingState.initial().copyWith(
        isSignedIn: true,
        selectedTab: FollowingTab.vod,
        vod: followingVodSectionLoading(),
      ),
    );

    expect(find.text(FollowingScreenString.vodLoading), findsOneWidget);
  });

  testWidgets('keeps initial loading focus out of tabs and actions', (
    tester,
  ) async {
    final nodes = _FollowingLayoutNodes();
    addTearDown(nodes.dispose);

    await _pumpLayoutWithNodes(
      tester,
      nodes: nodes,
      state: FollowingState.initial().copyWith(
        isSignedIn: true,
        live: followingSectionLoading<Live>(),
      ),
    );
    await tester.pump();

    expect(nodes.tabsNode.hasFocus, false);
    expect(nodes.gridNode.hasFocus, true);
  });

  testWidgets('renders Add to group as available modal UI', (tester) async {
    final modalNode = FocusScopeNode(debugLabel: 'test following modal');
    final openerNode = FocusNode(debugLabel: 'test channel opener');
    final anchorLink = LayerLink();
    const channel = FollowingChannel(
      channelId: 'channel',
      channelName: 'Modal Channel',
      verifiedMark: true,
      openLive: false,
    );
    addTearDown(modalNode.dispose);
    addTearDown(openerNode.dispose);

    await _pumpChannelModalHarness(
      tester,
      modalNode: modalNode,
      openerNode: openerNode,
      anchorLink: anchorLink,
      channel: channel,
      showModal: false,
    );

    await _pumpChannelModalHarness(
      tester,
      modalNode: modalNode,
      openerNode: openerNode,
      anchorLink: anchorLink,
      channel: channel,
      showModal: true,
    );

    expect(find.byType(TvMediaChannelName), findsOneWidget);
    expect(
      tester.widget<TvMediaChannelName>(find.byType(TvMediaChannelName)),
      isA<TvMediaChannelName>()
          .having(
            (widget) => widget.channelName,
            'channelName',
            'Modal Channel',
          )
          .having((widget) => widget.verified, 'verified', true),
    );
    expect(find.byType(TvMediaVerifiedMark), findsOneWidget);
    expect(find.text(FollowingScreenString.addToGroup), findsOneWidget);
    expect(
      tester
          .getSize(
            find.byKey(const ValueKey('following-channel-modal-content')),
          )
          .height,
      160,
    );
    expect(
      tester
          .widget<TvDenseListItem>(
            find.widgetWithText(
              TvDenseListItem,
              FollowingScreenString.addToGroup,
            ),
          )
          .enabled,
      true,
    );
    expect(
      tester
          .widget<TvDenseListItem>(
            find.widgetWithText(
              TvDenseListItem,
              FollowingScreenString.watchLive,
            ),
          )
          .enabled,
      false,
    );
    final modalOffset = tester
        .widget<CompositedTransformFollower>(
          find.byType(CompositedTransformFollower),
        )
        .offset;

    expect(
      modalOffset.dx,
      TvCardWidth.six.value + FollowingScreenDesign.channelModalGap,
    );
    expect(modalOffset.dy, lessThan(0));
    final screenHeight =
        tester.view.physicalSize.height / tester.view.devicePixelRatio;
    expect(
      520 + modalOffset.dy + FollowingScreenDesign.channelModalEstimatedHeight,
      screenHeight - TvModalPanelDesign.standardOuterSpacing.vertical / 2,
    );
  });

  testWidgets('renders group list in the same anchored modal', (tester) async {
    final modalNode = FocusScopeNode(debugLabel: 'test following modal');
    final openerNode = FocusNode(debugLabel: 'test channel opener');
    final anchorLink = LayerLink();
    const channel = FollowingChannel(
      channelId: 'channel',
      channelName: 'Modal Channel',
      verifiedMark: true,
      openLive: false,
    );
    const groups = [
      GroupItem(
        id: 'group-a',
        groupName: 'Group A',
        memberChannelIds: ['channel'],
      ),
      GroupItem(id: 'group-b', groupName: 'Group B'),
    ];
    GroupItem? selectedGroup;
    addTearDown(modalNode.dispose);
    addTearDown(openerNode.dispose);

    await _pumpChannelModalHarness(
      tester,
      modalNode: modalNode,
      openerNode: openerNode,
      anchorLink: anchorLink,
      channel: channel,
      showModal: true,
      modalView: FollowingChannelModalView.groupList,
      groups: groups,
      onAddToGroup: (_, group) => selectedGroup = group,
    );

    expect(find.text(FollowingScreenString.groupListTitle), findsOneWidget);
    expect(find.text('Modal Channel'), findsNothing);
    expect(find.text('Group A'), findsOneWidget);
    expect(find.text('Group B'), findsOneWidget);
    expect(find.byIcon(Icons.folder_rounded), findsNothing);
    expect(find.byIcon(Icons.check_rounded), findsNothing);
    expect(
      tester
          .getSize(
            find.byKey(const ValueKey('following-channel-modal-content')),
          )
          .height,
      160,
    );
    expect(
      tester
          .widget<TvDenseListItem>(
            find.widgetWithText(TvDenseListItem, 'Group A'),
          )
          .autofocus,
      true,
    );
    final modalOffset = tester
        .widget<CompositedTransformFollower>(
          find.byType(CompositedTransformFollower),
        )
        .offset;

    expect(
      modalOffset.dx,
      TvCardWidth.six.value + FollowingScreenDesign.channelModalGap,
    );

    tester
        .widget<TvDenseListItem>(
          find.widgetWithText(TvDenseListItem, 'Group B'),
        )
        .onPressed();

    expect(selectedGroup?.id, 'group-b');
  });

  testWidgets('dismisses group list modal from empty group action', (
    tester,
  ) async {
    final modalNode = FocusScopeNode(debugLabel: 'test following modal');
    final openerNode = FocusNode(debugLabel: 'test channel opener');
    final anchorLink = LayerLink();
    var dismissed = false;
    const channel = FollowingChannel(
      channelId: 'channel',
      channelName: 'Modal Channel',
      verifiedMark: false,
      openLive: false,
    );
    addTearDown(modalNode.dispose);
    addTearDown(openerNode.dispose);

    await _pumpChannelModalHarness(
      tester,
      modalNode: modalNode,
      openerNode: openerNode,
      anchorLink: anchorLink,
      channel: channel,
      showModal: true,
      modalView: FollowingChannelModalView.groupList,
      onDismiss: () => dismissed = true,
    );

    final emptyAction = tester.widget<TvDenseListItem>(
      find.widgetWithText(
        TvDenseListItem,
        FollowingScreenString.groupListEmpty,
      ),
    );

    expect(emptyAction.autofocus, true);
    expect(find.byIcon(Icons.folder_off_rounded), findsNothing);

    emptyAction.onPressed();

    expect(dismissed, true);
  });

  testWidgets('enables Watch Live when openLive is true', (
    tester,
  ) async {
    final modalNode = FocusScopeNode(debugLabel: 'test following modal');
    final openerNode = FocusNode(debugLabel: 'test channel opener');
    final anchorLink = LayerLink();
    const channel = FollowingChannel(
      channelId: 'channel',
      channelName: 'Live Channel',
      verifiedMark: false,
      openLive: true,
    );
    addTearDown(modalNode.dispose);
    addTearDown(openerNode.dispose);

    await _pumpChannelModalHarness(
      tester,
      modalNode: modalNode,
      openerNode: openerNode,
      anchorLink: anchorLink,
      channel: channel,
      showModal: true,
    );

    final watchLive = tester.widget<TvDenseListItem>(
      find.widgetWithText(TvDenseListItem, FollowingScreenString.watchLive),
    );

    expect(watchLive.enabled, true);
    expect(watchLive.autofocus, true);
  });

  testWidgets('renders follow action for an unfollowed channel', (
    tester,
  ) async {
    final modalNode = FocusScopeNode(debugLabel: 'test following modal');
    final openerNode = FocusNode(debugLabel: 'test channel opener');
    final anchorLink = LayerLink();
    const channel = FollowingChannel(
      channelId: 'channel',
      channelName: 'Modal Channel',
      verifiedMark: false,
      openLive: false,
      personalData: FollowingPersonalData(
        following: false,
        notification: false,
        privateUserBlock: false,
      ),
    );
    addTearDown(modalNode.dispose);
    addTearDown(openerNode.dispose);

    await _pumpChannelModalHarness(
      tester,
      modalNode: modalNode,
      openerNode: openerNode,
      anchorLink: anchorLink,
      channel: channel,
      showModal: true,
    );

    expect(find.text(FollowingScreenString.follow), findsOneWidget);
    expect(find.text(FollowingScreenString.unfollow), findsNothing);
  });

  testWidgets('renders channel live badge without status text', (tester) async {
    const channel = FollowingChannel(
      channelId: 'channel',
      channelName: 'Channel',
      verifiedMark: false,
      openLive: true,
      liveInfo: FollowingLiveInfo(
        liveId: 1,
        title: 'Live title',
        concurrentUserCount: 1200,
        adult: false,
      ),
    );

    await _pumpLayout(
      tester,
      state: FollowingState.initial().copyWith(
        isSignedIn: true,
        selectedTab: FollowingTab.channel,
        channel: followingSectionReady([channel]),
      ),
    );

    expect(find.text('LIVE'), findsOneWidget);
    expect(find.text('OFFLINE'), findsNothing);
    expect(find.byType(TvMediaChannelName), findsOneWidget);
    expect(
      tester.widget<TvMediaChannelName>(find.byType(TvMediaChannelName)),
      isA<TvMediaChannelName>()
          .having((widget) => widget.textAlign, 'textAlign', TextAlign.center)
          .having(
            (widget) => widget.mainAxisAlignment,
            'mainAxisAlignment',
            MainAxisAlignment.center,
          ),
    );
    expect(tester.widget<Text>(find.text('Channel')).style?.fontSize, 12);
    final grid = tester.widget<TvGrid>(find.byType(TvGrid));
    final gridPadding = grid.padding! as EdgeInsets;

    expect(grid.mainAxisExtent, FollowingScreenDesign.channelCardHeight);
    expect(grid.clipBehavior, Clip.hardEdge);
    expect(
      FollowingScreenDesign.channelCardDesign().focusedScale,
      TvFocusedScale.lg.value,
    );
    expect(grid.mainAxisSpacing, FollowingScreenDesign.gridMainAxisGap);
    expect(grid.crossAxisSpacing, FollowingScreenDesign.gridCrossAxisGap);
    expect(gridPadding.top, FollowingScreenDesign.gridFocusPaintPadding);
    expect(FollowingScreenDesign.channelCardHeight, 128);
  });

  testWidgets('renders live sort panel as a large modal', (tester) async {
    final node = FocusScopeNode(debugLabel: 'test following sort panel');
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
          body: FollowingSortPanel(
            node: node,
            selectedOption: FollowingLiveSortOption.popular,
            onSelected: (_) {},
            onDismiss: () {},
          ),
        ),
      ),
    );

    expect(
      tester.widget<TvModalPanel>(find.byType(TvModalPanel)).type,
      TvModalPanelType.large,
    );
  });

  testWidgets('renders shared category poster card', (
    tester,
  ) async {
    const category = CategoryItem(
      categoryId: 'category',
      categoryType: 'GAME',
      title: 'Category',
      posterImageUrl: null,
      openLiveCount: 1,
      concurrentUserCount: 10,
    );

    await _pumpLayout(
      tester,
      state: FollowingState.initial().copyWith(
        isSignedIn: true,
        selectedTab: FollowingTab.category,
        category: followingSectionReady([category]),
      ),
    );

    expect(find.byType(CategoryPosterCard), findsOneWidget);
    expect(
      tester.widget<Text>(find.text('Category')).style?.fontSize,
      CategoryPosterCardDesign.compactBadgeFontSize,
    );
    expect(
      tester.widget<Text>(find.text('1')).style?.fontSize,
      CategoryPosterCardDesign.compactBadgeFontSize,
    );
    expect(
      tester.widget<Text>(find.text('10')).style?.fontSize,
      CategoryPosterCardDesign.compactBadgeFontSize,
    );
    expect(
      tester.widget<TvCard>(find.byType(TvCard)).design?.focusedScale,
      FollowingScreenDesign.itemFocusedScale.value,
    );
  });
}

Future<void> _pumpLayout(
  WidgetTester tester, {
  required FollowingState state,
}) async {
  final nodes = _FollowingLayoutNodes();
  addTearDown(nodes.dispose);

  await _pumpLayoutWithNodes(tester, state: state, nodes: nodes);
}

Future<void> _pumpLayoutWithNodes(
  WidgetTester tester, {
  required FollowingState state,
  required _FollowingLayoutNodes nodes,
}) async {
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
          child: FollowingLayout(
            state: state,
            tabsNode: nodes.tabsNode,
            gridNode: nodes.gridNode,
            focusRegistry: nodes.focusRegistry,
            onAuthPressed: () {},
            onTabSelected: (_) {},
            onSortPressed: () {},
            onRetry: () {},
            onLoadMore: () {},
            onLivePressed: (_) {},
            onVodPressed: (_) {},
            onChannelPressed: (_, _) {},
            onCategoryPressed: (_) {},
          ),
        ),
      ),
    ),
  );
}

Future<void> _pumpChannelModalHarness(
  WidgetTester tester, {
  required FocusScopeNode modalNode,
  required FocusNode openerNode,
  required LayerLink anchorLink,
  required FollowingChannel channel,
  required bool showModal,
  FollowingChannelModalView modalView = FollowingChannelModalView.actions,
  List<GroupItem> groups = const <GroupItem>[],
  FollowingChannelGroupCallback? onAddToGroup,
  VoidCallback? onDismiss,
}) async {
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
          width: 1280,
          height: 720,
          child: Stack(
            children: [
              Positioned(
                left: 96,
                top: 520,
                child: CompositedTransformTarget(
                  link: anchorLink,
                  child: Focus(
                    focusNode: openerNode,
                    child: SizedBox(
                      width: TvCardWidth.six.value,
                      height: FollowingScreenDesign.channelCardHeight,
                    ),
                  ),
                ),
              ),
              if (showModal)
                FollowingChannelModal(
                  modalState: FollowingChannelModalState(
                    channel: channel,
                    index: 0,
                    view: modalView,
                    groups: groups,
                  ),
                  node: modalNode,
                  openerNode: openerNode,
                  anchorLink: anchorLink,
                  onWatchLive: (_) {},
                  onMoveToChannel: (_) {},
                  onFollow: (_) {},
                  onUnfollow: (_) {},
                  onShowGroupList: (_) {},
                  onAddToGroup: onAddToGroup ?? (_, _) {},
                  onDismiss: onDismiss ?? () {},
                ),
            ],
          ),
        ),
      ),
    ),
  );
}

final class _FollowingLayoutNodes {
  final tabsNode = FocusScopeNode(debugLabel: 'test following tabs');
  final gridNode = FocusScopeNode(debugLabel: 'test following grid');
  final focusRegistry = FollowingChannelFocusRegistry();

  void dispose() {
    tabsNode.dispose();
    gridNode.dispose();
    focusRegistry.dispose();
  }
}
