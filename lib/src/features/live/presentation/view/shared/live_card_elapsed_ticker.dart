import 'package:flutter/widgets.dart';

import '../../../../../core/utils/utils.dart';

class LiveCardElapsedTicker extends StatefulWidget {
  const LiveCardElapsedTicker({
    super.key,
    required this.now,
    required this.builder,
    this.enabled = true,
  });

  final DateTime Function() now;
  final Widget Function(BuildContext context, DateTime now) builder;
  final bool enabled;

  @override
  State<LiveCardElapsedTicker> createState() => _LiveCardElapsedTickerState();
}

class _LiveCardElapsedTickerState extends State<LiveCardElapsedTicker> {
  final _timer = PeriodicCallbackTimer();
  late DateTime _now;

  @override
  void initState() {
    super.initState();
    _now = widget.now();
    _syncTimer();
  }

  @override
  void didUpdateWidget(LiveCardElapsedTicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.now != widget.now || oldWidget.enabled != widget.enabled) {
      _now = widget.now();
      _syncTimer();
    }
  }

  @override
  void dispose() {
    _timer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _now);
  }

  void _syncTimer() {
    _timer.stop();

    if (!widget.enabled) {
      return;
    }

    _timer.start(
      interval: const Duration(seconds: 1),
      onTick: () {
        if (!mounted) {
          return;
        }

        setState(() {
          _now = widget.now();
        });
      },
    );
  }
}
