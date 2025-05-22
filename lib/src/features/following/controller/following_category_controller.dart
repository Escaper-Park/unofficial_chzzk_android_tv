import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/dio/dio_client.dart';
import '../../category/model/category.dart';
import '../../category/repository/category_repository.dart';

part 'following_category_controller.g.dart';

@riverpod
class FollowingCategoryController extends _$FollowingCategoryController {
  late CategoryRepository _repository;

  @override
  FutureOr<List<Category>?> build() async {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = CategoryRepository(dio);

    return await _fetch();
  }

  Future<List<Category>?> _fetch() async {
    final response = await _repository.getFollowingCategories();

    return response?.followingList;
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
    final res = await _repository
        .follow(
          categoryType: category.categoryType,
          categoryId: category.categoryId,
        )
        .then((_) => true)
        .catchError((_) => false);

    return res;
  }

  Future<bool> _unFollow(Category category) async {
    final res = await _repository
        .unFollow(
          categoryType: category.categoryType,
          categoryId: category.categoryId,
        )
        .then((_) => true)
        .catchError((_) => false);

    return res;
  }
}
