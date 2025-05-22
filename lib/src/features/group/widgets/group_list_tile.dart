import 'package:flutter/material.dart';

import '../../../common/constants/styles.dart';
import '../../../common/widgets/ui/ui_widgets.dart';
import '../model/group.dart';

class GroupListTile extends StatelessWidget {
  const GroupListTile({
    super.key,
    required this.autofocus,
    required this.focusNode,
    required this.currentIndex,
    required this.itemIndex,
    required this.group,
    required this.onPressedGroup,
  });

  final bool autofocus;
  final FocusNode focusNode;
  final int? currentIndex;
  final int itemIndex;
  final Group group;

  final VoidCallback onPressedGroup;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      child: FocusedOutlinedButton(
        autofocus: autofocus,
        focusNode: focusNode,
        onPressed: onPressedGroup,
        padding: const EdgeInsets.all(10.0),
        backgroundColor: AppColors.greyContainerColor,
        child: Text(
          group.groupName,
          style: TextStyle(
            fontSize: 14.0,
            color: currentIndex == itemIndex
                ? AppColors.chzzkColor
                : AppColors.whiteColor,
            fontWeight: FontWeight.w600,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
