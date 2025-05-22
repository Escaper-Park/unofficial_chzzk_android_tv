import 'package:flutter/material.dart';

import '../../../../../utils/extensions/custom_extensions.dart';
import '../../../../../common/constants/dimensions.dart' show Dimensions;
import '../../../../../common/constants/enums.dart' show DpadAction;
import '../../../../../common/constants/styles.dart' show AppColors;
import '../../../../../common/widgets/dpad/dpad_widgets.dart';
import '../../../../../common/widgets/ui/ui_widgets.dart';
import '../../../../channel/model/channel.dart';
import '../../../../channel/widgets/channel_widgets.dart';
import '../../../../live/model/live_info.dart';
import '../../../../live/widgets/live_widgets.dart';
import '../../../../streaming/widgets/streaming_widgets.dart';

class LiveStreamLiveContainer extends StatelessWidget {
  const LiveStreamLiveContainer({
    super.key,
    required this.autofocus,
    required this.focusNode,
    required this.videoFocusNode,
    required this.liveInfo,
    required this.channel,
    required this.play,
  });

  final bool autofocus;
  final FocusNode focusNode;
  final FocusNode videoFocusNode;
  final LiveInfo liveInfo;
  final Channel channel;
  final Future<void> Function(LiveInfo liveInfo, Channel channel) play;

  @override
  Widget build(BuildContext context) {
    final String concurrentUserCount =
        liveInfo.concurrentUserCount.commaFormat();
    final String categoryValue = liveInfo.liveCategoryValue ?? '?';

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
            await play(liveInfo, channel);
          },
        },
        child: Stack(
          children: [
            // thumbnail
            LiveThumbnail(liveInfo: liveInfo),
            // status
            _badge(
              Alignment.topLeft,
              '$concurrentUserCount \u00b7 $categoryValue',
            ),
            // title
            StreamOverlayContainer(
              width: double.infinity,
              height: Dimensions.liveStreamChannelContentsTitleHeight,
              alignment: Alignment.bottomCenter,
              backgroundColor: AppColors.blackColor,
              backgroundOpacity: 0.5,
              borderRadius: 12.0,
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 5.0,
              ),
              useBottomBorder: true,
              child: Row(
                children: [
                  // channel profile image
                  CircleAvatarProfileImage(
                    profileImageUrl: channel.channelImageUrl,
                    radius: 15.0,
                    borderWidth: 1.5,
                    useBorder: true,
                  ),
                  const SizedBox(width: 10.0),
                  // channel name and vod title
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ChannelNameWithVerifiedMark(
                          channel: channel,
                          fontSize: 12.0,
                          fontColor: AppColors.whiteColor,
                        ),
                        Text(
                          liveInfo.liveTitle?.replaceAll('\n', ' ') ?? ' ',
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 11.0,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w600,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
      elements: [
        WidgetElement(
          widget: const CircleAvatar(
            radius: 2.5,
            backgroundColor: AppColors.redColor,
          ),
        ),
        PaddingElement(),
        TextElement(text: text),
      ],
    );
  }
}
