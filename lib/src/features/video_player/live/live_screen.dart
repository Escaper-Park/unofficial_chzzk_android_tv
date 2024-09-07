import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import './controller/live_mode_controller.dart';
import './controller/live_playlist_controller.dart';
import './single_live_player.dart';
import './widgets/chat/live_chat_stream.dart';

class LiveScreen extends ConsumerWidget {
  const LiveScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final livePlaylist = ref.watch(livePlaylistControllerProvider);
    final liveCount = livePlaylist.length;
    final chatWindowMode = ref.watch(chatWindowModeControllerProvider);
    final currentActivatedLiveIndex =
        ref.watch(currentActivatedLiveIndexProvider);

    final screenSize = MediaQuery.of(context).size;

    return currentActivatedLiveIndex == null
        ? Stack(
            children: [
              // Same size
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: GridView.builder(
                      addAutomaticKeepAlives: false,
                      addRepaintBoundaries: false,
                      addSemanticIndexes: false,
                      shrinkWrap: false,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: liveCount == 1 ? 1 : 2,
                        mainAxisExtent: liveCount <= 2
                            ? screenSize.height
                            : screenSize.height / 2,
                        mainAxisSpacing: 0.0,
                        crossAxisSpacing: 0.0,
                      ),
                      itemCount: liveCount,
                      itemBuilder: (BuildContext context, int index) {
                        return Center(
                          child: SingleLivePlayer(index: index),
                        );
                      },
                    ),
                  ),
                  if (chatWindowMode == ChatWindowMode.side)
                    Expanded(
                      flex: 1,
                      child: LiveChatStream(
                        chatWindowMode: chatWindowMode,
                        liveDetail:
                            livePlaylist[currentActivatedLiveIndex ?? 0],
                      ),
                    ),
                ],
              ),
              // Chat
              if (chatWindowMode == ChatWindowMode.overlay)
                LiveChatStream(
                  chatWindowMode: chatWindowMode,
                  liveDetail: livePlaylist[currentActivatedLiveIndex ?? 0],
                ),
            ],
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Focused screen
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: SingleLivePlayer(index: currentActivatedLiveIndex),
                    ),
                    Expanded(
                      flex: 1,
                      child: LiveChatStream(
                        chatWindowMode: ChatWindowMode.side,
                        liveDetail: livePlaylist[currentActivatedLiveIndex],
                      ),
                    ),
                  ],
                ),
              ),
              // Others
              Expanded(
                flex: 1,
                child: ListView.builder(
                  addAutomaticKeepAlives: false,
                  addRepaintBoundaries: false,
                  addSemanticIndexes: false,
                  shrinkWrap: false,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.zero,
                  itemCount: livePlaylist.length,
                  itemBuilder: (context, index) {
                    if (index == currentActivatedLiveIndex) {
                      return const SizedBox.shrink();
                    }

                    return SizedBox(
                      width: screenSize.width / 3,
                      child: SingleLivePlayer(index: index),
                    );
                  },
                ),
              ),
            ],
          );
  }
}
