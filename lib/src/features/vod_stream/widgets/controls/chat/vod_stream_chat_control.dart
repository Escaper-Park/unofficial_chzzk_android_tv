import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../streaming/widgets/streaming_widgets.dart';
import '../../../vod_stream_event.dart';
import '../../../vod_stream_state.dart';

class VodStreamChatSettingControl extends ConsumerWidget
    with VodStreamEvent, VodStreamState {
  const VodStreamChatSettingControl({
    super.key,
    required this.videoFocusNode,
  });

  final FocusNode videoFocusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamChatSettingControl(
      chatSettings: getChatSettings(ref),
      resetOverlayTimer: () => resetOverlayTimer(
        ref,
        videoFocusNode: videoFocusNode,
      ),
    );
  }
}
