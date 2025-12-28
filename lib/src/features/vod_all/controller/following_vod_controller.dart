import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/constants/enums.dart' show AppRoute;
import '../../../utils/extensions/custom_extensions.dart';
import '../../vod/model/vod.dart';
import '../../vod/model/vod_response.dart';
import '../../vod/repository/vod_repository_wrapper.dart';

part 'following_vod_controller.g.dart';

@riverpod
class FollowingVodController extends _$FollowingVodController {
  late VodRepositoryWrapper _repository;

  FollowingVodNext? _next;

  @override
  FutureOr<List<Vod>?> build() async {
    _repository = ref.watch(vodRepositoryWrapperProvider);

    return await _fetch();
  }

  Future<List<Vod>?> _fetch() async {
    final result = await _repository.getFollowingVods(
      size: 30,
      nextNo: null,
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

    ref.setFetchMoreLoading(AppRoute.vodAll.routeName, true);
    final prev = state.value;

    state = await AsyncValue.guard(() async {
      final result = await _repository.getFollowingVods(
        size: 30,
        nextNo: _next!.nextNo,
      );

      return result.when(
        success: (response) {
          _next = response?.page?.next;
          ref.setFetchMoreLoading(AppRoute.vodAll.routeName, false);
          if (response?.data == null) return [...prev!];
          return [...prev!, ...response!.data];
        },
        failure: (_) {
          ref.setFetchMoreLoading(AppRoute.vodAll.routeName, false);
          return [...prev!];
        },
      );
    });
  }
}
