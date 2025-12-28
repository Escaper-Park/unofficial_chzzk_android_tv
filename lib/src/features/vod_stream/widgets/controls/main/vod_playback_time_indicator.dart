import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../../../utils/extensions/custom_extensions.dart';
import '../../../../../common/constants/dimensions.dart';
import '../../../../../common/constants/styles.dart';
import '../../../../../common/widgets/ui/ui_widgets.dart' show RoundedContainer;

class VodPlaybackTimeIndicator extends StatefulWidget {
  const VodPlaybackTimeIndicator({super.key, required this.controller});

  final VideoPlayerController controller;

  @override
  State<VodPlaybackTimeIndicator> createState() =>
      _VodPlaybackTimeIndicatorState();
}

class _VodPlaybackTimeIndicatorState extends State<VodPlaybackTimeIndicator> {
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
    final entire = widget.controller.value.duration.paddedDuration();

    return RoundedContainer(
      width: Dimensions.vodPlaybackTimeIndicatorWidth,
      backgroundColor: AppColors.greyContainerColor.withValues(alpha: 0.85),
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
      child: Text(
        '$_currentTimeIndicator / $entire',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 12.0,
          color: AppColors.whiteColor,
        ),
      ),
    );
  }
}
