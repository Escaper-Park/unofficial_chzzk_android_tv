import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import 'wakelock_monitor_controller.dart';

class WakelockMonitor extends ConsumerWidget {
  /// This widget is used solely for monitoring the [Wakelock] state.
  ///
  /// This widget doesn't have any form or size.
  const WakelockMonitor({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<bool> wakelockMontiorList =
        ref.watch(wakelockMonitorControllerProvider);

    print('test monitor list $wakelockMontiorList');

    final bool allFalse = wakelockMontiorList.every((e) => e == false);

    if (allFalse) {
      WakelockPlus.disable().then((value) {
        WakelockPlus.enabled.then(
          (value) => print('test wakelock state $value'),
        );
      });
    } else {
      WakelockPlus.enable().then((value) {
        WakelockPlus.enabled.then(
          (value) => print('test2 wakelock state $value'),
        );
      });
    }

    return const SizedBox.shrink();
  }
}
