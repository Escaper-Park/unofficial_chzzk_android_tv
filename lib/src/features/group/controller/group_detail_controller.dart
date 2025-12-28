import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../channel/model/channel.dart';
import '../../channel/repository/channel_repository_wrapper.dart';
import '../model/group.dart';

part 'group_detail_controller.g.dart';

@riverpod
class GroupDetailController extends _$GroupDetailController {
  late ChannelRepositoryWrapper _channelRepository;

  @override
  FutureOr<List<Channel>?> build({required Group group}) async {
    _channelRepository = ref.watch(channelRepositoryWrapperProvider);

    return await getChannels(group);
  }

  Future<List<Channel>?> getChannels(Group? group) async {
    if (group == null || group.members.isEmpty) return [];

    final List<Channel?> fetched = await Future.wait(
      group.members.map((channelId) async {
        final result =
            await _channelRepository.getChannel(channelId: channelId);
        return result.when(
          success: (channel) => channel,
          failure: (_) => null,
        );
      }),
    );

    return fetched.whereType<Channel>().toList();
  }
}
