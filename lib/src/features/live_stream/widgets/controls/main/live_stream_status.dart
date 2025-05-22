import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../utils/extensions/extensions.dart';
import '../../../../../common/constants/styles.dart';
import '../../../../../common/widgets/ui/ui_widgets.dart';
import '../../../../live/model/live_status.dart';

class LiveStreamStatus extends StatefulWidget {
  const LiveStreamStatus({super.key, required this.status});

  final LiveStatus? status;

  @override
  State<LiveStreamStatus> createState() => _LiveStreamStatusState();
}

class _LiveStreamStatusState extends State<LiveStreamStatus> {
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
    final nowDate = DateTime.now().toUtc().add(const Duration(hours: 9));
    final openDate = CustomFormatter.parseDateTimeFromDateTimeStr(
      widget.status!.openDate ?? '2025-05-01',
    );
    final diff = nowDate.difference(openDate);

    _currentTimeIndicator = diff.paddedDuration();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.status == null) return const SizedBox.shrink();

    final concurrentUserCount =
        widget.status!.concurrentUserCount.commaFormat();

    return _status(concurrentUserCount, _currentTimeIndicator);
  }

  Widget _status(String concurrentUserCount, String openDate) {
    return RichIconText(
      elements: [
        _iconElement(Icons.person_2_rounded),
        _textElement(concurrentUserCount),
        PaddingElement(horizontalPadding: 10.0),
        _iconElement(Icons.watch_later_outlined),
        _textElement(openDate),
      ],
    );
  }

  IconElement _iconElement(IconData iconData) => IconElement(
        icon: iconData,
        iconColor: AppColors.greyColor,
        iconSize: 14.0,
      );

  TextElement _textElement(String text) => TextElement(
        text: text,
        fontColor: AppColors.greyColor,
        fontSize: 11.0,
      );
}
