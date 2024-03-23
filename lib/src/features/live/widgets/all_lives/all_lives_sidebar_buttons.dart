import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/constants/styles.dart';
import '../../../../common/widgets/focused_outline_button.dart';
import '../../controller/live_controller.dart';
import '../../repository/live_repository.dart';

class AllLivesSidebarButtons extends HookConsumerWidget {
  const AllLivesSidebarButtons({
    super.key,
    required this.sidebarFocusNode,
  });

  final FocusNode sidebarFocusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final liveSortType = ref.watch(currentLiveSortTypeProvider);
    final int currentIndex = liveSortType == LiveSortType.popular ? 0 : 1;

    const int itemCount = 2;

    final focusNodes = List.generate(
      itemCount,
      (_) => useFocusNode(),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Focus(
        focusNode: sidebarFocusNode,
        onFocusChange: (value) {
          if (value) focusNodes[currentIndex].requestFocus();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: itemCount,
                itemBuilder: (context, index) {
                  return FocusedOutlineButton(
                    focusNode: focusNodes[index],
                    padding: const EdgeInsets.all(10.0),
                    onPressed: () {
                      if (currentIndex != index) {
                        ref.read(currentLiveSortTypeProvider.notifier).setState(
                              index == 0
                                  ? LiveSortType.popular
                                  : LiveSortType.latest,
                            );
                      }
                    },
                    child: Center(
                      child: Text(
                        index == 0 ? '인기순' : '최신순',
                        style: TextStyle(
                          color: currentIndex == index
                              ? AppColors.chzzkColor
                              : AppColors.whiteColor,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                final loadingState = ref.watch(allLivesLoadingStateProvider);

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(loadingState == true ? '로딩중...' : ' '),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
