import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../channel/model/channel.dart';
import '../../user/controller/private_user_blocks_controller.dart';
import '../../vod/model/vod.dart';
import '../../search/repository/search_repository_wrapper.dart';

part 'search_vod_controller.g.dart';

@riverpod
class SearchVodController extends _$SearchVodController {
  late SearchRepositoryWrapper _repository;
  late List<String> _privateUserBlocks;

  @override
  FutureOr<List<Vod>?> build({required String keyword}) async {
    _repository = ref.watch(searchRepositoryWrapperProvider);
    _privateUserBlocks =
        await ref.watch(privateUserBlocksControllerProvider.future);

    return await _getSearchVodResponse(keyword: keyword);
  }

  Future<List<Vod>?> _getSearchVodResponse({
    required String keyword,
  }) async {
    final result = await _repository.searchVods(
      keyword: keyword,
      offset: 0,
      size: 18,
    );

    return result.when(
      success: (response) {
        final data = response?.data.map(
          (e) {
            final channel =
                Channel.fromJson((e as Map<String, dynamic>)['channel']);
            final vod = (e)['video'];

            return Vod.fromJson(vod).copyWith(channel: channel);
          },
        ).toList();

        return _filterBlockedVods(data);
      },
      failure: (_) => null,
    );
  }

  List<Vod>? _filterBlockedVods(List<Vod>? vods) {
    if (vods == null) return null;
    return vods
        .where((vod) => !_privateUserBlocks.contains(vod.channel?.channelId))
        .toList();
  }
}
