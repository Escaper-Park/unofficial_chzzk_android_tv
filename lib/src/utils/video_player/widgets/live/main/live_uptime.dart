import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../common/constants/styles.dart';
import '../../../../../common/widgets/rounded_container.dart';

class LiveStreamUptime extends StatefulWidget {
  const LiveStreamUptime({super.key, required this.openDate});

  final String openDate;

  @override
  State<LiveStreamUptime> createState() => _LiveStreamUptimeState();
}

class _LiveStreamUptimeState extends State<LiveStreamUptime> {
  Timer? timer;
  String _uptimeString = '';

  @override
  void initState() {
    super.initState();
    _uptime();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(
        () {
          _uptime();
        },
      );
    });
  }

  void _uptime() {
    final DateTime openDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').parse(widget.openDate);

    final DateTime nowDate = DateTime.now();

    final Duration diff = nowDate.difference(openDate);

    final String h = diff.inHours.toString().padLeft(2, '0');
    final String m = (diff.inMinutes % 60).toString().padLeft(2, '0');
    final String s = (diff.inSeconds % 60).toString().padLeft(2, '0');

    _uptimeString = '$h:$m:$s 스트리밍 중';
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180.0,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: RoundedContainer(
            backgroundColor: AppColors.greyContainerColor.withOpacity(0.85),
            padding: const EdgeInsets.symmetric(
              vertical: 5.0,
              horizontal: 8.0,
            ),
            child: Text(
              _uptimeString,
              style: const TextStyle(
                fontSize: 14.0,
                color: AppColors.whiteColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
