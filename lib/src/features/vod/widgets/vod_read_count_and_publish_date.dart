import 'package:flutter/material.dart';

import '../../../utils/extensions/custom_extensions.dart';
import '../../../common/constants/styles.dart';
import '../../../common/widgets/ui/ui_widgets.dart';
import '../model/vod.dart';

class VodReadCountAndPublishDate extends StatelessWidget {
  const VodReadCountAndPublishDate({super.key, required this.vod});

  final Vod vod;

  @override
  Widget build(BuildContext context) {
    final String readCount = vod.readCount.commaFormat();
    // yyyy-MM-dd
    final String publishDate = vod.publishDate.split(' ')[0];

    return RichIconText(
      elements: [
        _iconElement(Icons.play_arrow_rounded),
        _textElement(readCount),
        PaddingElement(horizontalPadding: 5.0),
        _iconElement(Icons.calendar_month_rounded),
        _textElement(publishDate),
      ],
    );
  }

  IconElement _iconElement(IconData icon) {
    return IconElement(
      icon: icon,
      iconColor: AppColors.greyColor,
      iconSize: 12.0,
    );
  }

  TextElement _textElement(String text) {
    return TextElement(
      text: text,
      fontColor: AppColors.greyColor,
      fontSize: 10.0,
      fontWeight: FontWeight.w500,
    );
  }
}
