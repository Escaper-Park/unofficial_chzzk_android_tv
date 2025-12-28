import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../category/model/category.dart';
import '../../category/repository/category_repository_wrapper.dart';

part 'following_category_controller.g.dart';

@riverpod
class FollowingCategoryController extends _$FollowingCategoryController {
  late CategoryRepositoryWrapper _repository;

  @override
  FutureOr<List<Category>?> build() async {
    _repository = ref.watch(categoryRepositoryWrapperProvider);

    return await _fetch();
  }

  Future<List<Category>?> _fetch() async {
    final result = await _repository.getFollowingCategories();

    return result.when(
      success: (response) => response?.followingList,
      failure: (exception) {
        // Log error or handle appropriately
        return null;
      },
    );
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(_fetch);
  }

  Category findById(String categoryId) {
    return state.value!
        .firstWhere((category) => category.categoryId == categoryId);
  }

  Future<void> toggleFollow({
    required bool isFollowing,
    required Category category,
  }) async {
    if (state.value == null) return;

    final success =
        isFollowing ? await _unFollow(category) : await _follow(category);

    if (!success) return;

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(_fetch);
  }

  Future<bool> _follow(Category category) async {
    final result = await _repository.follow(
      categoryType: category.categoryType,
      categoryId: category.categoryId,
    );

    return result.when(
      success: (_) => true,
      failure: (_) => false,
    );
  }

  Future<bool> _unFollow(Category category) async {
    final result = await _repository.unFollow(
      categoryType: category.categoryType,
      categoryId: category.categoryId,
    );

    return result.when(
      success: (_) => true,
      failure: (_) => false,
    );
  }
}
