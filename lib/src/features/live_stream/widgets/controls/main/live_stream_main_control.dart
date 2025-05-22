import 'package:flutter/widgets.dart';

import '../../../../../common/constants/enums.dart' show LiveMode;
import 'live_stream_multi_view_control.dart';
import 'live_stream_single_view_control.dart';

class LiveStreamMainControl extends StatelessWidget {
  const LiveStreamMainControl({
    super.key,
    required this.videoFocusNode,
    required this.liveMode,
  });

  final LiveMode liveMode;
  final FocusNode videoFocusNode;

  @override
  Widget build(BuildContext context) {
    return liveMode == LiveMode.single
        ? LiveStreamSingleViewControl(
            videoFocusNode: videoFocusNode,
          )
        : LiveStreamMultiViewControl(
            videoFocusNode: videoFocusNode,
          );
  }
}
