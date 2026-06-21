import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/tv/keyboard/keyboard.dart';
import 'package:unofficial_chzzk_android_tv/src/core/ui/ui.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/entities/channel_detail.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/entities/channel_video.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/repositories/channel_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/group/domain/entities/group_collection.dart';
import 'package:unofficial_chzzk_android_tv/src/features/group/domain/repositories/group_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/group/presentation/group_screen.dart';
import 'package:unofficial_chzzk_android_tv/src/features/group/presentation/group_screen_design.dart';
import 'package:unofficial_chzzk_android_tv/src/features/group/presentation/group_screen_string.dart';
import 'package:unofficial_chzzk_android_tv/src/features/group/presentation/models/group_screen_models.dart';
import 'package:unofficial_chzzk_android_tv/src/features/group/presentation/view/layout/group_layout.dart';
import 'package:unofficial_chzzk_android_tv/src/features/group/presentation/view/sections/group_content/group_channel_modal.dart';
import 'package:unofficial_chzzk_android_tv/src/features/group/presentation/view/shared/group_channel_focus_registry.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/presentation/settings_screen_design.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_sort.dart';

void main() {
  testWidgets('renders empty group state with create action', (tester) async {
    await _pumpLayout(tester);

    expect(find.text(GroupScreenString.tabLabel(GroupTab.group)), findsWidgets);
    expect(
      find.text(GroupScreenString.tabLabel(GroupTab.create)),
      findsWidgets,
    );
    expect(find.text(GroupScreenString.groupsEmpty), findsOneWidget);
    expect(find.text(GroupScreenString.createAction), findsWidgets);
    expect(find.byType(SplitListLayout), findsOneWidget);
  });

  testWidgets('renders selected group actions before channel list', (
    tester,
  ) async {
    const group = GroupItem(
      id: 'group-1',
      groupName: '즐겨찾는 채널',
      memberChannelIds: ['channel-1'],
    );
    const members = [
      GroupMemberItem(
        channelId: 'channel-1',
        channelName: '테스트 채널',
        profileImageUrl: 'https://example.com/profile.jpg',
        verifiedMark: true,
        openLive: true,
        liveId: 1,
      ),
    ];

    await _pumpLayout(
      tester,
      groups: const [group],
      selectedGroupMembers: members,
      selectedGroupId: group.id,
      activeGroupId: group.id,
    );

    expect(find.text(group.groupName), findsNWidgets(2));
    expect(find.text(GroupScreenString.activateGroup), findsOneWidget);
    expect(find.text(GroupScreenString.addMember), findsOneWidget);
    expect(find.text(GroupScreenString.deleteGroup), findsOneWidget);
    expect(find.text('테스트 채널'), findsOneWidget);

    final activateFinder = find.byKey(
      ValueKey('group-content-activate-${group.id}'),
    );
    final activateItem = tester.widget<TvListItem>(activateFinder);
    final activateIconFinder = find.descendant(
      of: activateFinder,
      matching: find.byIcon(Icons.star_rounded),
    );
    final activateTitleFinder = find.descendant(
      of: activateFinder,
      matching: find.text(GroupScreenString.activateGroup),
    );

    expect(
      activateItem.design?.height,
      GroupScreenDesign.oneLineListItemHeight,
    );
    expect(
      tester.getSize(activateFinder).height,
      GroupScreenDesign.oneLineListItemHeight,
    );
    expect(tester.getSize(activateIconFinder), const Size.square(32));
    expect(
      (tester.getCenter(activateIconFinder).dy -
              tester.getCenter(activateFinder).dy)
          .abs(),
      lessThan(1),
    );
    expect(
      (tester.getCenter(activateTitleFinder).dy -
              tester.getCenter(activateFinder).dy)
          .abs(),
      lessThan(1),
    );

    final deleteFinder = find.byKey(
      ValueKey('group-content-delete-${group.id}'),
    );
    final channelFinder = find.byKey(
      ValueKey('group-channel-${group.id}-channel-1'),
    );
    final channelItem = tester.widget<TvListItem>(channelFinder);
    final channelAvatarFinder = find.descendant(
      of: channelFinder,
      matching: find.byType(ProfileCircleAvatar),
    );
    final channelNameFinder = find.descendant(
      of: channelFinder,
      matching: find.byType(TvMediaChannelName),
    );
    final channelAvatar = tester.widget<ProfileCircleAvatar>(
      channelAvatarFinder,
    );
    final channelName = tester.widget<TvMediaChannelName>(channelNameFinder);
    final channelLiveRing = find.descendant(
      of: channelAvatarFinder,
      matching: find.byWidgetPredicate((widget) {
        if (widget is! DecoratedBox || widget.decoration is! BoxDecoration) {
          return false;
        }

        final decoration = widget.decoration as BoxDecoration;
        return decoration.border != null;
      }),
    );
    final channelLiveRingBox = tester.widget<DecoratedBox>(channelLiveRing);
    final channelLiveRingDecoration =
        channelLiveRingBox.decoration as BoxDecoration;
    final channelLiveRingBorder = channelLiveRingDecoration.border! as Border;

    expect(
      tester.getTopLeft(channelFinder).dy -
          tester.getBottomLeft(deleteFinder).dy,
      GroupScreenDesign.rowGap,
    );
    expect(channelAvatar.imageUrl, 'https://example.com/profile.jpg');
    expect(channelAvatar.openLive, isTrue);
    expect(channelAvatar.radius, GroupScreenDesign.memberAvatarRadius);
    expect(channelItem.trailing, isNull);
    expect(channelName.channelName, '테스트 채널');
    expect(channelName.verified, isTrue);
    expect(channelLiveRingBorder.top.color, AppColorTokens.brandColor);
    expect(
      find.descendant(
        of: channelFinder,
        matching: find.byIcon(Icons.play_circle_rounded),
      ),
      findsNothing,
    );
    expect(
      find.descendant(
        of: channelFinder,
        matching: find.byIcon(Icons.account_circle_rounded),
      ),
      findsNothing,
    );
  });

  testWidgets('enables watch live for open member without live id', (
    tester,
  ) async {
    final modalNode = FocusScopeNode(debugLabel: 'test group channel modal');
    addTearDown(modalNode.dispose);
    var watchedChannelId = '';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: GroupChannelModal(
            group: const GroupItem(id: 'group-1', groupName: 'Group'),
            channel: const GroupMemberItem(
              channelId: 'channel-1',
              channelName: 'Channel',
              openLive: true,
            ),
            node: modalNode,
            openerNode: null,
            onWatchLive: (channel) => watchedChannelId = channel.channelId,
            onMoveToChannel: (_) {},
            onRemoveFromGroup: (_) {},
            onDismiss: () {},
          ),
        ),
      ),
    );

    final watchLiveItem = tester.widget<TvDenseListItem>(
      find.widgetWithText(TvDenseListItem, GroupScreenString.watchLive),
    );
    expect(watchLiveItem.enabled, isTrue);
    expect(watchLiveItem.autofocus, isTrue);

    await tester.tap(find.text(GroupScreenString.watchLive));

    expect(watchedChannelId, 'channel-1');
  });

  testWidgets('renders no member placeholder for empty selected group', (
    tester,
  ) async {
    const group = GroupItem(id: 'group-1', groupName: 'empty group');

    await _pumpLayout(
      tester,
      groups: const [group],
      selectedGroupId: group.id,
      activeGroupId: group.id,
    );

    expect(find.text(GroupScreenString.activateGroup), findsOneWidget);
    expect(find.text(GroupScreenString.addMember), findsOneWidget);
    expect(find.text(GroupScreenString.deleteGroup), findsOneWidget);
    expect(
      find.byKey(const ValueKey('group-channel-group-1-channel-1')),
      findsNothing,
    );
    expect(find.byType(TvListItem), findsNWidgets(4));
  });

  testWidgets('renders group list rows as one-line names with active check', (
    tester,
  ) async {
    const activeGroup = GroupItem(id: 'group-1', groupName: '활성 그룹');
    const inactiveGroup = GroupItem(id: 'group-2', groupName: '일반 그룹');

    await _pumpLayout(
      tester,
      groups: const [activeGroup, inactiveGroup],
      selectedGroupId: activeGroup.id,
      activeGroupId: activeGroup.id,
    );

    final activeFinder = find.byKey(
      ValueKey('group-list-${activeGroup.id}'),
    );
    final inactiveFinder = find.byKey(
      ValueKey('group-list-${inactiveGroup.id}'),
    );
    final activeItem = tester.widget<TvListItem>(activeFinder);
    final inactiveItem = tester.widget<TvListItem>(inactiveFinder);
    final headerFinder = find.widgetWithText(
      TvListHeader,
      GroupScreenString.groupsTitle,
    );

    expect(activeItem.subtitle, isNull);
    expect(activeItem.icon, isNull);
    expect(activeItem.action, isNull);
    expect(activeItem.trailing, isNotNull);
    expect(activeItem.design?.height, GroupScreenDesign.oneLineListItemHeight);
    expect(
      tester.getSize(activeFinder).height,
      GroupScreenDesign.oneLineListItemHeight,
    );
    expect(
      find.descendant(
        of: activeFinder,
        matching: find.byIcon(Icons.check_rounded),
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: inactiveFinder,
        matching: find.byIcon(Icons.check_rounded),
      ),
      findsNothing,
    );
    expect(inactiveItem.trailing, isNull);
    expect(
      tester.getTopLeft(activeFinder).dy -
          tester.getBottomLeft(headerFinder).dy,
      GroupScreenDesign.listVerticalPadding,
    );
    expect(
      GroupScreenDesign.listViewportPadding.bottom +
          GroupScreenDesign.listContentPadding.bottom,
      GroupScreenDesign.listBottomPadding,
    );
  });

  testWidgets('renders create tab with input content layout', (tester) async {
    await _pumpLayout(
      tester,
      selectedTab: GroupTab.create,
    );

    expect(find.byType(InputContentLayout), findsOneWidget);
    expect(find.byType(TvTextField), findsOneWidget);
    expect(find.text(GroupScreenString.createInputHint), findsOneWidget);
    expect(find.text(GroupScreenString.createAction), findsOneWidget);
    expect(find.byType(TvButton), findsNothing);
  });

  testWidgets('opens keyboard when create tab is selected', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColorTokens.brandColor,
            brightness: Brightness.dark,
          ),
        ),
        home: MultiRepositoryProvider(
          providers: [
            RepositoryProvider<GroupRepository>(
              create: (_) => _FakeGroupRepository(),
            ),
            RepositoryProvider<ChannelRepository>(
              create: (_) => _FakeChannelRepository(),
            ),
          ],
          child: const Scaffold(
            body: SizedBox(
              width: 960,
              height: 540,
              child: GroupScreen(),
            ),
          ),
        ),
      ),
    );
    await tester.pump();

    await tester.tap(
      find.text(GroupScreenString.tabLabel(GroupTab.create)).first,
    );
    await tester.pump();

    expect(find.byType(TvKeyboard), findsOneWidget);
  });

  testWidgets('back from empty action falls back to first tab', (
    tester,
  ) async {
    await _pumpGroupScreen(tester);
    await tester.pump();

    final groupTab = tester.widget<TextButton>(
      find
          .widgetWithText(
            TextButton,
            GroupScreenString.tabLabel(GroupTab.group),
          )
          .first,
    );
    final createAction = tester.widget<FilledButton>(
      find.widgetWithText(FilledButton, GroupScreenString.createAction).first,
    );

    createAction.focusNode!.requestFocus();
    await tester.pump();

    await tester.binding.handlePopRoute();
    await tester.pump();

    expect(groupTab.focusNode!.hasFocus, isTrue);
  });

  testWidgets('back from empty action restores remembered tab focus', (
    tester,
  ) async {
    await _pumpGroupScreen(tester);
    await tester.pump();

    final createTab = tester.widget<TextButton>(
      find.widgetWithText(
        TextButton,
        GroupScreenString.tabLabel(GroupTab.create),
      ),
    );
    final createAction = tester.widget<FilledButton>(
      find.widgetWithText(FilledButton, GroupScreenString.createAction),
    );

    createTab.focusNode!.requestFocus();
    await tester.pump();
    createAction.focusNode!.requestFocus();
    await tester.pump();

    await tester.binding.handlePopRoute();
    await tester.pump();

    expect(createTab.focusNode!.hasFocus, isTrue);
  });

  testWidgets('keeps vertical list focus on up instead of moving to tabs', (
    tester,
  ) async {
    const group = GroupItem(id: 'group-1', groupName: '그룹');
    final nodes = _GroupLayoutNodes();
    addTearDown(nodes.dispose);

    await _pumpLayoutWithNodes(
      tester,
      nodes: nodes,
      groups: const [group],
      selectedGroupId: group.id,
    );

    nodes.groupFirstNode.requestFocus();
    await tester.pump();
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
    await tester.pump();

    expect(nodes.groupListNode.hasFocus, isTrue);
    expect(nodes.tabsNode.hasFocus, isFalse);
  });

  testWidgets('uses group split column sizing and tab gap', (tester) async {
    tester.view.physicalSize = const Size(1280, 720);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await _pumpLayout(tester, viewportSize: const Size(1280, 720));

    final split = tester.widget<SplitListLayout>(find.byType(SplitListLayout));
    final gridContent = tester.widget<GridContentLayout>(
      find.byType(GridContentLayout),
    );

    expect(split.gap, GroupScreenDesign.columnGap);
    expect(
      split.leadingWidth,
      GroupScreenDesign.groupListPaneWidth(1280),
    );
    expect(
      split.leadingWidth,
      SettingsScreenDesign.menuPaneWidth(1280),
    );
    expect(
      split.trailingWidth,
      GroupScreenDesign.contentPaneWidth(1280),
    );
    expect(
      split.trailingWidth,
      SettingsScreenDesign.detailsPaneWidth(1280),
    );
    expect(
      GroupScreenDesign.contentPanePadding(1280),
      SettingsScreenDesign.detailsPanePadding(1280),
    );
    expect(gridContent.headerContentGap, 24);
  });
}

Future<void> _pumpGroupScreen(WidgetTester tester) {
  return tester.pumpWidget(
    MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColorTokens.brandColor,
          brightness: Brightness.dark,
        ),
      ),
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<GroupRepository>(
            create: (_) => _FakeGroupRepository(),
          ),
          RepositoryProvider<ChannelRepository>(
            create: (_) => _FakeChannelRepository(),
          ),
        ],
        child: const Scaffold(
          body: SizedBox(
            width: 960,
            height: 540,
            child: GroupScreen(),
          ),
        ),
      ),
    ),
  );
}

Future<void> _pumpLayout(
  WidgetTester tester, {
  GroupTab selectedTab = GroupTab.group,
  List<GroupItem> groups = const [],
  List<GroupMemberItem> selectedGroupMembers = const [],
  String? selectedGroupId,
  String? activeGroupId,
  String createInputValue = '',
  Size viewportSize = const Size(960, 540),
}) async {
  final nodes = _GroupLayoutNodes();
  addTearDown(nodes.dispose);

  await _pumpLayoutWithNodes(
    tester,
    nodes: nodes,
    selectedTab: selectedTab,
    groups: groups,
    selectedGroupMembers: selectedGroupMembers,
    selectedGroupId: selectedGroupId,
    activeGroupId: activeGroupId,
    createInputValue: createInputValue,
    viewportSize: viewportSize,
  );
}

Future<void> _pumpLayoutWithNodes(
  WidgetTester tester, {
  required _GroupLayoutNodes nodes,
  GroupTab selectedTab = GroupTab.group,
  List<GroupItem> groups = const [],
  List<GroupMemberItem> selectedGroupMembers = const [],
  String? selectedGroupId,
  String? activeGroupId,
  String createInputValue = '',
  Size viewportSize = const Size(960, 540),
}) async {
  final selectedGroup = groups.isEmpty
      ? null
      : groups.firstWhere(
          (group) => group.id == selectedGroupId,
          orElse: () => groups.first,
        );

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
          width: viewportSize.width,
          height: viewportSize.height,
          child: GroupLayout(
            selectedTab: selectedTab,
            groups: groups,
            selectedGroupId: selectedGroupId,
            activeGroupId: activeGroupId,
            selectedGroup: selectedGroup,
            selectedGroupMembers: selectedGroupMembers,
            createInputValue: createInputValue,
            isKeyboardOpen: false,
            tabsNode: nodes.tabsNode,
            groupListNode: nodes.groupListNode,
            groupContentNode: nodes.groupContentNode,
            createNode: nodes.createNode,
            keyboardNode: nodes.keyboardNode,
            groupFirstNode: nodes.groupFirstNode,
            contentFirstNode: nodes.contentFirstNode,
            focusRegistry: nodes.focusRegistry,
            onTabSelected: (_) {},
            onGroupSelected: (_) {},
            onCreateTabPressed: () {},
            onCreateInputPressed: () {},
            onActivateGroup: (_) {},
            onAddMemberPressed: () {},
            onDeleteGroup: (_) {},
            onChannelPressed: (_, _) {},
          ),
        ),
      ),
    ),
  );
}

final class _GroupLayoutNodes {
  final tabsNode = FocusScopeNode(debugLabel: 'test group tabs');
  final groupListNode = FocusScopeNode(debugLabel: 'test group list');
  final groupContentNode = FocusScopeNode(debugLabel: 'test group content');
  final createNode = FocusScopeNode(debugLabel: 'test group create');
  final keyboardNode = FocusScopeNode(debugLabel: 'test group keyboard');
  final groupFirstNode = FocusNode(debugLabel: 'test group first item');
  final contentFirstNode = FocusNode(debugLabel: 'test content first item');
  final focusRegistry = GroupChannelFocusRegistry();

  void dispose() {
    tabsNode.dispose();
    groupListNode.dispose();
    groupContentNode.dispose();
    createNode.dispose();
    keyboardNode.dispose();
    groupFirstNode.dispose();
    contentFirstNode.dispose();
    focusRegistry.dispose();
  }
}

final class _FakeGroupRepository implements GroupRepository {
  GroupCollection collection = defaultGroupCollection;

  @override
  Future<GroupCollection> read() async => collection;

  @override
  Future<void> save(GroupCollection collection) async {
    this.collection = collection;
  }

  @override
  Future<GroupCreateResult> createGroup({required String groupName}) async {
    collection = collection.copyWith(
      groups: [
        ...collection.groups,
        GroupItem(id: groupName, groupName: groupName),
      ],
    );
    return GroupCreateResult.success;
  }

  @override
  Future<GroupMutationResult> deleteGroup({required String groupId}) async {
    return GroupMutationResult.success;
  }

  @override
  Future<GroupActivationResult> activateGroup({
    required String groupId,
  }) async {
    return GroupActivationResult.activated;
  }

  @override
  Future<GroupMutationResult> removeMember({
    required String groupId,
    required String channelId,
  }) async {
    return GroupMutationResult.success;
  }

  @override
  Future<GroupAddMemberResult> addMember({
    required String groupId,
    required String channelId,
  }) async {
    return GroupAddMemberResult.added;
  }
}

final class _FakeChannelRepository implements ChannelRepository {
  @override
  Future<ChannelDetail> getChannel({required String channelId}) {
    return _unsupportedFakeOperation('ChannelRepository.getChannel');
  }

  @override
  Future<Never> getMyInfo({required String channelId}) {
    return _unsupportedFakeOperation('ChannelRepository.getMyInfo');
  }

  @override
  Future<ChannelVideoPage> getChannelVideos({
    required String channelId,
    VodSort? sortType,
    int? page,
    int? size,
    String? publishDateAt,
    String? videoType,
  }) {
    return _unsupportedFakeOperation('ChannelRepository.getChannelVideos');
  }

  @override
  Future<void> followChannel({required String channelId}) async {}

  @override
  Future<void> unfollowChannel({required String channelId}) async {}

  @override
  Future<void> enableChannelNotification({required String channelId}) async {}

  @override
  Future<void> disableChannelNotification({required String channelId}) async {}
}

Never _unsupportedFakeOperation(String operation) {
  throw UnsupportedError(
    'Unsupported fake operation: $operation. Provide a focused fake '
    'implementation for this test.',
  );
}
