import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../../common/constants/dimensions.dart';
import '../../../../../vod/model/vod.dart';
import '../../../../common/controls_overlay_container.dart';
import 'vod_stream_channel_follow.dart';
import 'vod_stream_channel_vod.dart';

class VodStreamChannelDataControls extends HookWidget {
  const VodStreamChannelDataControls({
    super.key,
    required this.videoFocusNode,
    required this.vod,
  });

  final FocusNode videoFocusNode;
  final Vod vod;

  @override
  Widget build(BuildContext context) {
    final followingButtonFSN = useFocusScopeNode();
    final vodListFSN = useFocusScopeNode();

    return ControlsOverlayContainer(
      width: double.infinity,
      height: Dimensions.vodStreamChannelDataControlsHeight,
      borderRadius: 12.0,
      useTopBorder: true,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        children: [
          SizedBox(
            height: Dimensions.vodStreamFollowingButtonContainerHeight,
            child: VodStreamChannelNameWithFollowingButton(
              channel: vod.channel,
              videoFocusNode: videoFocusNode,
              followingButtonFSN: followingButtonFSN,
              vodListFSN: vodListFSN,
            ),
          ),
          Expanded(
            child: VodStreamChannelVod(
              channel: vod.channel,
              vodListFSN: vodListFSN,
              followingButtonFSN: followingButtonFSN,
              videoFocusNode: videoFocusNode,
            ),
          ),
        ],
      ),
    );
  }
}
