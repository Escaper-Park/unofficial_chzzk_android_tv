import 'package:flutter/widgets.dart';

import '../../../../../common/constants/dimensions.dart';
import '../../../../../common/constants/enums.dart' show DpadAction;
import '../../../../../common/constants/styles.dart' show AppColors;
import '../../../../../common/widgets/dpad/dpad_widgets.dart';
import '../../../../../common/widgets/ui/ui_widgets.dart';
import '../../../../group/model/group.dart';

class LiveStreamGroupContainer extends StatelessWidget {
  const LiveStreamGroupContainer({
    super.key,
    required this.group,
    required this.lastActivatedGroup,
    required this.resetOverlay,
    required this.selectActivatedGroup,
  });

  final Group group;
  final bool lastActivatedGroup;
  final VoidCallback resetOverlay;
  final void Function(Group group) selectActivatedGroup;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: DpadActionWidget(
        useFocusedBorder: true,
        useKeyRepeatEvent: false,
        dpadActionCallbacks: {
          DpadAction.arrowLeft: resetOverlay,
          DpadAction.arrowRight: resetOverlay,
          DpadAction.select: () => selectActivatedGroup(group),
        },
        child: RoundedContainer(
          width: Dimensions.groupContainerWidth,
          backgroundColor: AppColors.backgroundColor,
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                group.groupName,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 13.0,
                  color: lastActivatedGroup
                      ? AppColors.chzzkColor
                      : AppColors.whiteColor,
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '${group.members.length}명 참여 중',
                style: TextStyle(
                  fontSize: 11.0,
                  color: lastActivatedGroup
                      ? AppColors.chzzkColor
                      : AppColors.whiteColor,
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
