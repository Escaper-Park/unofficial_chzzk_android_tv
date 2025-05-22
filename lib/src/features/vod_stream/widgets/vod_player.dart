import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../streaming/widgets/streaming_widgets.dart';
import '../vod_stream_state.dart';

class VodPlayer extends ConsumerWidget with VodStreamState {
  const VodPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncController = getAsyncVideoPlayerController(ref);

    return SingleVideoPlayer(
      asyncController: asyncController,
      loadingText: '동영상 로딩 중...',
      errorText: '동영상을 불러올 수 없습니다',
      endText: '동영상이 마지막까지 재생되었습니다',
    );
  }
}
