import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/extensions/custom_extensions.dart';
import '../../../common/constants/enums.dart'
    show AppRoute, FilterType, ClipOrderType;
import '../../../utils/dio/dio_client.dart';
import '../../clip/model/clip.dart';
import '../../clip/model/clip_response.dart';
import '../../clip/repository/clip_repository.dart';

part 'channel_clip_all_controller.g.dart';

@riverpod
class ChannelClipAllController extends _$ChannelClipAllController {
  late ClipRepository _repository;

  ChannelClipNext? _next;

  @override
  FutureOr<List<NaverClip>?> build({
    required String channelId,
    required FilterType filterType,
    required ClipOrderType orderType,
  }) async {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = ClipRepository(dio);

    return await _fetch();
  }

  Future<List<NaverClip>?> _fetch() async {
    final response = await _repository.getChannelClipResponse(
      channelId: channelId,
      filterType: filterType.value,
      orderType: orderType.value,
      size: 15,
      clipUID: null,
      readCount: null,
    );

    _next = response?.page?.next;

    return response?.data;
  }

  Future<void> fetchMore() async {
    if (_next == null) return;
    ref.setFetchMoreLoading(AppRoute.channelClip.routeName, true);

    final prev = state.value;

    state = await AsyncValue.guard(
      () async {
        final response = await _repository.getChannelClipResponse(
          channelId: channelId,
          filterType: filterType.value,
          orderType: orderType.value,
          size: 15,
          clipUID: _next!.clipUID,
          readCount: _next!.readCount,
        );

        _next = response?.page?.next;

        if (response?.data == null) return [...prev!];

        ref.setFetchMoreLoading(AppRoute.channelClip.routeName, false);
        return [...prev!, ...response!.data];
      },
    );
  }
}
