import 'package:flutter/widgets.dart';

import '../../../../common/constants/dimensions.dart';
import '../../../../common/constants/styles.dart' show AppColors;
import '../../../../common/widgets/ui/header_text.dart';
import '../../../../common/widgets/ui/ui_widgets.dart'
    show CircleAvatarProfileImage;
import '../../../channel/model/channel.dart';
import '../../../channel/widgets/channel_widgets.dart'
    show ChannelNameWithVerifiedMark;
import '../stream_overlay_container.dart';

class StreamInfoContainer extends StatelessWidget {
  const StreamInfoContainer({
    super.key,
    required this.streamInfoDetail,
    this.height = Dimensions.streamInfoContainerHeight,
  });

  final Widget streamInfoDetail;
  final double height;

  @override
  Widget build(BuildContext context) {
    return StreamOverlayContainer(
      alignment: Alignment.topLeft,
      height: height,
      backgroundColor: AppColors.blackColor,
      backgroundOpacity: 0.7,
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(10.0),
      borderRadius: 12.0,
      useTopBorder: true,
      useBottomBorder: true,
      child: IntrinsicWidth(child: streamInfoDetail),
    );
  }
}

class StreamInfoDetail extends StatelessWidget {
  const StreamInfoDetail({
    super.key,
    this.profileImageUrl,
    required this.isLive,
    required this.channel,
    required this.videoTitle,
    required this.tagsWidget,
    required this.statusWidget,
  });

  final String? profileImageUrl;
  final bool isLive;
  final Channel channel;
  final String videoTitle;
  final Widget tagsWidget;
  final Widget statusWidget;

  @override
  Widget build(BuildContext context) {
    final streamTitle = videoTitle.replaceAll('\n', ' ');

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Profile image
        CircleAvatarProfileImage(
          profileImageUrl: profileImageUrl,
          useBorder: isLive,
          radius: Dimensions.streamInfoProfileImageRadius,
        ),
        const SizedBox(width: 10.0),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Channel Name
              ChannelNameWithVerifiedMark(
                channel: channel,
                fontSize: 12.0,
                fontColor: AppColors.whiteColor,
              ),
              Expanded(
                child: HeaderText(
                  text: streamTitle,
                  verticalPadding: 5.0,
                  fontSize: 12.0,
                ),
              ),
              tagsWidget,
              const SizedBox(height: 5.0),
              statusWidget,
            ],
          ),
        ),
      ],
    );
  }
}
