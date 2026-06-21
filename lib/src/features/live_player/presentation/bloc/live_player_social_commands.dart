part of 'live_player_bloc.dart';

typedef LivePlayerGroupAddCommandResult = ({
  GroupAddMemberResult result,
  GroupCollection? collection,
});

final class LivePlayerSocialCommands {
  const LivePlayerSocialCommands({
    required this.channelRepository,
    required this.groupRepository,
  });

  final ChannelRepository channelRepository;
  final GroupRepository groupRepository;

  Future<ChannelMyInfo> toggleFollowing({
    required String channelId,
    required bool currentlyFollowing,
  }) async {
    if (currentlyFollowing) {
      await channelRepository.unfollowChannel(channelId: channelId);
    } else {
      await channelRepository.followChannel(channelId: channelId);
    }

    return channelRepository.getMyInfo(channelId: channelId);
  }

  Future<LivePlayerGroupAddCommandResult> addChannelToGroup({
    required String groupId,
    required String channelId,
  }) async {
    final result = await groupRepository.addMember(
      groupId: groupId,
      channelId: channelId,
    );
    if (result != GroupAddMemberResult.added) {
      return (result: result, collection: null);
    }

    return (result: result, collection: await groupRepository.read());
  }

  Future<GroupCollection> activateGroup({required String groupId}) async {
    await groupRepository.activateGroup(groupId: groupId);
    return groupRepository.read();
  }
}
