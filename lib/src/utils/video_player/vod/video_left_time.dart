import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';

import '../../../constants/styles.dart';
import '../../../ui/common/rounded_container.dart';

class VideoLeftTime extends StatefulWidget {
  const VideoLeftTime({super.key, required this.chewieController});

  final ChewieController chewieController;

  @override
  State<VideoLeftTime> createState() => _VideoLeftTimeState();
}

class _VideoLeftTimeState extends State<VideoLeftTime> {
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

  void _uptime() {
    final currentTime =
        widget.chewieController.videoPlayerController.value.position;
    _currentTimeIndicator =
        '${paddedTime(currentTime.inHours)}:${paddedTime(currentTime.inMinutes % 60)}:${paddedTime(currentTime.inSeconds % 60)}';
  }

  @override
  Widget build(BuildContext context) {
    final entireTime =
        widget.chewieController.videoPlayerController.value.duration;

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

  String paddedTime(int time) {
    return time.toString().padLeft(2, '0');
  }
}
