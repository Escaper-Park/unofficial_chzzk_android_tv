import 'package:flutter/material.dart';

import '../../../../common/constants/enums.dart' show ChatWindowMode;
import '../../../../common/widgets/ui/ui_widgets.dart';

class StreamPlayerWithChat extends StatelessWidget {
  const StreamPlayerWithChat({
    super.key,
    required this.chatWindowMode,
    required this.videoPlayer,
    required this.chatStream,
    this.isChatExist = true,
  });

  final ChatWindowMode chatWindowMode;
  final Widget videoPlayer;
  final Widget chatStream;
  final bool isChatExist;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            Expanded(
              flex: 3,
              child: videoPlayer,
            ),
            if (chatWindowMode == ChatWindowMode.side)
              Expanded(
                flex: 1,
                child: isChatExist
                    ? chatStream
                    : const CenteredText(text: '채팅이 없습니다'),
              ),
          ],
        ),
        // overlay chat
        if (chatWindowMode == ChatWindowMode.overlay && isChatExist) chatStream,
      ],
    );
  }
}
