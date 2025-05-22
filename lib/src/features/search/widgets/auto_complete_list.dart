import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/extensions/custom_extensions.dart';
import '../../../common/constants/dimensions.dart';
import '../../../common/constants/styles.dart' show AppColors;
import '../../../common/widgets/dpad/dpad_widgets.dart'
    show DpadListViewWithAsyncValue;
import '../../../common/widgets/ui/ui_widgets.dart' show FocusedOutlinedButton;

class AutoCompleteList extends StatelessWidget {
  const AutoCompleteList({
    super.key,
    required this.asyncAutoComplete,
    required this.itemNode,
    required this.keyboardFSN,
    required this.onPressed,
  });

  final AsyncValue<List<String>> asyncAutoComplete;
  final FocusScopeNode itemNode;
  final FocusScopeNode keyboardFSN;
  final void Function(String? keyword) onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 10.0,
      ),
      child: DpadListViewWithAsyncValue<String>(
        useFetchMore: false,
        scrollDirection: Axis.vertical,
        asyncValue: asyncAutoComplete,
        verticalPadding: 0.0,
        itemWidth: Dimensions.autoCompleteWidth,
        itemHeight: context.screenHeight,
        listViewFSN: itemNode,
        leftFSN: keyboardFSN,
        useExceptionFallbackWidget: false,
        emptyText: ' ',
        errorText: '자동완성을 불러올 수 없습니다',
        itemBuilder: (index, focusNode, keyword) {
          return FocusedOutlinedButton(
            focusNode: focusNode,
            backgroundColor: AppColors.greyContainerColor,
            onPressed: () => onPressed(keyword),
            padding: const EdgeInsets.all(8.0),
            child: Text(
              keyword,
              style: TextStyle(
                fontSize: 14.0,
                color: AppColors.whiteColor,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          );
        },
      ),
    );
  }
}
