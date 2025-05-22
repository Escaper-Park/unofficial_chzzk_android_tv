import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../streaming/widgets/streaming_widgets.dart';
import '../live_stream_state.dart';

class SingleLivePlayer extends ConsumerWidget with LiveStreamState {
  const SingleLivePlayer({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncController = getSingleLivePlayer(ref, index: index);

    return SingleVideoPlayer(
      asyncController: asyncController,
      loadingText: '라이브 로딩 중...',
      errorText: '라이브를 불러올 수 없습니다',
      endText: '라이브가 종료되었습니다',
    );
  }
}
