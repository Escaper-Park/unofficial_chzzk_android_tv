import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../common/constants/enums.dart' show AppRoute, DialogButtonType;
import '../../utils/extensions/custom_extensions.dart';
import '../../utils/popup/popup_utils.dart';
import '../channel/model/channel.dart';
import '../home/controller/home_refresh_controller.dart';
import 'controller/group_controller.dart';
import 'model/group.dart';

mixin class GroupEvent {
  void refreshHome(WidgetRef ref) =>
      ref.read(homeRefreshControllerProvider.notifier).refresh();

  void pushGroupGenerate(BuildContext context) {
    context.pushTo(
      context: context,
      currentLocation: AppRoute.group,
      appRoute: AppRoute.groupGenerate,
    );
  }

  void pushSearch(BuildContext context) {
    context.pushTo(
      context: context,
      currentLocation: AppRoute.group,
      appRoute: AppRoute.search,
      extra: {'fromHome': false},
    );
  }

  void showRemoveGroupAlertDialog(
    WidgetRef ref,
    BuildContext context, {
    required Group group,
  }) {
    PopupUtils.showButtonDialog(
      context: context,
      buttonType: DialogButtonType.doubleButton,
      titleText: '${group.groupName} 그룹 삭제',
      contentText: '${group.groupName} 그룹을 삭제하시겠습니까?',
      confirmText: '삭제',
      cancelText: '취소',
      confirmCallback: () async => _removeGroup(ref, context, group: group),
    );
  }

  void showRemoveMemberAlertDialog(
    WidgetRef ref,
    BuildContext context, {
    required Group group,
    required Channel channel,
  }) {
    PopupUtils.showButtonDialog(
      context: context,
      buttonType: DialogButtonType.doubleButton,
      titleText: '${channel.channelName} 멤버 탈퇴',
      contentText:
          '${group.groupName} 그룹에서 ${channel.channelName} 채널을 탈퇴시키시겠습니까?',
      confirmText: '탈퇴',
      cancelText: '취소',
      confirmCallback: () async =>
          _removeMemberFromGroup(ref, context, group: group, channel: channel),
    );
  }

  Future<void> _removeGroup(
    WidgetRef ref,
    BuildContext context, {
    required Group group,
  }) async {
    final removeResult = await ref
        .read(groupControllerProvider.notifier)
        .removeGroup(id: group.id);

    final successComment = '${group.groupName} 그룹을 삭제했습니다';
    final failureComment = '${group.groupName} 그룹 삭제를 실패했습니다';

    if (context.mounted) {
      PopupUtils.showSnackBar(
        context: context,
        content: removeResult ? successComment : failureComment,
      );
    }
  }

  Future<void> _removeMemberFromGroup(
    WidgetRef ref,
    BuildContext context, {
    required Group group,
    required Channel channel,
  }) async {
    final removeResult =
        await ref.read(groupControllerProvider.notifier).removeMemberFromGroup(
              id: group.id,
              member: channel.channelId,
            );

    final successComment =
        '${group.groupName}에서 ${channel.channelName} 그룹을 탈퇴시켰습니다';
    final failureComment = '${group.groupName} 그룹 탈퇴를 실패했습니다';

    if (context.mounted) {
      PopupUtils.showSnackBar(
        context: context,
        content: removeResult ? successComment : failureComment,
      );
    }
  }
}
