import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../common/constants/dimensions.dart';
import '../../../../common/controls_overlay_container.dart';
import '../../../controller/vod_playlist_controller.dart';
import 'vod_stream_channel_follow.dart';
import 'vod_stream_channel_vod.dart';

class VodStreamChannelDataControls extends HookConsumerWidget {
  const VodStreamChannelDataControls({
    super.key,
    required this.videoFocusNode,
  });

  final FocusNode videoFocusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final followingButtonFSN = useFocusScopeNode();
    final vodListFSN = useFocusScopeNode();
    final vodPlay = ref.watch(vodPlaylistControllerProvider);
    final vod = vodPlay!.$1;

    return ControlsOverlayContainer(
      width: double.infinity,
      height: Dimensions.vodStreamChannelDataControlsHeight,
      borderRadius: 12.0,
      useTopBorder: true,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Dimensions.vodStreamFollowingButtonContainerHeight,
            child: VodStreamChannelName(
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
