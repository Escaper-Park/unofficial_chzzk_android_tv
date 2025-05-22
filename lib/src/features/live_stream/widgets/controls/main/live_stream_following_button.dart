import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../common/constants/enums.dart' show LiveStreamOverlayType;
import '../../../../channel/model/channel.dart';
import '../../../../streaming/widgets/control/stream_following_button.dart';
import '../../../live_stream_event.dart';

class LiveStreamFollowingButton extends ConsumerWidget with LiveStreamEvent {
  const LiveStreamFollowingButton({
    super.key,
    required this.channel,
    required this.videoFocusNode,
  });

  final Channel channel;
  final FocusNode videoFocusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamFollowingButton(
      channel: channel,
      resetOverlayTimer: () =>
          resetOverlayTimer(ref, videoFocusNode: videoFocusNode),
      hideOverlay: () => changeOverlay(
        ref,
        overlayType: LiveStreamOverlayType.none,
        videoFocusNode: videoFocusNode,
      ),
    );
  }
}
