import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod_player/presentation/view/vod_player_watch_event_seek_hold.dart';

void main() {
  test('hold suppresses watch events until settle delay elapses', () {
    var now = DateTime(2026);
    final hold = VodPlayerWatchEventSeekHold(
      settleDelay: const Duration(seconds: 2),
      currentTime: () => now,
    )..hold();

    expect(hold.isHeld, isTrue);

    now = now.add(const Duration(seconds: 2));

    expect(hold.isHeld, isFalse);
    expect(hold.isHeld, isFalse);
  });

  test('hold extends the resume time from current time', () {
    var now = DateTime(2026);
    final hold = VodPlayerWatchEventSeekHold(
      settleDelay: const Duration(seconds: 2),
      currentTime: () => now,
    )..hold();

    now = now.add(const Duration(seconds: 1));
    hold.hold();
    now = now.add(const Duration(milliseconds: 1500));

    expect(hold.isHeld, isTrue);

    now = now.add(const Duration(milliseconds: 500));

    expect(hold.isHeld, isFalse);
  });

  test('clear removes a pending hold', () {
    final hold =
        VodPlayerWatchEventSeekHold(
            settleDelay: const Duration(seconds: 2),
            currentTime: () => DateTime(2026),
          )
          ..hold()
          ..clear();

    expect(hold.isHeld, isFalse);
  });
}
