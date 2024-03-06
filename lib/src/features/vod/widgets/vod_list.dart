import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/constants/dimensions.dart';
import '../../../common/widgets/center_text.dart';
import 'vod_container.dart';
import '../controller/vod_controller.dart';

class VodList extends ConsumerWidget {
  const VodList({
    super.key,
    required this.channelId,
    required this.crossAxisCount,
    required this.crossAxisSpacing,
  });

  final String channelId;

  /// For caculating sidebar size
  final int crossAxisCount;
  final double crossAxisSpacing;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncVodList = ref.watch(vodControllerProvider(channelId: channelId));

    return switch (asyncVodList) {
      AsyncData(:final value) => (value == null || value.isEmpty)
          ? const CenterText(text: '동영상이 없습니다')
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 5.0,
                mainAxisExtent: Dimensions.homeBaseContainerHeight,
                mainAxisSpacing: 15.0,
              ),
              itemCount: value.length,
              itemBuilder: (context, index) {
                final vod = value[index];
                return VodContainer(
                  autofocus: index == 0 ? true : false,
                  vod: vod,
                );
              },
            ),
      AsyncError() => const CenterText(text: '동영상을 불러올 수 없습니다'),
      _ => const CenterText(text: '둉영상 불러오는 중...')
    };
  }
}
