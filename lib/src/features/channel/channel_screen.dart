import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/constants/dimensions.dart';
import '../../common/constants/enums.dart' show AppRoute, DpadAction;
import '../../common/constants/styles.dart' show AppColors;
import '../../common/widgets/dpad/dpad_widgets.dart';
import '../../common/widgets/ui/ui_widgets.dart';
import '../../utils/hooks/custom_hooks.dart';

import '../clip/model/clip.dart';
import '../clip/widgets/clip_container.dart';
import '../following/model/following.dart';
import '../following/widgets/following_widgets.dart'
    show FollowingButtonWithAsyncValue;
import '../group/widgets/group_list.dart';
import '../live/model/live_detail.dart';
import '../live/model/live_info.dart';
import '../live/widgets/live_widgets.dart' show LiveContainer;
import '../vod/model/vod.dart';
import '../vod/widgets/vod_widgets.dart' show VodContainer;

import 'widgets/channel_profile/channel_profile_widgets.dart';
import 'widgets/channel_widgets.dart'
    show ChannelHeaderWithShowMoreButton, ChannelNameWithVerifiedMark;

import 'channel_event.dart';
import 'channel_state.dart';
import 'model/channel.dart';

part 'widgets/screen/channel_body.dart';
part 'widgets/screen/channel_profile.dart';
part 'widgets/screen/channel_function_buttons.dart';
part 'widgets/screen/channel_add_group_button.dart';
part 'widgets/screen/channel_live_with_header.dart';
part 'widgets/screen/channel_vod_header.dart';
part 'widgets/screen/channel_vod_list.dart';
part 'widgets/screen/channel_clip_header.dart';
part 'widgets/screen/channel_clip_list.dart';

class ChannelScreen extends HookConsumerWidget with ChannelEvent, ChannelState {
  /// Channel with the detailed data.
  ///
  /// It contains the channel profile, live stream, vod, etc.
  const ChannelScreen({
    super.key,
    required this.baseRoute,
    required this.channel,
    required this.channelFSN,
    required this.leftFSN,
  });

  final AppRoute baseRoute;

  final Channel channel;
  final FocusScopeNode channelFSN;

  /// Sidebar or FollowingList.
  final FocusScopeNode? leftFSN;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final nodes = useFocusScopeNodes(6);
    final bool openLive = channel.openLive ?? false;

    useAutoScroll(
      scrollController: scrollController,
      nodes: nodes,
      openLive: openLive,
    );

    final asyncFollowingList = getAsyncFollowingList(ref);
    final asyncLiveDetail =
        getAsyncLiveDetail(ref, channelId: channel.channelId);
    final asyncChannelVods =
        getAsyncVodsSortByLatest(ref, channelId: channel.channelId);
    final asyncChannelClips =
        getAsyncClipsSortByLatest(ref, channelId: channel.channelId);

    return _ChannelBody(
      scrollController: scrollController,
      node: channelFSN,
      openLive: channel.openLive ?? false,
      channelProfile: _ChannelProfile(channel: channel),
      channelFunctionButtons: _ChannelFunctionButtons(
        channel: channel,
        asyncFollowingList: asyncFollowingList,
        leftFSN: leftFSN,
        itemNode: nodes[0],
        belowFSN: nodes[1],
        toggleFollow: (isFollowing, channel) async => await toggleFollow(
          ref,
          isFollowing: isFollowing,
          channel: channel,
        ),
        addMemberToGroup: (Channel channel) async => await showGroupListDialog(
          ref,
          context,
          groupListWidget: (dialogContext) => GroupList(
            dialogContext: dialogContext,
            groups: getGroups(ref),
            pushGroupGenerate: () => pushGroupGenerate(context, baseRoute),
            selectGroup: (group) {
              addMemberToGroup(
                ref,
                context,
                dialogContext: dialogContext,
                group: group,
                channel: channel,
              );
            },
          ),
        ),
      ),
      channelLive: _ChannelLiveWithHeader(
        baseRoute: baseRoute,
        asyncLiveDetail: asyncLiveDetail,
        leftFSN: leftFSN,
        aboveFSN: nodes[0],
        itemNode: nodes[1],
        belowFSN: nodes[2],
        watchLive: () {},
      ),
      channelVodHeader: _ChannelVodHeader(
        autofocus: !openLive,
        leftFSN: leftFSN,
        aboveFSN: openLive ? nodes[1] : nodes[0],
        itemNode: openLive ? nodes[2] : nodes[1],
        belowFSN: nodes[3],
        pushChannelVod: () => pushChannelVod(context, baseRoute, channel),
      ),
      channelVodList: _ChannelVodList(
        baseRoute: baseRoute,
        openLive: openLive,
        asyncChannelVodList: asyncChannelVods,
        leftFSN: leftFSN,
        aboveFSN: openLive ? nodes[2] : nodes[1],
        itemNode: nodes[3],
        belowFSN: nodes[4],
      ),
      channelClipHeader: _ChannelClipHeader(
        leftFSN: leftFSN,
        aboveFSN: nodes[3],
        itemNode: nodes[4],
        belowFSN: nodes[5],
        pushChannelClip: () => pushChannelClip(context, baseRoute, channel),
      ),
      channelClipList: _ChannelClipList(
        appRoute: baseRoute,
        asyncChannelClipList: asyncChannelClips,
        channelName: channel.channelName,
        leftFSN: leftFSN,
        aboveFSN: nodes[4],
        itemFSN: nodes[5],
      ),
    );
  }
}
