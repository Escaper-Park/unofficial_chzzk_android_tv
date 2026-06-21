import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/utils/utils.dart';

typedef LivePlayerLiveStatusRefreshRequested =
    void Function({
      required String slotId,
      required String channelId,
    });

final class LivePlayerLiveStatusPoller extends HookWidget {
  const LivePlayerLiveStatusPoller({
    required this.slotId,
    required this.channelId,
    required this.pollingPaused,
    required this.onRefreshRequested,
    required this.child,
    this.interval = const Duration(seconds: 30),
    super.key,
  });

  final String slotId;
  final String? channelId;
  final bool pollingPaused;
  final LivePlayerLiveStatusRefreshRequested onRefreshRequested;
  final Widget child;
  final Duration interval;

  @override
  Widget build(BuildContext context) {
    final onRefreshRequestedRef = useRef(onRefreshRequested)
      ..value = onRefreshRequested;

    useEffect(
      () {
        final channelId = this.channelId;
        if (pollingPaused || channelId == null || channelId.isEmpty) {
          return null;
        }

        final timer = PeriodicCallbackTimer()
          ..start(
            interval: interval,
            onTick: () {
              final onRefreshRequested = onRefreshRequestedRef.value;
              onRefreshRequested(
                slotId: slotId,
                channelId: channelId,
              );
            },
          );

        return timer.dispose;
      },
      [
        slotId,
        channelId,
        interval,
        pollingPaused,
      ],
    );

    return child;
  }
}
