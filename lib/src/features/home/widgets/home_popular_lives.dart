import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/widgets/center_text.dart';
import '../../live/controller/live_controller.dart';
import '../../live/widgets/live_container.dart';
import './home_base_container.dart';

class HomePopularLives extends HookConsumerWidget {
  const HomePopularLives({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncPopularLives = ref.watch(popularLivesControllerProvider);
    final scrollController = useScrollController();

    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: HomeBaseContainer(
        child: switch (asyncPopularLives) {
          AsyncData(:final value) => value == null
              ? const CenterText(text: '인기 채널을 불러오는데 실패했습니다')
              : ListView.builder(
                  key: UniqueKey(),
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    final liveDetail = value[index];

                    return LiveContainer(
                      liveDetail: liveDetail,
                    );
                  },
                ),
          AsyncError() => const CenterText(text: '인기 채널을 불러오는데 실패했습니다'),
          _ => const CenterText(text: '인기 채널 불러오는 중...'),
        },
      ),
    );
  }
}
