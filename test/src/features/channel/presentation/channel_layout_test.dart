import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/tv/focus/focus.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/presentation/bloc/channel_bloc.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/presentation/channel_screen_design.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/presentation/view/layout/channel_layout.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_feed.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_feed.dart';

void main() {
  testWidgets('uses preferred home content node for tab down target', (
    tester,
  ) async {
    final nodes = await _pumpLayout(
      tester,
      state:
          ChannelState.initial(
            channelId: 'channel',
            isSignedIn: true,
          ).copyWith(
            homeStatus: ChannelLoadStatus.ready,
            live: _live(),
            latestVods: [_vod(1)],
          ),
      homePreferredContentNode: (nodes) => nodes.vodNode,
    );

    final tabExit = tester
        .widgetList<TvFocusExit>(find.byType(TvFocusExit))
        .firstWhere((exit) => exit.down == nodes.vodNode);

    expect(tabExit.downFocusAlignment, ChannelScreenDesign.liveFocusAlignment);
    expect(tabExit.downEnsureVisible, true);
    expect(tabExit.downEnsureVisibleScope, true);
  });

  testWidgets('does not auto-scroll vertically for VOD-only home content', (
    tester,
  ) async {
    final nodes = await _pumpLayout(
      tester,
      state:
          ChannelState.initial(
            channelId: 'channel',
            isSignedIn: true,
          ).copyWith(
            homeStatus: ChannelLoadStatus.ready,
            latestVods: [_vod(1)],
          ),
    );

    final tabExit = tester
        .widgetList<TvFocusExit>(find.byType(TvFocusExit))
        .firstWhere((exit) => exit.down == nodes.vodNode);

    expect(tabExit.downFocusAlignment, isNull);
    expect(tabExit.downEnsureVisible, false);
    expect(tabExit.downEnsureVisibleScope, false);
  });
}

Future<_LayoutNodes> _pumpLayout(
  WidgetTester tester, {
  required ChannelState state,
  FocusScopeNode? Function(_LayoutNodes nodes)? homePreferredContentNode,
}) async {
  tester.view.physicalSize = const Size(960, 540);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);

  final nodes = _LayoutNodes();
  addTearDown(nodes.dispose);

  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: ChannelLayout(
          state: state,
          tabsNode: nodes.tabsNode,
          homeStateNode: nodes.stateNode,
          homeLiveNode: nodes.liveNode,
          homeVodNode: nodes.vodNode,
          homePreferredContentNode: homePreferredContentNode?.call(nodes),
          vodGridNode: nodes.gridNode,
          onTabSelected: (_) {},
          onSortPressed: () {},
          onFollowPressed: () {},
          onGroupPressed: () {},
          onRetry: () {},
          onLoadMore: () {},
          onLivePressed: (_) {},
          onVodPressed: (_) {},
        ),
      ),
    ),
  );

  return nodes;
}

final class _LayoutNodes {
  final tabsNode = FocusScopeNode(debugLabel: 'tabs');
  final stateNode = FocusScopeNode(debugLabel: 'state');
  final liveNode = FocusScopeNode(debugLabel: 'live');
  final vodNode = FocusScopeNode(debugLabel: 'vod');
  final gridNode = FocusScopeNode(debugLabel: 'grid');

  void dispose() {
    tabsNode.dispose();
    stateNode.dispose();
    liveNode.dispose();
    vodNode.dispose();
    gridNode.dispose();
  }
}

Live _live() {
  return const Live(
    liveId: 1,
    title: 'Live',
    concurrentUserCount: 100,
    adult: false,
  );
}

Vod _vod(int id) {
  return Vod(
    videoNo: id,
    title: 'Vod $id',
    videoType: 'REPLAY',
    publishDate: '2026-06-14',
    duration: 60,
    readCount: 100,
    publishDateAt: id,
    adult: false,
    livePv: 0,
  );
}
