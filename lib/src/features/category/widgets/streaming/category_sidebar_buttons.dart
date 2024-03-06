import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/constants/styles.dart';
import '../../../../common/widgets/focused_outline_button.dart';
import '../../controller/category_controller.dart';

class CategorySidebarButtons extends HookConsumerWidget {
  const CategorySidebarButtons({
    super.key,
    required this.sidebarFocusNode,
  });

  final FocusNode sidebarFocusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryItem = ref.watch(currentCategoryItemProvider);
    final int currentIndex = categoryItem == CategoryItem.live ? 0 : 1;

    const int itemCount = 2;

    final focusNodes = List.generate(
      itemCount,
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
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return FocusedOutlineButton(
              focusNode: focusNodes[index],
              padding: const EdgeInsets.all(10.0),
              onPressed: () {
                if (currentIndex != index) {
                  ref.read(currentCategoryItemProvider.notifier).setState(
                        index == 0 ? CategoryItem.live : CategoryItem.vod,
                      );
                }
              },
              child: Center(
                child: Text(
                  index == 0 ? '라이브' : '동영상',
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
