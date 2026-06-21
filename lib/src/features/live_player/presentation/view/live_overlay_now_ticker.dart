import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/utils/utils.dart';

DateTime useLiveOverlayNowTicker() {
  final now = useState(DateTime.now());

  useEffect(() {
    final timer = PeriodicCallbackTimer()
      ..start(
        interval: const Duration(seconds: 1),
        onTick: () => now.value = DateTime.now(),
      );

    return timer.dispose;
  }, const []);

  return now.value;
}
