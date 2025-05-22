import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/dio/dio_client.dart';
import '../../channel/model/channel.dart';
import '../../channel/repository/channel_repository.dart';
import '../model/group.dart';

part 'group_detail_controller.g.dart';

@riverpod
class GroupDetailController extends _$GroupDetailController {
  late ChannelRepository _channelRepository;

  @override
  FutureOr<List<Channel>?> build({required Group group}) async {
    final Dio dio = ref.watch(dioClientProvider);
    _channelRepository = ChannelRepository(dio);

    return await getChannels(group);
  }

  Future<List<Channel>?> getChannels(Group? group) async {
    if (group == null || group.members.isEmpty) return [];

    final List<Channel?> fetched = await Future.wait(
      group.members.map(
        (channelId) => _channelRepository.getChannel(channelId: channelId),
      ),
    );

    return fetched.whereType<Channel>().toList();
  }
}
