import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/constants/enums.dart' show FilterType, ClipOrderType;
import '../../clip/model/clip.dart';
import '../../clip/repository/clip_repository_wrapper.dart';

part 'channel_clip_controller.g.dart';

@riverpod
class ChannelClipController extends _$ChannelClipController {
  late ClipRepositoryWrapper _repository;

  @override
  FutureOr<List<NaverClip>?> build({required String channelId}) async {
    _repository = ref.watch(clipRepositoryWrapperProvider);
    return await _fetch();
  }

  Future<List<NaverClip>?> _fetch() async {
    final result = await _repository.getChannelClips(
      channelId: channelId,
      filterType: FilterType.all.value,
      orderType: ClipOrderType.recent.value,
      size: 15,
      clipUID: null,
      readCount: null,
    );

    return result.when(
      success: (response) => response?.data,
      failure: (_) => null,
    );
  }
}
