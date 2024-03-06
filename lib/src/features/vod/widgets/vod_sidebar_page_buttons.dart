import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/constants/styles.dart';
import '../../../common/widgets/focused_outline_button.dart';
import '../controller/vod_controller.dart';

class VodSidebarPageButtons extends HookConsumerWidget {
  const VodSidebarPageButtons({
    super.key,
    required this.channelId,
    required this.totalPages,
    required this.sidebarFocusNode,
  });

  final String channelId;
  final int totalPages;
  final FocusNode sidebarFocusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentVodPageIndexProvider);

    final focusNodes = List.generate(
      totalPages,
      (_) => useFocusNode(),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Focus(
        focusNode: sidebarFocusNode,
        onFocusChange: (value) {
          if (value) focusNodes[currentIndex].requestFocus();
        },
        child: ListView.builder(
          itemCount: totalPages,
          itemBuilder: (context, index) {
            return FocusedOutlineButton(
              focusNode: focusNodes[index],
              padding: const EdgeInsets.all(10.0),
              onPressed: () {
                if (currentIndex != index) {
                  // Change State
                  ref
                      .read(
                          vodControllerProvider(channelId: channelId).notifier)
                      .fetchVodListByPage(page: index);
                  ref
                      .read(currentVodPageIndexProvider.notifier)
                      .setState(index);
                }
              },
              child: Center(
                child: Text(
                  '${index + 1}',
                  style: TextStyle(
                    color: currentIndex == index
                        ? AppColors.chzzkColor
                        : AppColors.whiteColor,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
