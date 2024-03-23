import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/constants/dimensions.dart';
import '../../../../common/widgets/center_text.dart';
import '../../controller/live_controller.dart';
import '../live_container.dart';

class AllLivesList extends HookConsumerWidget {
  const AllLivesList({
    super.key,
    required this.crossAxisCount,
    required this.crossAxisSpacing,
  });

  final int crossAxisCount;
  final double crossAxisSpacing;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final asyncLives = ref.watch(allLivesControllerProvider);

    useEffect(() {
      scrollController.addListener(() async {
        // -15.0: damping
        if (scrollController.offset >=
                scrollController.position.maxScrollExtent - 15.0 &&
            !scrollController.position.outOfRange) {
          await ref.read(allLivesControllerProvider.notifier).fetchMore();
        }
      });
      return null;
    }, [scrollController]);

    return switch (asyncLives) {
      AsyncData(:final value) => (value == null)
          ? const CenterText(text: '라이브를 불러올 수 없습니다')
          : GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: crossAxisSpacing,
                mainAxisSpacing: 15.0,
                mainAxisExtent: Dimensions.homeBaseContainerHeight,
              ),
              controller: scrollController,
              itemCount: value.length,
              itemBuilder: (context, index) {
                final liveDetail = value[index];

                return LiveContainer(
                  autofocus: index == 0 ? true : false,
                  liveDetail: liveDetail,
                );
              },
            ),
      AsyncError() => const CenterText(text: '라이브를 불러올 수 없습니다'),
      _ => const CenterText(text: '라이브 불러오는 중...'),
    };
  }
}
