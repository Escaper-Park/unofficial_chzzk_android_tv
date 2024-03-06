import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/constants/dimensions.dart';
import '../../../../common/constants/styles.dart';
import '../../../../common/widgets/focused_outline_button.dart';
import '../../controller/category_controller.dart';
import '../../model/category.dart';

class CategoryFavoriteButton extends ConsumerWidget {
  const CategoryFavoriteButton({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FocusedOutlineButton(
      padding: const EdgeInsets.all(10.0),
      onPressed: () {
        ref
            .read(favoriteCategoriesControllerProvider.notifier)
            .toggleFavorite(category: category);
      },
      child: SizedBox(
        width: Dimensions.favoriteButtonWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                final isFavorite =
                    ref.watch(favoriteCategoriesControllerProvider);

                return switch (isFavorite) {
                  AsyncData(:final value) => Icon(
                      value.any((ct) => ct.categoryId == category.categoryId)
                          ? Icons.star_rounded
                          : Icons.star_outline_rounded,
                      color: AppColors.whiteColor,
                      size: 24.0,
                    ),
                  AsyncError() => const Text('즐겨찾기 에러'),
                  _ => const SizedBox.shrink(),
                };
              },
            ),
            const Expanded(
              child: Center(
                child: Text(
                  '즐겨찾기',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
