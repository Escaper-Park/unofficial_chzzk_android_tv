import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../common/constants/dimensions.dart';
import '../../../../../../common/constants/styles.dart';
import '../../../../../../common/widgets/header_text.dart';
import '../../../../../live/model/live.dart';
import '../../../../common/control_icon.dart';
import '../../../../common/controls_overlay_container.dart';
import '../../../controller/live_player_controller.dart';

class MultiviewScreenSettings extends ConsumerWidget {
  const MultiviewScreenSettings({
    super.key,
    required this.videoFocusNode,
    required this.controlsFSN,
    required this.liveDetails,
  });

  final FocusNode videoFocusNode;
  final FocusScopeNode controlsFSN;
  final List<LiveDetail> liveDetails;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final multiviewMainScreenIndex =
        ref.watch(multiviewMainScreenIndexProvider);

    final items = List.generate(
      liveDetails.length,
      (index) => MultiviewScreenModeItem(
        autofocus: index == 0,
        videoFocusNode: videoFocusNode,
        currentIndex: multiviewMainScreenIndex,
        itemIndex: index,
        headerText: liveDetails[index].channel.channelName,
      ),
    );

    return FocusScope(
      node: controlsFSN,
      child: ControlsOverlayContainer(
        width: double.infinity,
        height: Dimensions.liveStreamMainControlsHeight,
        useTopBorder: true,
        borderRadius: 12.0,
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 150.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: HeaderText(
                      text: '화면설정',
                      verticalPadding: 0.0,
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(height: 3.0),
                  Center(
                    child: Text(
                      '클릭: 크게보기 / 같이보기',
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ),
                ],
              ),
            ),
            ...items,
          ],
        ),
      ),
    );
  }
}

class MultiviewScreenModeItem extends ConsumerWidget {
  const MultiviewScreenModeItem({
    super.key,
    this.autofocus = false,
    required this.videoFocusNode,
    required this.currentIndex,
    required this.itemIndex,
    required this.headerText,
  });

  final int? currentIndex;
  final int itemIndex;
  final bool autofocus;
  final FocusNode videoFocusNode;
  final String headerText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ControlIconButton(
      autofocus: autofocus,
      iconData: currentIndex == itemIndex
          ? Icons.fullscreen_rounded
          : Icons.fullscreen_exit_rounded,
      iconColor: currentIndex == itemIndex
          ? AppColors.chzzkColor
          : AppColors.whiteColor,
      label: headerText,
      resetOverlayTimer: () {
        ref
            .read(liveOverlayControllerProvider.notifier)
            .resetOverlayTimer(videoFocusNode: videoFocusNode);
      },
      onPressed: () {
        ref
            .read(multiviewMainScreenIndexProvider.notifier)
            .setFocusMode(itemIndex);
      },
    );
  }
}
