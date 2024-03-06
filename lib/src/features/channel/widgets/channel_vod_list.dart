import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/constants/dimensions.dart';
import '../../../common/widgets/center_text.dart';
import '../../../common/widgets/header_text.dart';
import '../../../utils/router/app_router.dart';
import '../controller/channel_controller.dart';
import '../../vod/widgets/vod_container.dart';

class ChannelVodList extends ConsumerWidget {
  const ChannelVodList({
    super.key,
    required this.channelId,
    required this.channelName,
  });

  final String channelId;
  final String channelName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncVodList = ref.watch(
      channelVodControllerProvider(channelId: channelId),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderText(
            text: '동영상',
            useShowMoreButton: true,
            onPressed: () {
              context.pushNamed(AppRoute.vod.routeName, queryParameters: {
                'channelId': channelId,
                'channelName': channelName,
              });
            },
          ),
          SizedBox(
            height: Dimensions.homeBaseContainerHeight,
            child: switch (asyncVodList) {
              AsyncData(:final value) => (value == null || value.isEmpty)
                  ? const CenterText(text: '동영상이 없습니다')
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
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
              _ => const CenterText(text: '동영상 불러오는 중...')
            },
          ),
        ],
      ),
    );
  }
}
