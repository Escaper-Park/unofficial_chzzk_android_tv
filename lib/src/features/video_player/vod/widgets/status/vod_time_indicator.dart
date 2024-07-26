import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../../../common/constants/styles.dart';
import '../../../../../common/widgets/rounded_container.dart';
import '../../../../../utils/formatter/formatter.dart';

class VodTimeIndicator extends StatefulWidget {
  /// Show the current playback time and total playback time of the VOD.
  const VodTimeIndicator({super.key, required this.controller});

  final VideoPlayerController controller;

  @override
  State<VodTimeIndicator> createState() => _VodTimeIndicatorState();
}

class _VodTimeIndicatorState extends State<VodTimeIndicator> {
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
    final currentTime = widget.controller.value.position;
    _currentTimeIndicator = currentTime.paddedDuration();
  }

  @override
  Widget build(BuildContext context) {
    final entireTime = widget.controller.value.duration;
    final entireTimeIndicator = entireTime.paddedDuration();

    return RoundedContainer(
      backgroundColor: AppColors.greyContainerColor.withOpacity(0.85),
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
      child: Text(
        '$_currentTimeIndicator / $entireTimeIndicator',
        style: const TextStyle(
          fontSize: 14.0,
          color: AppColors.whiteColor,
        ),
      ),
    );
  }
}
