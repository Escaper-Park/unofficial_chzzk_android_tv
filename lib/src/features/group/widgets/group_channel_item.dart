import 'package:flutter/material.dart';

import '../../../common/constants/dimensions.dart';
import '../../../common/constants/styles.dart';
import '../../../common/widgets/ui/ui_widgets.dart';
import '../../channel/model/channel.dart';

class GroupChannelItem extends StatelessWidget {
  const GroupChannelItem({
    super.key,
    required this.autofocus,
    required this.channel,
    required this.focusNode,
    required this.onPressedChannel,
  });

  final bool autofocus;
  final Channel channel;
  final FocusNode focusNode;
  final void Function(Channel channel) onPressedChannel;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      width: 60.0,
      height: Dimensions.groupChannelItemHeight,
      backgroundColor: AppColors.greyContainerColor,
      child: FocusedOutlinedButton(
        autofocus: autofocus,
        padding: const EdgeInsets.all(10.0),
        onPressed: () => onPressedChannel(channel),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatarProfileImage(
              profileImageUrl: channel.channelImageUrl,
              radius: 20.0,
              useBorder: channel.openLive == true,
            ),
            const SizedBox(height: 5.0),
            CenteredText(
              text: channel.channelName,
              overflow: TextOverflow.clip,
            ),
          ],
        ),
      ),
    );
  }
}
