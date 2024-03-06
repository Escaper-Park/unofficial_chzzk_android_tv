import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';

import '../../../../common/constants/styles.dart';
import '../../../../common/widgets/rounded_container.dart';

class VodRemainingTimeIndicator extends StatefulWidget {
  const VodRemainingTimeIndicator({super.key, required this.controller});

  final ChewieController controller;

  @override
  State<VodRemainingTimeIndicator> createState() =>
      _VodRemainingTimeIndicatorState();
}

class _VodRemainingTimeIndicatorState extends State<VodRemainingTimeIndicator> {
  Timer? timer;
  String _currentTimeIndicator = '';

  @override
  void initState() {
    super.initState();
    _uptime();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _uptime();
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  String paddedTime(int time) {
    return time.toString().padLeft(2, '0');
  }

  void _uptime() {
    final currentTime = widget.controller.videoPlayerController.value.position;
    _currentTimeIndicator =
        '${paddedTime(currentTime.inHours)}:${paddedTime(currentTime.inMinutes % 60)}:${paddedTime(currentTime.inSeconds % 60)}';
  }

  @override
  Widget build(BuildContext context) {
    final entireTime = widget.controller.videoPlayerController.value.duration;

    final String entireTimeIndicator =
        '${paddedTime(entireTime.inHours)}:${paddedTime(entireTime.inMinutes % 60)}:${paddedTime(entireTime.inSeconds % 60)}';

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RoundedContainer(
        backgroundColor: AppColors.greyContainerColor.withOpacity(0.85),
        padding: const EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 8.0,
        ),
        child: Text(
          '$_currentTimeIndicator / $entireTimeIndicator',
          style: const TextStyle(
            fontSize: 14.0,
            color: AppColors.whiteColor,
          ),
        ),
      ),
    );
  }
}
