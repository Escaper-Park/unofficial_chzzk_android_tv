import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/dio/dio_client.dart';

import '../../channel/model/channel.dart';
import '../../search/repository/search_repository.dart';
import '../../user/controller/private_user_blocks_controller.dart';

part 'search_channel_controller.g.dart';

@riverpod
class SearchChannelController extends _$SearchChannelController {
  late SearchRepository _repository;
  late List<String> _privateUserBlocks;

  @override
  FutureOr<List<Channel>?> build({required String keyword}) async {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = SearchRepository(dio);
    _privateUserBlocks =
        await ref.watch(privateUserBlocksControllerProvider.future);

    return await _getSearchChannelResponse(keyword: keyword);
  }

  Future<List<Channel>?> _getSearchChannelResponse({
    required String keyword,
  }) async {
    final response = await _repository.getSearchChannelResponse(
      keyword: keyword,
      offset: 0,
      size: 18,
      withFirstChannelContent: false,
    );

    final searchResult = response?.data
        .map(
          (e) => Channel.fromJson(
            (e as Map<String, dynamic>)['channel'],
          ),
        )
        .toList();

    return _filterBlockedChannels(searchResult);
  }

  List<Channel>? _filterBlockedChannels(List<Channel>? channels) {
    if (channels == null) return null;
    return channels
        .where((channel) => !_privateUserBlocks.contains(channel.channelId))
        .toList();
  }
}
