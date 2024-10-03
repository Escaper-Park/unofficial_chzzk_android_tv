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
    ref.listen(
      wakelockMonitorControllerProvider,
      (previous, next) {
        if (previous != next) {
          final bool allFalse = next.every((e) => e == false);

          if (allFalse) {
            WakelockPlus.disable();
            // Check again
            WakelockPlus.enabled.then(
              (value) {
                if (value == true) WakelockPlus.disable();
              },
            );
          } else {
            WakelockPlus.enable();
          }
        }
      },
    );

    return const SizedBox.shrink();
  }
}
