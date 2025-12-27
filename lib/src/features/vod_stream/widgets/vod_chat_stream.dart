import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/constants/enums.dart' show ChatWindowMode;
import '../../chat/widgets/chat_stream.dart';
import '../vod_stream_state.dart';

class VodChatStream extends ConsumerWidget with VodStreamState {
  const VodChatStream({
    super.key,
    required this.chatWindowMode,
  });

  final ChatWindowMode chatWindowMode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncController = getAsyncVideoPlayerController(ref);
    final vodPlay = getVodPlay(ref);

    return asyncController.when(
      data: (controller) {
        if (controller == null || vodPlay == null)
          return const SizedBox.shrink();

        final chatStream = getChatStream(
          ref,
          controller: controller,
          videoNo: vodPlay.$1.videoNo,
        );
        final chatSettings = getChatSettings(ref);

        return ChatStream(
          chatStream: chatStream,
          chatWindowMode: chatWindowMode,
          chatSettings: chatSettings,
        );
      },
      error: (_, __) => const SizedBox.shrink(),
      loading: () => const SizedBox.shrink(),
    );
  }
}
