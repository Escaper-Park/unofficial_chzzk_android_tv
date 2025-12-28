import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../channel/model/channel.dart';
import '../../search/repository/search_repository_wrapper.dart';
import '../../user/controller/private_user_blocks_controller.dart';

part 'search_channel_controller.g.dart';

@riverpod
class SearchChannelController extends _$SearchChannelController {
  late SearchRepositoryWrapper _repository;
  late List<String> _privateUserBlocks;

  @override
  FutureOr<List<Channel>?> build({required String keyword}) async {
    _repository = ref.watch(searchRepositoryWrapperProvider);
    _privateUserBlocks =
        await ref.watch(privateUserBlocksControllerProvider.future);

    return await _getSearchChannelResponse(keyword: keyword);
  }

  Future<List<Channel>?> _getSearchChannelResponse({
    required String keyword,
  }) async {
    final result = await _repository.searchChannels(
      keyword: keyword,
      offset: 0,
      size: 18,
      withFirstChannelContent: false,
    );

    return result.when(
      success: (response) {
        final searchResult = response?.data
            .map(
              (e) => Channel.fromJson(
                (e as Map<String, dynamic>)['channel'],
              ),
            )
            .toList();

        return _filterBlockedChannels(searchResult);
      },
      failure: (_) => null,
    );
  }

  List<Channel>? _filterBlockedChannels(List<Channel>? channels) {
    if (channels == null) return null;
    return channels
        .where((channel) => !_privateUserBlocks.contains(channel.channelId))
        .toList();
  }
}
