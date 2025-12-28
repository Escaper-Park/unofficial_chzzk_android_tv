import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/constants/enums.dart'
    show AppRoute, FilterType, ClipOrderType;
import '../../../utils/extensions/custom_extensions.dart';
import '../../clip/model/clip.dart';
import '../../clip/model/clip_response.dart';
import '../../clip/repository/clip_repository_wrapper.dart';

part 'clip_popular_controller.g.dart';

@riverpod
class ClipPopularController extends _$ClipPopularController {
  late ClipRepositoryWrapper _repository;

  PopularClipNext? _next;

  @override
  FutureOr<List<NaverClip>?> build({
    required FilterType filterType,
    required ClipOrderType orderType,
  }) async {
    _repository = ref.watch(clipRepositoryWrapperProvider);

    return await _fetch();
  }

  Future<List<NaverClip>?> _fetch() async {
    final result = await _repository.getPopularClips(
      filterType: filterType.value,
      orderType: orderType.value,
      next: null,
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
    ref.setFetchMoreLoading(AppRoute.popularClips.routeName, true);

    final prev = state.value;

    state = await AsyncValue.guard(
      () async {
        final result = await _repository.getPopularClips(
          filterType: filterType.value,
          orderType: orderType.value,
          next: _next!.next,
        );

        return result.when(
          success: (response) {
            _next = response?.page?.next;
            ref.setFetchMoreLoading(AppRoute.popularClips.routeName, false);
            if (response?.data == null) return [...prev!];
            return [...prev!, ...response!.data];
          },
          failure: (_) {
            ref.setFetchMoreLoading(AppRoute.popularClips.routeName, false);
            return [...prev!];
          },
        );
      },
    );
  }
}
