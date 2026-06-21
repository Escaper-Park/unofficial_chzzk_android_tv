import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/player_entry_guard.dart';

void main() {
  test(
    'ignores overlapping entry actions until the current one finishes',
    () async {
      final guard = PlayerEntryGuard();
      final completer = Completer<void>();
      var runs = 0;

      final first = guard.run(() async {
        runs += 1;
        await completer.future;
      });
      final second = guard.run(() async {
        runs += 1;
      });

      await second;
      expect(runs, 1);

      completer.complete();
      await first;

      await guard.run(() async {
        runs += 1;
      });

      expect(runs, 2);
    },
  );
}
