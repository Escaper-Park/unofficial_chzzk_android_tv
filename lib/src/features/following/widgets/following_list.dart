import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/widgets/header_text.dart';
import '../../../common/widgets/dpad_widgets.dart';
import '../../channel/controller/channel_controller.dart';
import '../model/following.dart';
import './following_channel_info_card.dart';

class FollowingList extends StatelessWidget {
  const FollowingList({
    super.key,
    required this.followingList,
    required this.followingListFSN,
    required this.sidebarFSN,
    required this.channelDataFSN,
  });

  final List<Following> followingList;
  final FocusScopeNode followingListFSN;

  /// Sidebar is located on the left side of following list.
  final FocusScopeNode sidebarFSN;

  /// Channel data is located on the right side of following list.
  final FocusScopeNode channelDataFSN;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeaderText(text: '팔로잉 채널'),
        Expanded(
          child: DpadFocusScopeNavigator(
            node: followingListFSN,
            dpadKeyFocusScopeNodeMap: {
              DpadAction.arrowLeft: sidebarFSN,
              DpadAction.arrowRight: channelDataFSN,
            },
            child: ListView.builder(
              itemCount: followingList.length,
              itemBuilder: (context, index) {
                final following = followingList[index];

                return Consumer(
                  builder: (context, ref, child) {
                    return FollowingChannelInfoCard(
                      autofocus: index == 0 ? true : false,
                      following: following,
                      onPressed: () {
                        // Select channel to show details.
                        ref
                            .read(channelControllerProvider.notifier)
                            .selectChannel(following.channelId);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
