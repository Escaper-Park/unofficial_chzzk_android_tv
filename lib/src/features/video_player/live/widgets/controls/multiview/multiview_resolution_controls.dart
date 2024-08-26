import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../../../../common/constants/dimensions.dart';
import '../../../../../live/model/live.dart';
import '../../../../../live/model/live_stream.dart';
import '../../../../../setting/widgets/common/setting_item.dart';
import '../../../../common/control_icon.dart';
import '../../../../common/controls_overlay_container.dart';
import '../../../controller/live_playlist_controller.dart';

class MultiviewResolutionControls extends StatelessWidget {
  const MultiviewResolutionControls({
    super.key,
    required this.videoFocusNode,
    required this.controlsFSN,
    required this.liveStream,
    required this.controllers,
  });

  final FocusNode videoFocusNode;
  final FocusScopeNode controlsFSN;
  final List<LiveStream> liveStream;
  final List<VideoPlayerController> controllers;

  @override
  Widget build(BuildContext context) {
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
          children: [],
        ),
      ),
    );
  }
}

// class ResolutionControlItem extends StatelessWidget {
//   const ResolutionControlItem({
//     super.key,
//     required this.autofocus,
//     required this.videoFocusNode,
//     required this.channelName,
//   });

//   final bool autofocus;
//   final FocusNode videoFocusNode;

//   final String channelName;

//   @override
//   Widget build(BuildContext context) {
//     return DpadControlIconButton(
//       autofocus: autofocus,
//       videoFocusNode: videoFocusNode,
//       itemType: SettingItemType.limited,
//       headerText: channelName,
//       currentValue: currentValue,
//       minValue: minValue,
//       maxValue: maxValue,
//       onUpdate: onUpdate,
//     );
//   }
// }
