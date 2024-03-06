import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../controller/multi_view_stream_controller.dart';

class MultiViewDynamicScreens extends ConsumerWidget {
  const MultiViewDynamicScreens({
    super.key,
    required this.chewieControllers,
  });

  final List<ChewieController> chewieControllers;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final multiViewCount = chewieControllers.length;
    final screenHeight = MediaQuery.of(context).size.height;

    final currentSelectedChannelIndex =
        ref.watch(multiViewStreamControllerProvider);

    return currentSelectedChannelIndex == null
        ? GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent:
                  multiViewCount == 2 ? screenHeight : screenHeight / 2,
              crossAxisSpacing: 0.0,
              mainAxisSpacing: 0.0,
            ),
            itemCount: chewieControllers.length,
            itemBuilder: (context, index) {
              return Center(
                child: Chewie(
                  controller: chewieControllers[index],
                ),
              );
            },
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Chewie(
                  controller: chewieControllers[currentSelectedChannelIndex],
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: GridView.builder(
                    // Set shrinkWrap to true for fitting the size of [GridView]
                    // to the size of children. (To use [Center] widget)
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 0.0,
                      mainAxisSpacing: 0.0,
                      mainAxisExtent: screenHeight / 3,
                    ),
                    itemCount: (chewieControllers.length - 1),
                    itemBuilder: (context, index) {
                      final removedControllers = List.from(chewieControllers)
                        ..removeAt(currentSelectedChannelIndex);

                      return Center(
                        child: Chewie(
                          controller: removedControllers[index],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
  }
}
