import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../constants/dimensions.dart';
import '../../../../controller/live/live_controller.dart';
import '../../../../controller/popular/popular_controller.dart';
import '../../../../model/live/live.dart';
import '../../../common/header_text.dart';
import '../../../common/live_container.dart';

class PopularLives extends ConsumerWidget {
  const PopularLives({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncLivesProvider = ref.watch(popularControllerProvider);

    return asyncLivesProvider.when(
      data: (lives) {
        return lives == null
            ? const SizedBox(
                height: 50.0,
                child: Center(
                  child: Text('인기 채널을 불러오는데 실패했습니다'),
                ),
              )
            : _baseContainerWithHeader(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: lives.length,
                  itemBuilder: (context, index) {
                    final LiveDetail liveDetail = lives[index];

                    return LiveContainer(
                      key: Key(
                          '${liveDetail.channel.channelId.toString()}_popular'),
                      autofocus: index == 0 ? true : false,
                      liveDetail: liveDetail,
                      onPressed: () async {
                        await ref
                            .read(liveControllerProvider.notifier)
                            .showSingleViewLive(
                              context: context,
                              liveDetail: liveDetail,
                            );
                      },
                    );
                  },
                ),
              );
      },
      error: (error, stackTrace) => const SizedBox(
        height: 50.0,
        child: Center(
          child: Text('인기 채널을 불러오는데 실패했습니다'),
        ),
      ),
      loading: () => _baseContainerWithHeader(
        child: const Center(
          child: Text('인기 채널 불러오는 중...'),
        ),
      ),
    );
  }

  Widget _baseContainerWithHeader({
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeaderText(
          text: '인기 라이브 채널',
        ),
        SizedBox(
          height: Dimensions.liveContainerHeight,
          child: child,
        ),
      ],
    );
  }
}
