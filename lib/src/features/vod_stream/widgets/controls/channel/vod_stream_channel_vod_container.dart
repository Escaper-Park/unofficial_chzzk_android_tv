import 'package:flutter/material.dart';

import '../../../../../common/constants/dimensions.dart';
import '../../../../../common/constants/enums.dart' show DpadAction;
import '../../../../../common/constants/styles.dart' show AppColors;
import '../../../../../common/widgets/dpad/dpad_action_widget.dart';
import '../../../../../common/widgets/ui/ui_widgets.dart';
import '../../../../../utils/extensions/custom_extensions.dart';
import '../../../../streaming/widgets/stream_overlay_container.dart';
import '../../../../vod/model/vod.dart';
import '../../../../vod/widgets/vod_widgets.dart';

class VodStreamChannelVodContainer extends StatelessWidget {
  const VodStreamChannelVodContainer({
    super.key,
    required this.autofocus,
    required this.focusNode,
    required this.vod,
    required this.changeSource,
  });

  final bool autofocus;
  final FocusNode focusNode;
  final Vod vod;
  final Future<void> Function(Vod vod) changeSource;

  @override
  Widget build(BuildContext context) {
    final String publishDate = vod.publishDate.split(' ')[0];
    final String paddedDuration =
        Duration(seconds: vod.duration).paddedDuration();

    return SizedBox(
      width: Dimensions.streamNavigatorContentsWidth,
      height: Dimensions.streamNavigatorContentsHeight,
      child: DpadActionWidget(
        autofocus: autofocus,
        focusNode: focusNode,
        useFocusedBorder: true,
        useKeyRepeatEvent: false,
        dpadActionCallbacks: {
          DpadAction.select: () async {
            await changeSource(vod);
          },
        },
        child: Stack(
          children: [
            VodThumbnail(vod: vod),
            _badge(Alignment.topLeft, publishDate),
            _badge(Alignment.topRight, paddedDuration),
            StreamOverlayContainer(
              width: double.infinity,
              height: Dimensions.vodStreamChannelContentsTitleHeight,
              alignment: Alignment.bottomCenter,
              backgroundColor: AppColors.blackColor,
              backgroundOpacity: 0.5,
              borderRadius: 12.0,
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 5.0,
              ),
              useBottomBorder: true,
              child: Align(
                alignment: Alignment.centerLeft,
                child: HeaderText(
                  fontSize: 11.0,
                  text: vod.videoTitle,
                  horizontalPadding: 0.0,
                  verticalPadding: 0.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _badge(Alignment alignment, String text) {
    return CustomBadge(
      alignment: alignment,
      backgroundColor: AppColors.categoryTagBackgroundColor,
      horizontalPadding: 3.0,
      verticalPadding: 5.0,
      borderRadius: 5.0,
      margin: EdgeInsets.all(5.0),
      elements: [TextElement(text: text)],
    );
  }
}
