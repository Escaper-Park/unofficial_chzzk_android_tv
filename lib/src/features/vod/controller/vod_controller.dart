import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../auth/controller/auth_controller.dart';
import '../model/vod.dart';
import '../repository/vod_repository.dart';

part 'vod_controller.g.dart';

@riverpod
class VodController extends _$VodController {
  Options? _options;
  late String _channelId;

  @override
  FutureOr<List<Vod>?> build({required String channelId}) async {
    final auth = await ref.watch(authControllerProvider.future);

    _options = auth?.getOptions();

    _channelId = channelId;

    final sortType = ref.watch(vodSortTypeControllerProvider);

    // (currentPage, vodList)
    return await fetchVodList(page: 0, sortType: sortType);
  }

  Future<List<Vod>?> fetchVodList({
    required int page,
    VodSortType sortType = VodSortType.latest,
  }) async {
    return await ref.watch(vodRepositoryProvider).getChannelVodList(
          channelId: _channelId,
          options: _options,
          page: page,
          vodSortType: sortType,
        );
  }

  Future<void> fetchVodListByPage({required int page}) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final sortType = ref.watch(vodSortTypeControllerProvider);

      final vodList = await fetchVodList(
        page: page,
        sortType: sortType,
      );

      return vodList;
    });
  }

  Future<String?> getVodPath({required int videoNo}) async {
    final String? vodPath = await ref
        .watch(vodRepositoryProvider)
        .getVodPath(videoNo: videoNo, options: _options);

    return vodPath;
  }
}

@riverpod
FutureOr<int?> channelVodTotalPages(
  ChannelVodTotalPagesRef ref, {
  required String channelId,
}) async {
  final auth = await ref.watch(authControllerProvider.future);

  final options = auth?.getOptions();

  return await ref.watch(vodRepositoryProvider).getChannelTotalPages(
        channelId: channelId,
        options: options,
      );
}

@riverpod
class VodSortTypeController extends _$VodSortTypeController {
  @override
  VodSortType build() {
    return VodSortType.latest;
  }

  void setState(VodSortType sortType) {
    if (state != sortType) {
      ref.read(currentVodPageIndexProvider.notifier).setState(0);
      state = sortType;
    }
  }
}

@riverpod
class CurrentVodPageIndex extends _$CurrentVodPageIndex {
  @override
  int build() {
    return 0;
  }

  void setState(int value) {
    if (state != value) state = value;
  }
}
