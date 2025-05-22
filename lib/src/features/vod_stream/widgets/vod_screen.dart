import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/constants/enums.dart' show ChatWindowMode;
import '../../streaming/widgets/screen/stream_player_with_chat.dart';

import '../controller/vod_playlist_controller.dart';
import '../vod_stream_state.dart';
import 'vod_stream_widgets.dart';

class VodScreen extends ConsumerWidget with VodStreamState {
  const VodScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ChatWindowMode chatWindowMode = getChatWindowMode(ref);
    final VodPlay? vodPlay = getVodPlay(ref);

    return StreamPlayerWithChat(
      chatWindowMode: chatWindowMode,
      videoPlayer: VodPlayer(),
      chatStream: VodChatStream(
        chatWindowMode: chatWindowMode,
      ),
      isChatExist: vodPlay?.$1.videoChatEnabled == true,
    );
  }
}
