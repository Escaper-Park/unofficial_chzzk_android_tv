import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/constants/enums.dart' show AppRoute;
import '../../../utils/extensions/custom_extensions.dart';
import '../../../utils/dio/dio_client.dart';
import '../../vod/model/vod.dart';
import '../../vod/model/vod_response.dart';
import '../../vod/repository/vod_repository.dart';

part 'following_vod_controller.g.dart';

@riverpod
class FollowingVodController extends _$FollowingVodController {
  late VodRepository _repository;

  FollowingVodNext? _next;

  @override
  FutureOr<List<Vod>?> build() async {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = VodRepository(dio);

    return await _fetch();
  }

  Future<List<Vod>?> _fetch() async {
    final response = await _repository.getFollowingVods(
      size: 30,
      nextNo: null,
    );

    _next = response?.page?.next;

    return response?.data;
  }

  Future<void> fetchMore() async {
    if (_next == null) return;

    ref.setFetchMoreLoading(AppRoute.vodAll.routeName, true);
    final prev = state.value;

    state = await AsyncValue.guard(() async {
      final response = await _repository.getFollowingVods(
        size: 30,
        nextNo: _next!.nextNo,
      );

      _next = response?.page?.next;

      if (response?.data == null) return [...prev!];

      ref.setFetchMoreLoading(AppRoute.vodAll.routeName, false);
      return [...prev!, ...response!.data];
    });
  }
}
