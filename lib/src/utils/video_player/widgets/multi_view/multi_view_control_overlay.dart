import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../controller/network_video_controller.dart';
import 'multi_view_control_card.dart';

class MultiViewControlOverlay extends HookConsumerWidget {
  const MultiViewControlOverlay({
    super.key,
    required this.controllers,
    required this.videoFocusNode,
    required this.profileImageUrls,
  });

  final List<ChewieController> controllers;
  final FocusNode videoFocusNode;
  final List<String?> profileImageUrls;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusScopeNode = useFocusScopeNode();

    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        ref.read(controlOverlayTimerProvider.notifier).showOverlayAndStartTimer(
              videoFocusNode: videoFocusNode,
              seconds: 0,
            );
      },
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: double.infinity,
              width: 300,
              color: Colors.black.withOpacity(0.9),
              child: FocusScope(
                node: focusScopeNode,
                child: ListView.builder(
                  itemCount: controllers.length,
                  itemBuilder: (context, index) {
                    return MultiViewControlCard(
                      autofocus: index == 0 ? true : false,
                      index: index,
                      profileImageUrl: profileImageUrls[index],
                      videoFocusNode: videoFocusNode,
                      controller: controllers[index],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
