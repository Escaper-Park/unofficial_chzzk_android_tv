import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../common/constants/enums.dart' show VodStreamOverlayType;
import '../../../../streaming/widgets/control/stream_following_button.dart';
import '../../../../vod/model/vod.dart';
import '../../../vod_stream_event.dart';

class VodStreamFollowingButton extends ConsumerWidget with VodStreamEvent {
  const VodStreamFollowingButton({
    super.key,
    required this.videoFocusNode,
    required this.vod,
  });

  final FocusNode videoFocusNode;
  final Vod? vod;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamFollowingButton(
      channel: vod!.channel!,
      resetOverlayTimer: () => resetOverlayTimer(
        ref,
        videoFocusNode: videoFocusNode,
      ),
      hideOverlay: () => changeOverlay(
        ref,
        overlayType: VodStreamOverlayType.none,
        videoFocusNode: videoFocusNode,
      ),
    );
  }
}
