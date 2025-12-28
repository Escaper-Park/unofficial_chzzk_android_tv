import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/category.dart';
import '../model/category_response.dart';
import '../repository/category_repository_wrapper.dart';

part 'category_controller.g.dart';

@riverpod
class CategoryController extends _$CategoryController {
  late CategoryRepositoryWrapper _repository;

  CategoryNext? _next;

  @override
  FutureOr<List<Category>?> build() async {
    _repository = ref.watch(categoryRepositoryWrapperProvider);

    return await _fetch();
  }

  Future<List<Category>?> _fetch() async {
    final result = await _repository.getCategories(
      categoryId: null,
      concurrentUserCount: null,
      openLiveCount: null,
      size: 20,
    );

    return result.when(
      success: (categoryResponse) {
        _next = categoryResponse?.page?.next;
        return categoryResponse?.data;
      },
      failure: (exception) {
        // Log error or handle appropriately
        return null;
      },
    );
  }

  Future<void> fetchMore() async {
    if (_next == null) return;

    final prev = state.value;

    state = await AsyncValue.guard(
      () async {
        final result = await _repository.getCategories(
          categoryId: _next!.categoryId,
          concurrentUserCount: _next!.concurrentUserCount,
          openLiveCount: _next!.openLiveCount,
          size: 20,
        );

        return result.when(
          success: (categoryResponse) {
            _next = categoryResponse?.page?.next;

            if (categoryResponse?.data == null) return [...prev!];

            return [...prev!, ...categoryResponse!.data];
          },
          failure: (exception) {
            // On failure, return previous state without modification
            return [...prev!];
          },
        );
      },
    );
  }

  Category findById(String categoryId) {
    return state.value!
        .firstWhere((category) => category.categoryId == categoryId);
  }
}
