import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/constants/enums.dart' show FilterType, ClipOrderType;
import '../../../utils/dio/dio_client.dart';
import '../../clip/model/clip.dart';
import '../../clip/repository/clip_repository.dart';

part 'channel_clip_controller.g.dart';

@riverpod
class ChannelClipController extends _$ChannelClipController {
  late ClipRepository _repository;

  @override
  FutureOr<List<NaverClip>?> build({required String channelId}) async {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = ClipRepository(dio);
    return await _fetch();
  }

  Future<List<NaverClip>?> _fetch() async {
    final response = await _repository.getChannelClipResponse(
      channelId: channelId,
      filterType: FilterType.all.value,
      orderType: ClipOrderType.recent.value,
      size: 15,
      clipUID: null,
      readCount: null,
    );

    return response?.data;
  }
}
