import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../common/constants/dimensions.dart';
import '../../../../../../common/widgets/header_text.dart';
import '../../../../../live/model/live.dart';
import '../../../../common/control_icon.dart';
import '../../../../common/controls_overlay_container.dart';
import '../../../controller/live_player_controller.dart';
import '../../../controller/live_playlist_controller.dart';

class MultiviewPlayControls extends StatelessWidget {
  const MultiviewPlayControls({
    super.key,
    required this.videoFocusNode,
    required this.controlsFSN,
    required this.liveDetails,
  });

  final FocusNode videoFocusNode;
  final FocusScopeNode controlsFSN;
  final List<LiveDetail> liveDetails;

  @override
  Widget build(BuildContext context) {
    final items = List.generate(
      liveDetails.length,
      (index) => MultiviewPlayControlItem(
        autofocus: index == 0,
        videoFocusNode: videoFocusNode,
        liveDetail: liveDetails[index],
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
                      text: '재생설정',
                      verticalPadding: 0.0,
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(height: 3.0),
                  Center(
                    child: Text(
                      '클릭: 목록에서 제외',
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ),
                ],
              ),
            ),
            if (liveDetails.length != 1) ...items,
            if (liveDetails.length == 1) const Text('멀티뷰 모드에서 실행'),
          ],
        ),
      ),
    );
  }
}

class MultiviewPlayControlItem extends ConsumerWidget {
  const MultiviewPlayControlItem({
    super.key,
    required this.autofocus,
    required this.videoFocusNode,
    required this.liveDetail,
  });

  final bool autofocus;
  final FocusNode videoFocusNode;
  final LiveDetail liveDetail;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ControlIconButton(
      autofocus: autofocus,
      iconData: Icons.desktop_access_disabled_rounded,
      iconSize: 30.0,
      label: liveDetail.channel.channelName,
      labelFontSize: 10.0,
      resetOverlayTimer: () {
        ref
            .read(liveOverlayControllerProvider.notifier)
            .resetOverlayTimer(videoFocusNode: videoFocusNode);
      },
      onPressed: () {
        ref
            .read(livePlaylistControllerProvider.notifier)
            .removeLive(liveDetail);
      },
    );
  }
}
