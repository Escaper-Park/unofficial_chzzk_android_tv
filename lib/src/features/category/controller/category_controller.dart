import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/dio/dio_client.dart';
import '../model/category.dart';
import '../model/category_response.dart';
import '../repository/category_repository.dart';

part 'category_controller.g.dart';

@riverpod
class CategoryController extends _$CategoryController {
  late CategoryRepository _repository;

  CategoryNext? _next;

  @override
  FutureOr<List<Category>?> build() async {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = CategoryRepository(dio);

    return await _fetch();
  }

  Future<List<Category>?> _fetch() async {
    final categoryResponse = await _repository.getCategories(
      categoryId: null,
      concurrentUserCount: null,
      openLiveCount: null,
      size: 20,
    );

    _next = categoryResponse?.page?.next;

    return categoryResponse?.data;
  }

  Future<void> fetchMore() async {
    if (_next == null) return;

    final prev = state.value;

    state = await AsyncValue.guard(
      () async {
        final categoryResponse = await _repository.getCategories(
          categoryId: _next!.categoryId,
          concurrentUserCount: _next!.concurrentUserCount,
          openLiveCount: _next!.openLiveCount,
          size: 20,
        );

        _next = categoryResponse?.page?.next;

        if (categoryResponse?.data == null) return [...prev!];

        return [...prev!, ...categoryResponse!.data];
      },
    );
  }

  Category findById(String categoryId) {
    return state.value!
        .firstWhere((category) => category.categoryId == categoryId);
  }
}
