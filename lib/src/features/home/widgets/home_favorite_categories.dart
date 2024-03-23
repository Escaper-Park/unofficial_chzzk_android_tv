import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/constants/dimensions.dart';
import '../../../common/widgets/center_text.dart';
import '../../category/controller/category_controller.dart';
import './home_favorite_category_container.dart';

class HomeFavoriteCategories extends ConsumerWidget {
  const HomeFavoriteCategories({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncFavoriteCategories =
        ref.watch(favoriteCategoriesControllerProvider);

    return SizedBox(
      height: Dimensions.homeFavoriteCategorySize.height,
      child: switch (asyncFavoriteCategories) {
        AsyncData(:final value) => value.isEmpty
            ? const CenterText(text: '즐겨찾기한 카테고리가 없습니다')
            : ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: value.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child:
                        HomeFavoriteCategoryContainer(category: value[index]),
                  );
                },
              ),
        AsyncError() => const CenterText(text: '카테고리 즐겨찾기를 불러올 수 없습니다'),
        _ => const CenterText(text: '즐겨찾기 카테고리 불러오는 중...'),
      },
    );
  }
}
