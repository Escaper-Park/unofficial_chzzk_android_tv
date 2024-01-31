import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../constants/styles.dart';
import '../../../ui/common/rounded_container.dart';

class UptimeTimer extends StatefulWidget {
  const UptimeTimer({super.key, required this.openDate});

  final String openDate;

  @override
  State<UptimeTimer> createState() => _UptimeTimerState();
}

class _UptimeTimerState extends State<UptimeTimer> {
  Timer? timer;
  String _passedTime = '';

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

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void _uptime() {
    final DateTime openDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').parse(widget.openDate);

    final DateTime nowDate = DateTime.now();

    final Duration diff = nowDate.difference(openDate);

    final String h = diff.inHours.toString().padLeft(2, '0');
    final String m = (diff.inMinutes % 60).toString().padLeft(2, '0');
    final String s = (diff.inSeconds % 60).toString().padLeft(2, '0');

    _passedTime = '$h:$m:$s 스트리밍 중';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RoundedContainer(
        backgroundColor: AppColors.greyContainerColor.withOpacity(0.85),
        padding: const EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 8.0,
        ),
        child: Text(
          _passedTime,
          style: const TextStyle(
            fontSize: 14.0,
            color: AppColors.whiteColor,
          ),
        ),
      ),
    );
  }
}
