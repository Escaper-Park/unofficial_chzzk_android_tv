import 'package:flutter/material.dart';

import '../../../constants/dimensions.dart';
import '../../../constants/enums.dart' show FilterType;
import '../../../constants/styles.dart' show AppColors;
import '../../dpad/dpad_widgets.dart' show DpadListView;
import '../../ui/ui_widgets.dart' show FocusedOutlinedButton;

class VideoGridViewFilter extends StatelessWidget {
  const VideoGridViewFilter({
    super.key,
    required this.filterList,
    required this.currentIndex,
    required this.filterFSN,
    this.sidebarFSN,
    this.aboveFSN,
    this.belowFSN,
    required this.onPressed,
  });

  final List<FilterType> filterList;
  final int currentIndex;
  final FocusScopeNode filterFSN;
  final FocusScopeNode? sidebarFSN;
  final FocusScopeNode? aboveFSN;
  final FocusScopeNode? belowFSN;

  final void Function(int index) onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
          height: Dimensions.clipFilterListHeight,
          child: DpadListView(
            shrinkWrap: true,
            itemList: filterList,
            listViewFSN: filterFSN,
            sidebarFSN: sidebarFSN,
            aboveFSN: aboveFSN,
            belowFSN: belowFSN,
            itemBuilder: (index, focusNode, object) {
              return FocusedOutlinedButton(
                focusNode: focusNode,
                padding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 20.0,
                ),
                backgroundColor: AppColors.greyContainerColor,
                onPressed: () => onPressed(index),
                child: Text(
                  filterList[index].name,
                  style: TextStyle(
                    color: currentIndex == index
                        ? AppColors.chzzkColor
                        : AppColors.whiteColor,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
