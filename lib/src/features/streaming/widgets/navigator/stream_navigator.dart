import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/constants/dimensions.dart';
import '../../../../common/constants/enums.dart' show DpadAction;
import '../../../../common/widgets/dpad/dpad_widgets.dart';
import '../../../../common/widgets/ui/ui_widgets.dart';
import '../stream_overlay_container.dart';

class StreamNavigator extends StatelessWidget {
  const StreamNavigator({
    super.key,
    required this.headerText,
    required this.contents,
    required this.resetOverlayTimer,
    this.changeToAboveContents,
    this.changeToBelowContents,
  });

  final String headerText;
  final Widget contents;
  final VoidCallback resetOverlayTimer;
  final VoidCallback? changeToAboveContents;
  final VoidCallback? changeToBelowContents;

  @override
  Widget build(BuildContext context) {
    return DpadActionWidget(
      useFocusedBorder: false,
      useKeyRepeatEvent: false,
      dpadActionCallbacks: {
        DpadAction.arrowUp: changeToAboveContents,
        DpadAction.arrowDown: changeToBelowContents,
        DpadAction.arrowLeft: resetOverlayTimer,
        DpadAction.arrowRight: resetOverlayTimer,
      },
      child: StreamOverlayContainer(
        width: double.infinity,
        height: Dimensions.streamNavigatorControlsHeight,
        useTopBorder: true,
        borderRadius: 12.0,
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Dimensions.streamNavigatorHeaderHeight,
              child: HeaderText(
                text: headerText,
                fontSize: 14.0,
                verticalPadding: 5.0,
              ),
            ),
            Expanded(child: contents),
          ],
        ),
      ),
    );
  }
}

class StreamNavigatorWithContents<T> extends StatelessWidget {
  const StreamNavigatorWithContents({
    super.key,
    required this.headerText,
    required this.resetOverlayTimer,
    this.changeToAboveContents,
    this.changeToBelowContents,
    required this.asyncValue,
    required this.listViewFSN,
    required this.emptyText,
    required this.errorText,
    this.useFetchMore = true,
    this.fetchMore,
    required this.itemBuilder,
  });

  final String headerText;
  final VoidCallback resetOverlayTimer;
  final VoidCallback? changeToAboveContents;
  final VoidCallback? changeToBelowContents;
  final AsyncValue<List<T>?> asyncValue;
  final FocusScopeNode listViewFSN;
  final String emptyText;
  final String errorText;
  final bool useFetchMore;
  final Future<void> Function()? fetchMore;
  final Widget Function(int index, FocusNode node, T item) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return StreamNavigator(
      headerText: headerText,
      resetOverlayTimer: resetOverlayTimer,
      changeToAboveContents: changeToAboveContents,
      changeToBelowContents: changeToBelowContents,
      contents: DpadListViewWithAsyncValue<T>(
        asyncValue: asyncValue,
        useFetchMore: useFetchMore,
        fetchMore: fetchMore,
        verticalPadding: 5.0,
        horizontalPadding: 10.0,
        fallbackAction: () {},
        itemWidth: Dimensions.streamNavigatorContentsWidth,
        itemHeight: Dimensions.streamNavigatorContentsHeight,
        listViewFSN: listViewFSN,
        emptyText: emptyText,
        errorText: errorText,
        itemBuilder: itemBuilder,
      ),
    );
  }
}
