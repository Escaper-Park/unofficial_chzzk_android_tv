import 'package:flutter/widgets.dart';

class LiveCardElapsedSnapshot extends StatefulWidget {
  const LiveCardElapsedSnapshot({
    super.key,
    required this.now,
    required this.builder,
    this.snapshotKey,
  });

  final DateTime Function() now;
  final Widget Function(BuildContext context, DateTime now) builder;
  final Object? snapshotKey;

  @override
  State<LiveCardElapsedSnapshot> createState() =>
      _LiveCardElapsedSnapshotState();
}

class _LiveCardElapsedSnapshotState extends State<LiveCardElapsedSnapshot> {
  late DateTime _now;

  @override
  void initState() {
    super.initState();
    _now = widget.now();
  }

  @override
  void didUpdateWidget(LiveCardElapsedSnapshot oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.snapshotKey != widget.snapshotKey) {
      _now = widget.now();
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _now);
  }
}
