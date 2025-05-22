import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/constants/dimensions.dart';
import '../../common/constants/enums.dart' show AppRoute;
import '../../utils/hooks/custom_hooks.dart';
import '../../utils/extensions/custom_extensions.dart';
import '../../utils/popup/popup_utils.dart';
import '../following/controller/following_controller.dart';
import '../group/controller/group_controller.dart';
import '../group/model/group.dart';
import 'model/channel.dart';

mixin class ChannelEvent {
  void useAutoScroll({
    required ScrollController scrollController,
    required List<FocusScopeNode> nodes,
    required bool openLive,
  }) {
    useVerticalFocusedAutoScroll(
      scrollController: scrollController,
      focusNodes: nodes,
      offsetBuilder: (maxScrollExtent) => [
        0.0,
        0.0,
        openLive ? Dimensions.videoContainerHeight : 0.0,
        openLive ? Dimensions.videoContainerHeight + 80.0 : 0.0,
        maxScrollExtent,
        maxScrollExtent,
      ],
    );
  }

  void pushChannelVod(
    BuildContext context,
    AppRoute baseRoute,
    Channel channel,
  ) {
    context.pushTo(
      context: context,
      currentLocation: baseRoute,
      appRoute: AppRoute.channelVod,
      pathParameters: {'channelId': channel.channelId},
      extra: {'channelName': channel.channelName},
    );
  }

  void pushChannelClip(
    BuildContext context,
    AppRoute baseRoute,
    Channel channel,
  ) {
    context.pushTo(
      context: context,
      currentLocation: baseRoute,
      appRoute: AppRoute.channelClip,
      pathParameters: {'channelId': channel.channelId},
      extra: {'channelName': channel.channelName},
    );
  }

  void pushGroupGenerate(BuildContext context, AppRoute baseRoute) {
    context.pushTo(
      context: context,
      currentLocation: baseRoute,
      appRoute: AppRoute.groupGenerate,
    );
  }

  /// Follow or unFollow
  Future<void> toggleFollow(
    WidgetRef ref, {
    required bool isFollowing,
    required Channel channel,
  }) async {
    await ref.read(followingControllerProvider.notifier).toggleFollow(
          isFollowing: isFollowing,
          channelId: channel.channelId,
        );
  }

  Future<void> showGroupListDialog(
    WidgetRef ref,
    BuildContext context, {
    required Widget Function(BuildContext dialogContext) groupListWidget,
  }) async {
    await PopupUtils.showWidgetDialog(
      context: context,
      widget: (dialogContext) {
        return groupListWidget(dialogContext);
      },
    );
  }

  Future<void> addMemberToGroup(
    WidgetRef ref,
    BuildContext context, {
    required BuildContext dialogContext,
    required Group group,
    required Channel channel,
  }) async {
    final addResult =
        await ref.read(groupControllerProvider.notifier).addMemberToGroup(
              id: group.id,
              member: channel.channelId,
            );

    final String successComment =
        '${group.groupName} 그룹에 ${channel.channelName} 채널이 추가되었습니다';
    final String failureComment =
        '${group.groupName} 그룹에 ${channel.channelName} 채널이 이미 참여하고 있습니다';

    if (context.mounted) {
      Navigator.of(dialogContext).pop();

      PopupUtils.showSnackBar(
        context: context,
        content: addResult ? successComment : failureComment,
      );
    }
  }
}
