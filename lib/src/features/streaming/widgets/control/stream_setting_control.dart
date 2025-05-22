import 'package:flutter/material.dart';

import '../../../../common/constants/dimensions.dart';
import '../../../../common/widgets/ui/ui_widgets.dart';
import '../streaming_widgets.dart';

class StreamSettingControl extends StatelessWidget {
  const StreamSettingControl({
    super.key,
    required this.streamSettingsControlItems,
    required this.headerText,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
  });

  final List<Widget> streamSettingsControlItems;
  final String headerText;
  final String text1;
  final String text2;
  final String text3;
  final String text4;

  @override
  Widget build(BuildContext context) {
    return StreamOverlayContainer(
      width: double.infinity,
      height: Dimensions.streamControlsHeight,
      borderRadius: 12.0,
      useTopBorder: true,
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.all(10.0),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // header
            _headerText(),
            const SizedBox(width: 10.0),
            // control
            ...streamSettingsControlItems,
          ],
        ),
      ),
    );
  }

  Widget _headerText() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: HeaderText(
            text: headerText,
            verticalPadding: 0.0,
            fontSize: 14.0,
          ),
        ),
        SizedBox(height: 3.0),
        RichIconText(
          elements: [
            TextElement(text: text1),
            PaddingElement(horizontalPadding: 5.0),
            IconElement(icon: Icons.arrow_right_alt_rounded),
            TextElement(text: text2),
          ],
        ),
        RichIconText(
          elements: [
            TextElement(text: text3),
            PaddingElement(horizontalPadding: 5.0),
            IconElement(icon: Icons.arrow_right_alt_rounded),
            TextElement(text: text4),
          ],
        ),
      ],
    );
  }
}
