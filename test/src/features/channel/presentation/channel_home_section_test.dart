import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/tv/focus/focus.dart';
import 'package:unofficial_chzzk_android_tv/src/core/ui/ui.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/presentation/bloc/channel_bloc.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/presentation/channel_screen_design.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/presentation/view/sections/home/channel_home_section.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/presentation/view/sections/home/channel_live_card.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_feed.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_feed.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/presentation/view/shared/vod_card.dart';

void main() {
  testWidgets('autofocuses live item before latest VODs', (tester) async {
    await _pumpHomeSection(
      tester,
      state: _readyState(
        live: _live(),
        latestVods: [_vod(1)],
      ),
    );

    final liveCard = tester.widget<ChannelLiveCard>(
      find.byType(ChannelLiveCard),
    );
    final vodCard = tester.widget<VodCard>(find.byType(VodCard));

    expect(liveCard.autofocus, true);
    expect(vodCard.autofocus, false);
  });

  testWidgets('autofocuses first VOD item when live is absent', (tester) async {
    await _pumpHomeSection(
      tester,
      state: _readyState(latestVods: [_vod(1), _vod(2)]),
    );

    final vodCards = tester.widgetList<VodCard>(find.byType(VodCard)).toList();
    final rail = tester.widget<TvRail>(find.byType(TvRail));

    expect(vodCards[0].autofocus, true);
    expect(vodCards[1].autofocus, false);
    expect(rail.upEnsureVisible, isFalse);
    expect(rail.upEnsureVisibleScope, isFalse);
  });

  testWidgets('returns from VOD rail to live with top alignment', (
    tester,
  ) async {
    await _pumpHomeSection(
      tester,
      state: _readyState(
        live: _live(),
        latestVods: [_vod(1)],
      ),
    );

    final rail = tester.widget<TvRail>(find.byType(TvRail));

    expect(rail.upFocusAlignment, ChannelScreenDesign.liveFocusAlignment);
    expect(rail.upEnsureVisible, isTrue);
    expect(rail.upEnsureVisibleScope, isTrue);
  });

  testWidgets('enters VOD rail from live using target scope', (
    tester,
  ) async {
    await _pumpHomeSection(
      tester,
      state: _readyState(
        live: _live(),
        latestVods: [_vod(1)],
      ),
    );

    final liveExit = tester
        .widgetList<TvFocusExit>(find.byType(TvFocusExit))
        .singleWhere((exit) => exit.down != null);

    expect(liveExit.downEnsureVisibleScope, isTrue);
  });

  testWidgets('autofocuses fallback button when no home content exists', (
    tester,
  ) async {
    await _pumpHomeSection(
      tester,
      state: _readyState(),
    );

    final button = tester.widget<TvButton>(find.byType(TvButton));

    expect(button.autofocus, true);
  });
}

Future<void> _pumpHomeSection(
  WidgetTester tester, {
  required ChannelState state,
}) async {
  final stateNode = FocusScopeNode(debugLabel: 'state');
  final liveNode = FocusScopeNode(debugLabel: 'live');
  final vodNode = FocusScopeNode(debugLabel: 'vod');
  final tabsNode = FocusScopeNode(debugLabel: 'tabs');

  addTearDown(stateNode.dispose);
  addTearDown(liveNode.dispose);
  addTearDown(vodNode.dispose);
  addTearDown(tabsNode.dispose);

  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: ChannelHomeSection(
          state: state,
          stateNode: stateNode,
          liveNode: liveNode,
          latestVodNode: vodNode,
          tabsNode: tabsNode,
          onRetry: () {},
          onLivePressed: (_) {},
          onVodPressed: (_) {},
        ),
      ),
    ),
  );
}

ChannelState _readyState({
  Live? live,
  List<Vod> latestVods = const <Vod>[],
}) {
  return ChannelState.initial(
    channelId: 'channel',
    isSignedIn: true,
  ).copyWith(
    homeStatus: ChannelLoadStatus.ready,
    live: live,
    latestVods: latestVods,
  );
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
