import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/constants/enums.dart' show AppRoute, VideoSortType;
import '../../../utils/extensions/custom_extensions.dart';
import '../../user/controller/private_user_blocks_controller.dart';
import '../../vod/model/vod.dart';
import '../../vod/model/vod_response.dart';
import '../../vod/repository/vod_repository_wrapper.dart';

part 'vod_all_controller.g.dart';

@riverpod
class VodAllController extends _$VodAllController {
  late VodRepositoryWrapper _repository;
  late List<String> _privateUserBlocks;

  VodNext? _next;

  @override
  FutureOr<List<Vod>?> build({required VideoSortType sortType}) async {
    _repository = ref.watch(vodRepositoryWrapperProvider);
    _privateUserBlocks =
        await ref.watch(privateUserBlocksControllerProvider.future);

    return await _fetch();
  }

  Future<List<Vod>?> _fetch() async {
    final result = await _repository.getAllVods(
      size: 30,
      sortType: sortType.value,
      publishDateAt: null,
      readCount: null,
    );

    return result.when(
      success: (response) {
        _next = response?.page?.next;
        return _filterBlockedVods(response?.data);
      },
      failure: (_) => null,
    );
  }

  Future<void> fetchMore() async {
    if (_next == null) return;

    ref.setFetchMoreLoading(AppRoute.vodAll.routeName, true);
    final prev = state.value;

    state = await AsyncValue.guard(() async {
      final result = await _repository.getAllVods(
        size: 30,
        sortType: sortType.value,
        publishDateAt: _next!.publishDateAt,
        readCount: _next!.readCount,
      );

      return result.when(
        success: (response) {
          _next = response?.page?.next;
          ref.setFetchMoreLoading(AppRoute.vodAll.routeName, false);
          if (response?.data == null) return [...prev!];
          final filteredNewVods = _filterBlockedVods(response!.data) ?? [];
          return [...prev!, ...filteredNewVods];
        },
        failure: (_) {
          ref.setFetchMoreLoading(AppRoute.vodAll.routeName, false);
          return [...prev!];
        },
      );
    });
  }

  List<Vod>? _filterBlockedVods(List<Vod>? vods) {
    if (vods == null) return null;
    return vods
        .where(
          (vod) => !_privateUserBlocks.contains(vod.channel?.channelId),
        )
        .toList();
  }
}
