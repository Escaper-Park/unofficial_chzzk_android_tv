import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/constants/enums.dart' show ChatWindowMode;
import '../../streaming/widgets/streaming_widgets.dart';
import '../live_stream_state.dart';
import 'live_multiview_focused_player.dart';
import 'live_stream_widgets.dart';
import 'single_live_player.dart';

class LiveScreen extends ConsumerWidget with LiveStreamState {
  const LiveScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ChatWindowMode chatWindowMode = getChatWindowMode(ref);
    final int? currentActivatedLiveIndex = getCurrentActivatedLiveIndex(ref);

    // current
    if (currentActivatedLiveIndex == null) {
      final liveDetails = getLivePlaylist(ref);

      return StreamPlayerWithChat(
        chatWindowMode: chatWindowMode,
        videoPlayer: LivePlayer(),
        chatStream: liveDetails.isEmpty
            ? const SizedBox.shrink()
            : LiveChatStream(
                chatWindowMode: chatWindowMode,
                liveDetail: liveDetails[0],
              ),
        isChatExist: true,
      );
    } 
    // focused
    else {
      return LiveMultiviewFocusedPlayer(
        currentActivatedLiveIndex: currentActivatedLiveIndex,
        singleLivePlayer: (index) => SingleLivePlayer(index: index),
        chatStream: (liveDetail) => LiveChatStream(
          chatWindowMode: ChatWindowMode.side,
          liveDetail: liveDetail,
        ),
      );
    }
  }
}
