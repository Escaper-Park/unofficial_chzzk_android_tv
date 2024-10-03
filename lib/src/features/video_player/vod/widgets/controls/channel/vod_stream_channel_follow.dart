import 'package:flutter/material.dart';

import '../../../../../../common/constants/styles.dart';
import '../../../../../channel/model/channel.dart';

class VodStreamChannelName extends StatelessWidget {
  const VodStreamChannelName({
    super.key,
    required this.channel,
    required this.videoFocusNode,
    required this.followingButtonFSN,
    required this.vodListFSN,
  });

  final Channel channel;
  final FocusNode videoFocusNode;
  final FocusScopeNode followingButtonFSN;
  final FocusScopeNode vodListFSN;

  @override
  Widget build(BuildContext context) {
    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   crossAxisAlignment: CrossAxisAlignment.center,
    //   children: [
    //     Text(
    //       '[${channel.channelName}] 채널의 동영상',
    //       style: const TextStyle(
    //         fontSize: 14.0,
    //         color: AppColors.whiteColor,
    //         fontWeight: FontWeight.w600,
    //       ),
    //     ),
    //     // Following Button
    //     VodStreamFollowingButton(
    //       channel: channel,
    //       videoFocusNode: videoFocusNode,
    //       followingButtonFSN: followingButtonFSN,
    //       videoListFSN: vodListFSN,
    //     ),
    //   ],
    // );
    return Text(
      '[${channel.channelName}] 채널의 동영상',
      style: const TextStyle(
        fontSize: 14.0,
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
