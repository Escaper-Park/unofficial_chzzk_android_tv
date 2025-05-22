import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/constants/enums.dart' show AppRoute, FilterType;
import '../../../utils/extensions/custom_extensions.dart';
import '../../../utils/dio/dio_client.dart';
import '../../search_tag/model/search_tag_response.dart';
import '../../search_tag/repository/search_tag_repository.dart';
import '../../vod/model/vod.dart';

part 'search_tag_result_vod_controller.g.dart';

@riverpod
class SearchTagResultVodController extends _$SearchTagResultVodController {
  late SearchTagRepository _repository;

  SearchTagVodNext? _next;

  @override
  FutureOr<List<Vod>?> build({
    required String tag,
    required FilterType sortType,
  }) async {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = SearchTagRepository(dio);

    return await _fetch();
  }

  Future<List<Vod>?> _fetch() async {
    final response = await _repository.getSearchTagVodResponse(
      tag: tag,
      size: 18,
      sortType: sortType.value,
      start: null,
    );

    _next = response?.page?.next;

    return response?.data;
  }

  Future<void> fetchMore() async {
    if (_next == null) return;

    ref.setFetchMoreLoading(AppRoute.searchTagResult.routeName, true);
    final prev = state.value;

    state = await AsyncValue.guard(() async {
      final response = await _repository.getSearchTagVodResponse(
        tag: tag,
        size: 18,
        sortType: sortType.value,
        start: _next!.start,
      );

      _next = response?.page?.next;

      if (response?.data == null) return [...prev!];

      ref.setFetchMoreLoading(AppRoute.searchTagResult.routeName, false);
      return [...prev!, ...response!.data];
    });
  }
}
