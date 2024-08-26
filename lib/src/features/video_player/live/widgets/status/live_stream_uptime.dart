import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../common/constants/styles.dart';
import '../../../../../utils/formatter/formatter.dart';

class LiveStreamUptime extends StatefulWidget {
  const LiveStreamUptime({super.key, required this.strOpenDate});

  final String strOpenDate;

  @override
  State<LiveStreamUptime> createState() => _LiveStreamUptimeState();
}

class _LiveStreamUptimeState extends State<LiveStreamUptime> {
  Timer? timer;
  String _currentTimeIndicator = '';

  @override
  void initState() {
    super.initState();
    _updateTime();
    // update playback time every sec.
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(() {
          _updateTime();
        });
      },
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void _updateTime() {
    final currentTime = DateTime.now();
    final openDate =
        CustomFormatter.parseDateTimeFromString(widget.strOpenDate);
    final diff = currentTime.difference(openDate);

    _currentTimeIndicator = '${diff.paddedDuration()} 스트리밍 중';
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _currentTimeIndicator,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 11.0,
        color: AppColors.whiteColor,
      ),
    );
  }
}
