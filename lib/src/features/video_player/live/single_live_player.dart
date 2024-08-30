import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';

import '../../../common/widgets/center_widgets.dart';
import 'controller/live_player_controller.dart';
import 'widgets/util/wakelock_monitor_controller.dart';

class SingleLivePlayer extends HookConsumerWidget {
  const SingleLivePlayer({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncController =
        ref.watch(singleLivePlayerControllerProvider(index: index));

    final msg = useState<String>('라이브 로딩중...');

    return asyncController.when(
      data: (controller) {
        if (!controller.value.isPlaying) controller.play();

        useEffect(
          () {
            void checkVideoEnds() {
              final value = controller.value;

              final bool checkEnds = value.hasError == true ||
                  (value.isInitialized && value.position >= value.duration) &&
                      !value.isPlaying;

              if (checkEnds) {
                msg.value = '라이브가 종료되었습니다';
                controller.pause();

                ref
                    .read(wakelockMonitorControllerProvider.notifier)
                    .setFalse(index);
              }
            }

            controller.addListener(checkVideoEnds);
            return () => controller.removeListener(checkVideoEnds);
          },
          [controller],
        );

        return controller.value.isPlaying
            ? Center(
                child: AspectRatio(
                  aspectRatio: controller.value.aspectRatio,
                  child: VideoPlayer(
                    controller,
                  ),
                ),
              )
            : CenteredText(text: msg.value);
      },
      error: (error, stackTrace) => CenteredText(text: error.toString()),
      loading: () => const CenteredText(text: '라이브 로딩중...'),
    );
  }
}
