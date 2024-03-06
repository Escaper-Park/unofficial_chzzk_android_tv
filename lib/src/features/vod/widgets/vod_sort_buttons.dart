import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/constants/styles.dart';
import '../../../common/widgets/focused_outline_button.dart';
import '../controller/vod_controller.dart';
import '../repository/vod_repository.dart';

class VodSortButtons extends ConsumerWidget {
  const VodSortButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sortType = ref.watch(vodSortTypeControllerProvider);

    return Row(
      children: [
        _button(
          ref,
          VodSortType.latest,
          '최신순',
          sortType == VodSortType.latest
              ? AppColors.chzzkColor
              : AppColors.whiteColor,
        ),
        _button(
          ref,
          VodSortType.popular,
          '인기순',
          sortType == VodSortType.popular
              ? AppColors.chzzkColor
              : AppColors.whiteColor,
        ),
      ],
    );
  }

  Widget _button(
    WidgetRef ref,
    VodSortType sortType,
    String text,
    Color color,
  ) {
    const double padding = 10.0;

    return FocusedOutlineButton(
      padding: const EdgeInsets.all(padding),
      onPressed: () {
        ref.read(vodSortTypeControllerProvider.notifier).setState(sortType);
      },
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14.0,
          color: color,
        ),
      ),
    );
  }
}
