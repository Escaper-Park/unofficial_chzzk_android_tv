import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../../../../core/ui/ui.dart';
import '../../../../../group/domain/entities/group_collection.dart';
import '../../../../domain/entities/following_feed.dart';
import '../../../bloc/following_bloc.dart';
import '../../../following_screen_design.dart';
import '../../../following_screen_string.dart';

part 'following_channel_modal_lists.dart';
part 'following_channel_modal_position.dart';

typedef FollowingChannelGroupCallback =
    void Function(FollowingChannel channel, GroupItem group);

class FollowingChannelModal extends StatelessWidget {
  const FollowingChannelModal({
    super.key,
    required this.modalState,
    required this.node,
    required this.openerNode,
    required this.anchorLink,
    required this.onWatchLive,
    required this.onMoveToChannel,
    required this.onFollow,
    required this.onUnfollow,
    required this.onShowGroupList,
    required this.onAddToGroup,
    required this.onDismiss,
  });

  final FollowingChannelModalState modalState;
  final FocusScopeNode node;
  final FocusNode? openerNode;
  final LayerLink anchorLink;
  final ValueChanged<FollowingChannel> onWatchLive;
  final ValueChanged<FollowingChannel> onMoveToChannel;
  final ValueChanged<FollowingChannel> onFollow;
  final ValueChanged<FollowingChannel> onUnfollow;
  final ValueChanged<FollowingChannel> onShowGroupList;
  final FollowingChannelGroupCallback onAddToGroup;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    final channel = modalState.channel;
    final canWatchLive = channel.openLive;
    final following = _isFollowing(channel);
    final showGroupList =
        modalState.view == FollowingChannelModalView.groupList;

    return TvModalPanel(
      type: TvModalPanelType.standard,
      header: showGroupList
          ? FollowingScreenString.groupListTitle
          : channel.channelName,
      headerContent: showGroupList
          ? null
          : TvMediaChannelName(
              channelName: channel.channelName,
              verified: channel.verifiedMark,
              textAlign: TextAlign.center,
              mainAxisAlignment: MainAxisAlignment.center,
              style: _headerChannelNameStyle(context),
            ),
      position: _positionFor(modalState.index),
      anchorLink: anchorLink,
      anchorOffset: _anchorOffsetFor(
        context: context,
        index: modalState.index,
        openerNode: openerNode,
      ),
      showScrim: true,
      focusNode: node,
      openerFocusNode: openerNode,
      onDismiss: onDismiss,
      child: SizedBox(
        key: const ValueKey('following-channel-modal-content'),
        height: _modalContentHeight,
        child: showGroupList
            ? _FollowingGroupList(
                channel: channel,
                groups: modalState.groups,
                onAddToGroup: onAddToGroup,
                onDismiss: onDismiss,
              )
            : _FollowingChannelActionList(
                channel: channel,
                canWatchLive: canWatchLive,
                following: following,
                onWatchLive: onWatchLive,
                onMoveToChannel: onMoveToChannel,
                onFollow: onFollow,
                onUnfollow: onUnfollow,
                onShowGroupList: onShowGroupList,
              ),
      ),
    );
  }
}

const _modalContentHeight = 160.0;
