import 'package:flutter/material.dart';

import '../../../../../common/constants/dimensions.dart';
import '../../../../../common/constants/styles.dart';
import '../../../../../common/widgets/ui/centered_text.dart';
import '../../../../streaming/widgets/streaming_widgets.dart';

class LiveStreamMultiViewIndicator extends StatelessWidget {
  const LiveStreamMultiViewIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamOverlayContainer(
      alignment: Alignment.topLeft,
      width: Dimensions.multiviewIndicatorWidth,
      height: Dimensions.multiviewIndicatorheight,
      backgroundColor: AppColors.blackColor,
      backgroundOpacity: 0.7,
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(10.0),
      borderRadius: 12.0,
      useTopBorder: true,
      useBottomBorder: true,
      child: CenteredText(
        text: '멀티뷰 모드',
        fontSize: 16.0,
      ),
    );
  }
}
