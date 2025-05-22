import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../utils/extensions/extensions.dart';

import '../../common/constants/enums.dart' show AppRoute;
import 'controller/category_controller.dart';
import 'model/category.dart';

mixin class CategoryEvent {
  void pushCategoryDetail(
    BuildContext context, {
    required Category category,
  }) {
    final currentLocation = AppRoute.category;

    context.pushTo(
      context: context,
      currentLocation: currentLocation,
      appRoute: AppRoute.categoryDetail,
      extra: {'baseRoute': currentLocation},
      pathParameters: {'categoryId': category.categoryId},
    );
  }

  Future<void> fetchMore(WidgetRef ref) async {
    await ref.read(categoryControllerProvider.notifier).fetchMore();
  }
}
