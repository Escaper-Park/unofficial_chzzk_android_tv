import 'package:flutter/material.dart';

import '../../../common/constants/dimensions.dart';
import '../../../common/constants/styles.dart' show AppColors;
import '../../../common/widgets/ui/ui_widgets.dart';
import '../model/group.dart';

class GroupList extends StatelessWidget {
  const GroupList({
    super.key,
    required this.dialogContext,
    required this.groups,
    required this.selectGroup,
    required this.pushGroupGenerate,
  });

  final BuildContext dialogContext;
  final Groups groups;
  final VoidCallback? pushGroupGenerate;
  final void Function(Group group) selectGroup;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Dimensions.popupGroupListWidth,
      height: Dimensions.popupGroupListHeight,
      child: groups.groups.isEmpty
          ? FocusedOutlinedButton(
              autofocus: true,
              padding: const EdgeInsets.all(10.0),
              onPressed: pushGroupGenerate,
              child: Text(
                '아직 그룹이 없습니다',
                style: TextStyle(color: AppColors.whiteColor),
              ),
            )
          : ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(10.0),
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                width: 10.0,
              ),
              itemCount: groups.groups.length,
              itemBuilder: (context, index) {
                final group = groups.groups[index];

                return FocusedOutlinedButton(
                  autofocus: index == 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  backgroundColor: AppColors.greyContainerColor.withOpacity(0.7),
                  onPressed: () => selectGroup(group),
                  child: CenteredText(
                    text: group.groupName,
                    fontColor: AppColors.whiteColor,
                  ),
                );
              },
            ),
    );
  }
}
