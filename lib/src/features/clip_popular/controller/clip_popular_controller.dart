import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/extensions/custom_extensions.dart';
import '../../../common/constants/enums.dart'
    show AppRoute, FilterType, ClipOrderType;
import '../../../utils/dio/dio_client.dart';
import '../../clip/model/clip.dart';
import '../../clip/model/clip_response.dart';
import '../../clip/repository/clip_repository.dart';

part 'clip_popular_controller.g.dart';

@riverpod
class ClipPopularController extends _$ClipPopularController {
  late ClipRepository _repository;

  PopularClipNext? _next;

  @override
  FutureOr<List<NaverClip>?> build({
    required FilterType filterType,
    required ClipOrderType orderType,
  }) async {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = ClipRepository(dio);

    return await _fetch();
  }

  Future<List<NaverClip>?> _fetch() async {
    final response = await _repository.getPopularClipResponse(
      filterType: filterType.value,
      orderType: orderType.value,
      next: null,
    );

    _next = response?.page?.next;

    return response?.data;
  }

  Future<void> fetchMore() async {
    if (_next == null) return;
    ref.setFetchMoreLoading(AppRoute.popularClips.routeName, true);

    final prev = state.value;

    state = await AsyncValue.guard(
      () async {
        final response = await _repository.getPopularClipResponse(
          filterType: filterType.value,
          orderType: orderType.value,
          next: _next!.next,
        );

        _next = response?.page?.next;

        if (response?.data == null) return [...prev!];

        ref.setFetchMoreLoading(AppRoute.popularClips.routeName, false);
        return [...prev!, ...response!.data];
      },
    );
  }
}
