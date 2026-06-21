import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live_player/presentation/view/live_player_live_status_poller.dart';

void main() {
  testWidgets('uses each slot mount time as its refresh cadence', (
    tester,
  ) async {
    final calls = <({String slotId, String channelId})>[];

    await tester.pumpWidget(
      _pollers(
        calls: calls,
        slots: const [
          (slotId: 'slot-a', channelId: 'channel-a'),
        ],
      ),
    );

    await tester.pump(const Duration(seconds: 10));
    await tester.pumpWidget(
      _pollers(
        calls: calls,
        slots: const [
          (slotId: 'slot-a', channelId: 'channel-a'),
          (slotId: 'slot-b', channelId: 'channel-b'),
        ],
      ),
    );

    await tester.pump(const Duration(seconds: 19));
    expect(calls, isEmpty);

    await tester.pump(const Duration(seconds: 1));
    expect(calls, [
      (slotId: 'slot-a', channelId: 'channel-a'),
    ]);

    await tester.pump(const Duration(seconds: 9));
    expect(calls, hasLength(1));

    await tester.pump(const Duration(seconds: 1));
    expect(calls, [
      (slotId: 'slot-a', channelId: 'channel-a'),
      (slotId: 'slot-b', channelId: 'channel-b'),
    ]);
  });

  testWidgets('restarts when the slot channel changes', (tester) async {
    final calls = <({String slotId, String channelId})>[];

    await tester.pumpWidget(
      _pollers(
        calls: calls,
        slots: const [
          (slotId: 'slot-a', channelId: 'channel-a'),
        ],
      ),
    );
    await tester.pump(const Duration(seconds: 20));
    await tester.pumpWidget(
      _pollers(
        calls: calls,
        slots: const [
          (slotId: 'slot-a', channelId: 'channel-b'),
        ],
      ),
    );

    await tester.pump(const Duration(seconds: 29));
    expect(calls, isEmpty);

    await tester.pump(const Duration(seconds: 1));
    expect(calls, [
      (slotId: 'slot-a', channelId: 'channel-b'),
    ]);
  });

  testWidgets('does not refresh while polling is paused', (tester) async {
    final calls = <({String slotId, String channelId})>[];

    await tester.pumpWidget(
      _pollers(
        calls: calls,
        pollingPaused: true,
        slots: const [
          (slotId: 'slot-a', channelId: 'channel-a'),
        ],
      ),
    );
    await tester.pump(const Duration(seconds: 31));
    expect(calls, isEmpty);

    await tester.pumpWidget(
      _pollers(
        calls: calls,
        slots: const [
          (slotId: 'slot-a', channelId: 'channel-a'),
        ],
      ),
    );
    await tester.pump(const Duration(seconds: 29));
    expect(calls, isEmpty);

    await tester.pump(const Duration(seconds: 1));
    expect(calls, [
      (slotId: 'slot-a', channelId: 'channel-a'),
    ]);

    await tester.pumpWidget(
      _pollers(
        calls: calls,
        pollingPaused: true,
        slots: const [
          (slotId: 'slot-a', channelId: 'channel-a'),
        ],
      ),
    );
    await tester.pump(const Duration(seconds: 31));
    expect(calls, hasLength(1));
  });
}

Widget _pollers({
  required List<({String slotId, String channelId})> slots,
  required List<({String slotId, String channelId})> calls,
  bool pollingPaused = false,
}) {
  return Column(
    children: [
      for (final slot in slots)
        LivePlayerLiveStatusPoller(
          key: ValueKey(slot.slotId),
          slotId: slot.slotId,
          channelId: slot.channelId,
          pollingPaused: pollingPaused,
          onRefreshRequested: ({required slotId, required channelId}) {
            calls.add((slotId: slotId, channelId: channelId));
          },
          child: const SizedBox.shrink(),
        ),
    ],
  );
}
