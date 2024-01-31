import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unofficial_chzzk_android_tv/src/ui/common/header_with_show_more_button.dart';

import '../../../../constants/dimensions.dart';
import '../../../../controller/dashboard/dashboard_controller.dart';
import '../../../../controller/following/following_controller.dart';

import '../../../../controller/live/live_controller.dart';
import '../../../../model/live/live.dart';
import '../../../common/live_container.dart';

class HomeFollowingLives extends ConsumerWidget {
  const HomeFollowingLives({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncLivesProvider = ref.watch(followingLivesControllerProvider);

    return asyncLivesProvider.when(
      data: (lives) {
        return lives == null
            ? const SizedBox.shrink()
            : _baseContainerWithHeader(
                showMoreCallback: () {
                  ref
                      .read(dashboardControllerProvider.notifier)
                      .changeScreen(context, 1);
                },
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: lives.length,
                  itemBuilder: (context, index) {
                    final LiveDetail liveDetail = lives[index];

                    return LiveContainer(
                      key: Key(
                          '${lives[index].channel.channelId.toString()}_homeFollowing'),
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
          child: Text('팔로우 라이브 채널을 불러오는데 실패했습니다'),
        ),
      ),
      loading: () => _baseContainerWithHeader(
        showMoreCallback: null,
        child: const Center(
          child: Text('팔로우 라이브 채널 불러오는 중...'),
        ),
      ),
    );
  }

  Widget _baseContainerWithHeader({
    required VoidCallback? showMoreCallback,
    required Widget child,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderWithShowMoreButton(
          headerText: '팔로우 라이브 채널',
          onPressed: showMoreCallback,
        ),
        SizedBox(
          height: Dimensions.liveContainerHeight,
          child: child,
        ),
      ],
    );
  }
}
