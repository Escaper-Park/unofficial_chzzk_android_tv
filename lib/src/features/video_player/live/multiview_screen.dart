import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';

import '../../live/model/live.dart';
import 'controller/live_player_controller.dart';
import 'single_live_player.dart';
import 'widgets/chat/live_chat_stream.dart';

class MultiviewScreen extends ConsumerWidget {
  const MultiviewScreen({
    super.key,
    required this.liveDetail,
    required this.controllers,
  });

  final LiveDetail liveDetail;
  final List<VideoPlayerController> controllers;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final liveCount = controllers.length;
    final screenSize = MediaQuery.of(context).size;

    final multiviewMainScreenIndex =
        ref.watch(multiviewMainScreenIndexProvider);

    return multiviewMainScreenIndex == null
        ? GridView.builder(
            addAutomaticKeepAlives: false,
            addRepaintBoundaries: false,
            addSemanticIndexes: false,
            // // Set shrinkWrap to true for fitting the size of [GridView]
            // // to the size of children. (To use [Center] widget)
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: liveCount == 1 ? 1 : 2,
              mainAxisExtent:
                  liveCount <= 2 ? screenSize.height : screenSize.height / 2,
              mainAxisSpacing: 0.0,
              crossAxisSpacing: 0.0,
            ),
            itemCount: liveCount,
            itemBuilder: (context, index) {
              return Center(
                child: SingleLivePlayer(controller: controllers[index]),
              );
            },
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Focused
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: SingleLivePlayer(
                        controller: controllers[multiviewMainScreenIndex],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: LiveChatStream(
                        screenMode: LivePlayerScreenMode.singleChat,
                        liveDetail: liveDetail,
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
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.zero,
                  itemExtent: screenSize.width / 3,
                  itemCount: controllers.length - 1,
                  itemBuilder: (context, index) {
                    final removedControllers = List.from(controllers)
                      ..removeAt(multiviewMainScreenIndex);

                    return Center(
                      child: SingleLivePlayer(
                        controller: removedControllers[index],
                      ),
                    );
                  },
                ),
              )
            ],
          );
  }
}
