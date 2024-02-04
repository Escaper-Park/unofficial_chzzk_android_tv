import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../network_video_controller.dart';
import './multi_view_contorl_card.dart';

class MultiViewOverlayControls extends ConsumerWidget {
  const MultiViewOverlayControls({
    super.key,
    required this.chewieControllers,
    required this.timer,
    required this.videoFocusNode,
    required this.profileImageUrls,
  });

  final List<ChewieController> chewieControllers;
  final Timer timer;
  final FocusNode videoFocusNode;
  final List<String?> profileImageUrls;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        ref.read(videoControlsTimerProvider.notifier).showControlsWithTimer(
              videoFocusNode: videoFocusNode,
              seconds: 0,
            );
      },
      child: MultiViewLiveControlButtons(
        chewieControllers: chewieControllers,
        timer: timer,
        videoFocusNode: videoFocusNode,
        profileImageUrls: profileImageUrls,
      ),
    );
  }
}

class MultiViewLiveControlButtons extends HookConsumerWidget {
  const MultiViewLiveControlButtons({
    super.key,
    required this.chewieControllers,
    required this.timer,
    required this.videoFocusNode,
    required this.profileImageUrls,
  });

  final List<ChewieController> chewieControllers;
  final Timer timer;
  final FocusNode videoFocusNode;
  final List<String?> profileImageUrls;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusScopeNode = useFocusScopeNode();

    return Stack(
      children: [
        // Play-Pause Button
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            height: double.infinity,
            width: 300,
            color: Colors.black.withOpacity(0.9),
            child: FocusScope(
              node: focusScopeNode,
              child: ListView.builder(
                itemCount: chewieControllers.length,
                itemBuilder: (context, index) {
                  return MultiViewControlCard(
                    autofocus: index == 0 ? true : false,
                    index: index,
                    profileImageUrl: profileImageUrls[index],
                    videoFocusNode: videoFocusNode,
                    controller: chewieControllers[index],
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
