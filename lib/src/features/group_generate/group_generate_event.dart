import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/popup/popup_utils.dart';
import '../group/controller/group_controller.dart';

mixin class GroupGenerateEvent {
  Future<void> generateGroup(
    WidgetRef ref,
    BuildContext context, {
    required String groupName,
  }) async {
    final genResult = await ref
        .read(groupControllerProvider.notifier)
        .addGroup(groupName: groupName);

    if (context.mounted) {
      // successs
      if (genResult) {
        PopupUtils.showSnackBar(
          context: context,
          content: '$groupName 그룹이 만들어졌습니다',
        );

        context.pop();
      }
      // false
      else {
        PopupUtils.showSnackBar(
          context: context,
          content: '이미 $groupName 그룹이 존재합니다',
        );
      }
    }
  }
}
