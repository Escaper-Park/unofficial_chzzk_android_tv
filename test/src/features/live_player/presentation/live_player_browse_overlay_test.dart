import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/ui/ui.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_detail.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_feed.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live_player/presentation/bloc/live_player_bloc.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live_player/presentation/view/live_player_browse_overlay.dart';

void main() {
  testWidgets('browse live card uses middle dot between viewer and category', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(960, 540);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final browseNode = FocusScopeNode();
    addTearDown(browseNode.dispose);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LivePlayerBrowseOverlay(
            state: LivePlayerState.initial().copyWith(
              browseStatus: LivePlayerBrowseLoadStatus.success,
              browseItems: const [
                Live(
                  liveId: 1,
                  title: 'Live title',
                  concurrentUserCount: 1234,
                  adult: false,
                  categoryValue: 'Game',
                  channel: LiveChannel(
                    channelId: 'channel-id',
                    channelName: 'Channel',
                    verifiedMark: false,
                  ),
                ),
              ],
            ),
            browseNode: browseNode,
            onInteraction: () {},
            onSectionUp: () {},
            onSectionDown: () {},
            onLoadMore: () {},
            onFallbackPressed: () {},
            onLiveSelected: (_) {},
            onReplacementClosed: () {},
            onReplacementSlotSelected: (_) {},
          ),
        ),
      ),
    );

    expect(find.text('1,234 · Game'), findsOneWidget);
    expect(find.text('1,234 - Game'), findsNothing);
  });

  testWidgets('replacement modal lists current slots by channel name', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(960, 540);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final browseNode = FocusScopeNode();
    addTearDown(browseNode.dispose);
    String? selectedSlotId;
    var closed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LivePlayerBrowseOverlay(
            state: LivePlayerState.initial().copyWith(
              viewMode: LivePlayerViewMode.multiview,
              overlayMode: LivePlayerOverlayMode.browse,
              activeSlotId: 'slot-b',
              slots: [
                _slot(
                  slotId: 'slot-a',
                  channelId: 'channel-a',
                  channelName: 'Channel A',
                ),
                _slot(
                  slotId: 'slot-b',
                  channelId: 'channel-b',
                  channelName: 'Channel B',
                ),
              ],
              browseStatus: LivePlayerBrowseLoadStatus.success,
              browseItems: const [_replacementLive],
              pendingReplacementLive: _replacementLive,
            ),
            browseNode: browseNode,
            onInteraction: () {},
            onSectionUp: () {},
            onSectionDown: () {},
            onLoadMore: () {},
            onFallbackPressed: () {},
            onLiveSelected: (_) {},
            onReplacementClosed: () => closed = true,
            onReplacementSlotSelected: (slotId) => selectedSlotId = slotId,
          ),
        ),
      ),
    );
    await tester.pump();

    expect(find.text('교체할 방송'), findsOneWidget);
    expect(find.text('Channel A'), findsOneWidget);
    expect(find.text('Channel B'), findsOneWidget);
    expect(
      find.descendant(
        of: find.byType(TvModalPanel),
        matching: find.byType(TvMediaChannelName),
      ),
      findsNWidgets(2),
    );

    await tester.tap(find.widgetWithText(TvListItem, 'Channel B'));
    await tester.pump();

    expect(selectedSlotId, 'slot-b');
    expect(closed, isFalse);

    await tester.pumpWidget(const SizedBox.shrink());
  });
}

const _replacementLive = Live(
  liveId: 3,
  title: 'Replacement live',
  concurrentUserCount: 10,
  adult: false,
  channel: LiveChannel(
    channelId: 'channel-c',
    channelName: 'Channel C',
    verifiedMark: false,
  ),
);

LivePlayerSlotState _slot({
  required String slotId,
  required String channelId,
  required String channelName,
}) {
  return LivePlayerSlotState(
    slotId: slotId,
    status: LivePlayerSlotStatus.playing,
    channelId: channelId,
    liveId: 1,
    detail: LiveDetail(
      liveId: 1,
      title: '$channelName live',
      status: 'OPEN',
      concurrentUserCount: 10,
      adult: false,
      channel: LiveChannel(
        channelId: channelId,
        channelName: channelName,
        verifiedMark: false,
      ),
    ),
  );
}
