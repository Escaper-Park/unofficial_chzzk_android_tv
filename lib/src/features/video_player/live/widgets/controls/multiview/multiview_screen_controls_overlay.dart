import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../common/constants/dimensions.dart';
import '../../../../../../common/constants/styles.dart';
import '../../../../../../common/widgets/header_text.dart';
import '../../../../common/control_icon.dart';
import '../../../../common/controls_overlay_container.dart';
import '../../../controller/live_overlay_controller.dart';
import '../../../controller/live_playlist_controller.dart';

class MultiviewScreenControlsOverlay extends ConsumerWidget {
  const MultiviewScreenControlsOverlay({
    super.key,
    required this.videoFocusNode,
    required this.controlsFSN,
  });

  final FocusNode videoFocusNode;
  final FocusScopeNode controlsFSN;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final livePlaylist = ref.watch(livePlaylistControllerProvider);

    final currentActivatedLiveIndex =
        ref.watch(currentActivatedLiveIndexProvider);

    final items = List.generate(
      livePlaylist.length,
      (index) => MultiviewScreenModeItem(
        autofocus: index == 0,
        videoFocusNode: videoFocusNode,
        currentIndex: currentActivatedLiveIndex,
        itemIndex: index,
        channelName: livePlaylist[index].channel.channelName,
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
            _headerWithComments(),
            const SizedBox(width: 10.0),
            ...items,
          ],
        ),
      ),
    );
  }

  Widget _headerWithComments() {
    return const SizedBox(
      width: Dimensions.settingHeaderTextWidth,
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
              '클릭: 크게/같이 보기',
              style: TextStyle(fontSize: 12.0),
            ),
          ),
        ],
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
    required this.channelName,
  });

  final int? currentIndex;
  final int itemIndex;
  final bool autofocus;
  final FocusNode videoFocusNode;
  final String channelName;

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
      label: channelName,
      resetOverlayTimer: () {
        ref
            .read(liveOverlayControllerProvider.notifier)
            .resetOverlayTimer(videoFocusNode: videoFocusNode);
      },
      onPressed: () {
        ref
            .read(currentActivatedLiveIndexProvider.notifier)
            .setFocusScreenIndex(itemIndex);
      },
    );
  }
}
