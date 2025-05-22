import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'controller/category_controller.dart';
import 'model/category.dart';

mixin class CategoryState {
  AsyncValue<List<Category>?> getAsyncCategoryList(WidgetRef ref) =>
      ref.watch(categoryControllerProvider);
}
