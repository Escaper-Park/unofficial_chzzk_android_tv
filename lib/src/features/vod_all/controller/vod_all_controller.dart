import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/extensions/custom_extensions.dart';
import '../../../common/constants/enums.dart' show AppRoute, VideoSortType;
import '../../../utils/dio/dio_client.dart';
import '../../user/controller/private_user_blocks_controller.dart';
import '../../vod/model/vod.dart';
import '../../vod/model/vod_response.dart';
import '../../vod/repository/vod_repository.dart';

part 'vod_all_controller.g.dart';

@riverpod
class VodAllController extends _$VodAllController {
  late VodRepository _repository;
  late List<String> _privateUserBlocks;

  VodNext? _next;

  @override
  FutureOr<List<Vod>?> build({required VideoSortType sortType}) async {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = VodRepository(dio);
    _privateUserBlocks =
        await ref.watch(privateUserBlocksControllerProvider.future);

    return await _fetch();
  }

  Future<List<Vod>?> _fetch() async {
    final response = await _repository.getAllVods(
      size: 30,
      sortType: sortType.value,
      publishDateAt: null,
      readCount: null,
    );

    _next = response?.page?.next;

    return _filterBlockedVods(response?.data);
  }

  Future<void> fetchMore() async {
    if (_next == null) return;

    ref.setFetchMoreLoading(AppRoute.vodAll.routeName, true);
    final prev = state.value;

    state = await AsyncValue.guard(() async {
      final response = await _repository.getAllVods(
        size: 30,
        sortType: sortType.value,
        publishDateAt: _next!.publishDateAt,
        readCount: _next!.readCount,
      );

      _next = response?.page?.next;

      if (response?.data == null) return [...prev!];
      final filteredNewVods = _filterBlockedVods(response!.data) ?? [];

      ref.setFetchMoreLoading(AppRoute.vodAll.routeName, false);
      return [...prev!, ...filteredNewVods];
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
