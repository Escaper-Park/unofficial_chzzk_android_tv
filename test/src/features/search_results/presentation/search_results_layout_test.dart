import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/ui/ui.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/presentation/view/shared/live_card.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search_results/domain/entities/search_results.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search_results/presentation/bloc/search_results_bloc.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search_results/presentation/search_results_screen_design.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search_results/presentation/search_results_screen_string.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search_results/presentation/view/layout/search_results_layout.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search_results/presentation/view/sections/channel/search_results_channel_card.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search_results/presentation/view/sections/header/search_results_header.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/presentation/view/shared/vod_card.dart';

void main() {
  testWidgets('header uses AppShell height and query result title', (
    tester,
  ) async {
    await tester.pumpWidget(
      const _Harness(
        child: SearchResultsHeader(query: 'game'),
      ),
    );

    final header = tester.widget<SizedBox>(
      find.ancestor(
        of: find.text(SearchResultsScreenString.headerTitle('game')),
        matching: find.byType(SizedBox),
      ),
    );
    expect(header.height, SearchResultsScreenDesign.headerHeight);
  });

  testWidgets('renders channel, live, and VOD rails in fixed order', (
    tester,
  ) async {
    await _pumpLayout(
      tester,
      state: SearchResultsState.initial().copyWith(
        status: SearchResultsLoadStatus.ready,
        channels: [_channelResult],
        lives: [_liveResult],
        videos: [_videoResult],
      ),
    );

    expect(
      find.text(SearchResultsScreenString.channelRailTitle),
      findsOneWidget,
    );
    expect(find.text(SearchResultsScreenString.liveRailTitle), findsOneWidget);
    expect(find.text(SearchResultsScreenString.vodRailTitle), findsOneWidget);
    expect(find.text('Channel'), findsOneWidget);
    expect(find.text('Live'), findsOneWidget);
    expect(find.text('Video'), findsOneWidget);

    final titles = [
      tester
          .getTopLeft(
            find.text(SearchResultsScreenString.channelRailTitle),
          )
          .dy,
      tester.getTopLeft(find.text(SearchResultsScreenString.liveRailTitle)).dy,
      tester.getTopLeft(find.text(SearchResultsScreenString.vodRailTitle)).dy,
    ];
    expect(titles[0], lessThan(titles[1]));
    expect(titles[1], lessThan(titles[2]));

    final rails = tester.widgetList<TvRail>(find.byType(TvRail)).toList();
    expect(rails, hasLength(3));
    expect(
      rails[0].itemExtent,
      SearchResultsScreenDesign.channelCardWidth.value,
    );
    expect(rails[1].itemExtent, SearchResultsScreenDesign.mediaCardWidth);
    expect(rails[2].itemExtent, SearchResultsScreenDesign.mediaCardWidth);
    expect(rails.every((rail) => !rail.hasMore), isTrue);

    final scrollView = tester.widget<SingleChildScrollView>(
      find.byType(SingleChildScrollView),
    );
    expect(scrollView.clipBehavior, Clip.hardEdge);

    final scrollContentPadding = tester.widget<Padding>(
      find
          .ancestor(
            of: find.text(SearchResultsScreenString.channelRailTitle),
            matching: find.byType(Padding),
          )
          .last,
    );
    expect(
      scrollContentPadding.padding,
      const EdgeInsets.only(
        top: SearchResultsScreenDesign.contentTopPadding,
        bottom: SearchResultsScreenDesign.contentBottomPadding,
      ),
    );

    expect(find.byType(SearchResultsChannelCard), findsOneWidget);
    final channelCard = find.ancestor(
      of: find.text('Channel'),
      matching: find.byType(Card),
    );
    expect(
      tester.getSize(channelCard),
      Size(
        SearchResultsScreenDesign.channelCardWidth.value,
        SearchResultsScreenDesign.channelCardHeight,
      ),
    );
    expect(find.text('Description'), findsNothing);
  });

  testWidgets('initial focus starts at first available rail', (tester) async {
    await _pumpLayout(
      tester,
      state: SearchResultsState.initial().copyWith(
        status: SearchResultsLoadStatus.ready,
        lives: [_liveResult],
        videos: [_videoResult],
      ),
    );

    expect(find.text(SearchResultsScreenString.channelRailTitle), findsNothing);
    expect(tester.widget<LiveCard>(find.byType(LiveCard)).autofocus, isTrue);
    expect(tester.widget<VodCard>(find.byType(VodCard)).autofocus, isFalse);
  });

  testWidgets('focus targets are wired from visible rails', (tester) async {
    final allNodes = _SearchResultsLayoutNodes();
    addTearDown(allNodes.dispose);

    await _pumpLayout(
      tester,
      nodes: allNodes,
      state: SearchResultsState.initial().copyWith(
        status: SearchResultsLoadStatus.ready,
        channels: [_channelResult],
        lives: [_liveResult],
        videos: [_videoResult],
      ),
    );

    var rails = tester.widgetList<TvRail>(find.byType(TvRail)).toList();
    expect(rails[0].up, isNull);
    expect(rails[0].down, same(allNodes.liveRailNode));
    expect(rails[0].downEnsureVisibleScope, isTrue);
    expect(rails[1].up, same(allNodes.channelRailNode));
    expect(rails[1].down, same(allNodes.vodRailNode));
    expect(rails[1].upEnsureVisibleScope, isTrue);
    expect(rails[1].downEnsureVisibleScope, isTrue);
    expect(rails[2].up, same(allNodes.liveRailNode));
    expect(rails[2].down, isNull);
    expect(rails[2].upEnsureVisibleScope, isTrue);

    final noLiveNodes = _SearchResultsLayoutNodes();
    addTearDown(noLiveNodes.dispose);

    await _pumpLayout(
      tester,
      nodes: noLiveNodes,
      state: SearchResultsState.initial().copyWith(
        status: SearchResultsLoadStatus.ready,
        channels: [_channelResult],
        videos: [_videoResult],
      ),
    );

    rails = tester.widgetList<TvRail>(find.byType(TvRail)).toList();
    expect(rails, hasLength(2));
    expect(rails[0].down, same(noLiveNodes.vodRailNode));
    expect(rails[1].up, same(noLiveNodes.channelRailNode));

    final onlyVideoNodes = _SearchResultsLayoutNodes();
    addTearDown(onlyVideoNodes.dispose);

    await _pumpLayout(
      tester,
      nodes: onlyVideoNodes,
      state: SearchResultsState.initial().copyWith(
        status: SearchResultsLoadStatus.ready,
        videos: [_videoResult],
      ),
    );

    rails = tester.widgetList<TvRail>(find.byType(TvRail)).toList();
    expect(rails, hasLength(1));
    expect(rails.single.up, isNull);
    expect(rails.single.down, isNull);
  });

  testWidgets('ready empty state shows retry action', (tester) async {
    await _pumpLayout(
      tester,
      state: SearchResultsState.initial().copyWith(
        status: SearchResultsLoadStatus.ready,
      ),
    );

    expect(find.text(SearchResultsScreenString.empty), findsOneWidget);
    expect(find.text(SearchResultsScreenString.retry), findsOneWidget);
  });
}

Future<void> _pumpLayout(
  WidgetTester tester, {
  required SearchResultsState state,
  _SearchResultsLayoutNodes? nodes,
}) async {
  tester.view.physicalSize = const Size(960, 540);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);

  final layoutNodes = nodes ?? _SearchResultsLayoutNodes();
  if (nodes == null) {
    addTearDown(layoutNodes.dispose);
  }

  await tester.pumpWidget(
    _Harness(
      child: SizedBox(
        width: 960,
        height: 540,
        child: SearchResultsLayout(
          state: state,
          channelRailNode: layoutNodes.channelRailNode,
          liveRailNode: layoutNodes.liveRailNode,
          vodRailNode: layoutNodes.vodRailNode,
          stateNode: layoutNodes.stateNode,
          onRetry: () {},
          onChannelPressed: (_) {},
          onLivePressed: (_) {},
          onVodPressed: (_) {},
        ),
      ),
    ),
  );
}

class _Harness extends StatelessWidget {
  const _Harness({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColorTokens.brandColor,
          brightness: Brightness.dark,
        ),
      ),
      home: Scaffold(body: child),
    );
  }
}

final class _SearchResultsLayoutNodes {
  final channelRailNode = FocusScopeNode(
    debugLabel: 'test search results channel rail',
  );
  final liveRailNode = FocusScopeNode(
    debugLabel: 'test search results live rail',
  );
  final vodRailNode = FocusScopeNode(
    debugLabel: 'test search results vod rail',
  );
  final stateNode = FocusScopeNode(
    debugLabel: 'test search results state',
  );

  void dispose() {
    channelRailNode.dispose();
    liveRailNode.dispose();
    vodRailNode.dispose();
    stateNode.dispose();
  }
}

const _channelResult = SearchChannelResult(
  channel: SearchChannel(
    channelId: 'channel',
    channelName: 'Channel',
    verifiedMark: false,
    followerCount: 1234,
    description: 'Description',
    openLive: false,
  ),
);

const _liveResult = SearchLiveResult(
  channel: SearchChannel(
    channelId: 'live-channel',
    channelName: 'Live Channel',
    verifiedMark: false,
    followerCount: 0,
    description: '',
    openLive: true,
  ),
  live: SearchLive(
    liveId: 1,
    title: 'Live',
    concurrentUserCount: 1,
    adult: false,
  ),
);

const _videoResult = SearchVideoResult(
  channel: SearchChannel(
    channelId: 'vod-channel',
    channelName: 'VOD Channel',
    verifiedMark: false,
    followerCount: 0,
    description: '',
    openLive: false,
  ),
  video: SearchVideo(
    videoNo: 1,
    title: 'Video',
    videoType: 'REPLAY',
    publishDate: '2026-06-13',
    duration: 30,
    readCount: 1,
    publishDateAt: 1,
    adult: false,
    livePv: 0,
  ),
);
