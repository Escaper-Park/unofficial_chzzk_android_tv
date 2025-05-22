import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/dio/dio_client.dart';

import '../../channel/model/channel.dart';
import '../../user/controller/private_user_blocks_controller.dart';
import '../../vod/model/vod.dart';
import '../../search/repository/search_repository.dart';

part 'search_vod_controller.g.dart';

@riverpod
class SearchVodController extends _$SearchVodController {
  late SearchRepository _repository;
  late List<String> _privateUserBlocks;

  @override
  FutureOr<List<Vod>?> build({required String keyword}) async {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = SearchRepository(dio);
    _privateUserBlocks =
        await ref.watch(privateUserBlocksControllerProvider.future);

    return await _getSearchVodResponse(keyword: keyword);
  }

  Future<List<Vod>?> _getSearchVodResponse({
    required String keyword,
  }) async {
    final response = await _repository.getSearchVodResponse(
      keyword: keyword,
      offset: 0,
      size: 18,
    );

    final data = response?.data.map(
      (e) {
        final channel =
            Channel.fromJson((e as Map<String, dynamic>)['channel']);
        final vod = (e)['video'];

        return Vod.fromJson(vod).copyWith(channel: channel);
      },
    ).toList();

    return _filterBlockedVods(data);
  }

  List<Vod>? _filterBlockedVods(List<Vod>? vods) {
    if (vods == null) return null;
    return vods
        .where((vod) => !_privateUserBlocks.contains(vod.channel?.channelId))
        .toList();
  }
}
