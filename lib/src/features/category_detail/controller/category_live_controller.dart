import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/constants/enums.dart' show AppRoute;
import '../../../utils/dio/dio_client.dart';
import '../../../utils/extensions/custom_extensions.dart';

import '../../category/model/category.dart';
import '../../category/repository/category_repository.dart';
import '../../live/model/live_info.dart';
import '../../live/model/live_response.dart';

part 'category_live_controller.g.dart';

@riverpod
class CategoryLiveController extends _$CategoryLiveController {
  late CategoryRepository _repository;

  LiveNext? _next;

  @override
  FutureOr<List<LiveInfo>?> build({required Category category}) async {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = CategoryRepository(dio);

    return await _fetch();
  }

  Future<List<LiveInfo>?> _fetch() async {
    final response = await _repository.getCategoryLives(
      categoryType: category.categoryType,
      categoryId: category.categoryId,
      concurrentUserCount: null,
      liveId: null,
      size: 18,
    );

    _next = response?.page?.next;

    return response?.data;
  }

  Future<void> fetchMore() async {
    if (_next == null) return;
    ref.setFetchMoreLoading(AppRoute.categoryDetail.routeName, true);

    final prev = state.value;

    state = await AsyncValue.guard(
      () async {
        final response = await _repository.getCategoryLives(
          categoryType: category.categoryType,
          categoryId: category.categoryId,
          concurrentUserCount: _next!.concurrentUserCount,
          liveId: _next!.liveId,
          size: 18,
        );

        _next = response?.page?.next;

        if (response?.data == null) return [...prev!];

        ref.setFetchMoreLoading(AppRoute.categoryDetail.routeName, false);
        return [...prev!, ...response!.data];
      },
    );
  }
}
