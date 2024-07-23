import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/constants/api.dart';
import '../../../utils/dio/dio_client.dart';
import '../../auth/controller/auth_controller.dart';
import '../model/vod.dart';
import '../repository/vod_repository.dart';

part 'vod_controller.g.dart';

@riverpod
class VodController extends _$VodController {
  late VodRepository _repository;

  @override
  void build() {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = VodRepository(dio);

    return;
  }

  Future<Vod?> getVod({required int videoNo}) async {
    return await _repository.getVod(videoNo: videoNo);
  }

  // Don't use repository for the unity of dio client.
  // This request doesn't use response.data['content'] so can't use dio interceptor.
  Future<String?> getVodPlayback({required int videoNo}) async {
    final Vod? vod = await getVod(videoNo: videoNo);

    final auth = await ref.watch(authControllerProvider.future);
    final dio = ref.read(dioClientProvider.notifier).getBaseDio();

    if (vod != null && vod.inKey != null) {
      try {
        final response = await dio.get(
          options: auth?.getOptions(),
          '${ApiUrl.vodPlayback}/${vod.videoId}',
          queryParameters: {'key': vod.inKey},
        );

        final vodPath = response.data?['period'][0]['adaptationSet'][0]
            ['representation'][0]['baseURL'][0]['value'];

        return vodPath;
      } catch (_) {
        return null;
      }
    }

    return null;
  }
}

@riverpod
class FollowingVodController extends _$FollowingVodController {
  late VodRepository _repository;
  int? _next;

  @override
  FutureOr<List<Vod>?> build() async {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = VodRepository(dio);

    return await _initFetchFollowingVods();
  }

  Future<List<Vod>?> _initFetchFollowingVods() async {
    final followingVodResponse = await _repository.getFollowingVods(
      size: 18,
      nextNo: null,
    );

    _next = followingVodResponse?.next;

    return followingVodResponse?.data.map((e) => e.vod).toList();
  }

  Future<void> fetchMore() async {
    if (_next != null) {
      ref.read(followingVodFetchMoreStateProvider.notifier).setState(true);
      final prev = state.value;

      state = await AsyncValue.guard(() async {
        final followingVodResponse = await _repository.getFollowingVods(
          size: 18,
          nextNo: _next,
        );

        _next = followingVodResponse?.next;

        if (followingVodResponse?.data == null || _next == null) {
          return [...prev!];
        }

        ref.read(followingVodFetchMoreStateProvider.notifier).setState(false);
        return [...prev!, ...followingVodResponse!.data.map((e) => e.vod)];
      });
    }
  }
}

@riverpod
class PopularVodController extends _$PopularVodController {
  late VodRepository _repository;

  @override
  FutureOr<List<Vod>?> build() async {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = VodRepository(dio);

    return await fetchPopularVodList();
  }

  Future<List<Vod>?> fetchPopularVodList() async {
    final popularVodResponse = await _repository.getPopularVods(size: 60);

    return popularVodResponse?.videos;
  }
}

@riverpod
class FollowingVodFetchMoreState extends _$FollowingVodFetchMoreState {
  @override
  bool build() {
    return false;
  }

  void setState(bool value) {
    state = value;
  }
}
