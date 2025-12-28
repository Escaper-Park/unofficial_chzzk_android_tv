import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/constants/enums.dart' show AppRoute, FilterType;
import '../../../utils/extensions/custom_extensions.dart';
import '../../live/model/live_info.dart';
import '../../search_tag/model/search_tag_response.dart';
import '../../search_tag/repository/search_tag_repository_wrapper.dart';

part 'search_tag_result_live_controller.g.dart';

@riverpod
class SearchTagResultLiveController extends _$SearchTagResultLiveController {
  late SearchTagRepositoryWrapper _repository;

  SearchTagLiveNext? _next;
  static const int _pageSize = 18;

  @override
  FutureOr<List<LiveInfo>?> build({
    required String tag,
    required FilterType sortType,
  }) async {
    _repository = ref.watch(searchTagRepositoryWrapperProvider);

    return await _fetch();
  }

  Future<List<LiveInfo>?> _fetch() async {
    final result = await _repository.getSearchTagLiveResponse(
      tags: tag,
      size: _pageSize,
      sortType: sortType.value,
      concurrentUserCount: null,
      liveId: null,
    );

    return result.when(
      success: (response) {
        _next = response?.page?.next;
        return response?.data;
      },
      failure: (_) => null,
    );
  }

  Future<void> fetchMore() async {
    if (_next == null) return;

    ref.setFetchMoreLoading(AppRoute.searchTagResult.routeName, true);
    final prev = state.value;

    state = await AsyncValue.guard(() async {
      final result = await _repository.getSearchTagLiveResponse(
        tags: tag,
        size: _pageSize,
        sortType: sortType.value,
        concurrentUserCount: _next!.concurrentUserCount,
        liveId: _next!.liveId,
      );

      return result.when(
        success: (response) {
          _next = response?.page?.next;

          if (response?.data == null) return [...prev!];

          ref.setFetchMoreLoading(AppRoute.searchTagResult.routeName, false);
          return [...prev!, ...response!.data];
        },
        failure: (_) {
          ref.setFetchMoreLoading(AppRoute.searchTagResult.routeName, false);
          return [...prev!];
        },
      );
    });
  }
}
