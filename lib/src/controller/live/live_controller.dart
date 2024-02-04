import 'package:chewie/chewie.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/live/live.dart';
import '../../service/live/live_repository.dart';
import '../../utils/popup/popup_utils.dart';
import '../../utils/router/app_router.dart';
import '../../utils/video_player/network_video_controller.dart';
import '../auth/auth_controller.dart';

part 'live_controller.g.dart';

@riverpod
Future<LiveDetail?> currentChannelLive(
  CurrentChannelLiveRef ref, {
  required String channelId,
}) async {
  final auth = ref.watch(authControllerProvider).value;

  Options? options = auth?.getOptions();

  return await ref.watch(liveRepositoryProvider).getLiveDetail(
        channelId: channelId,
        options: options,
      );
}

@riverpod
class LiveController extends _$LiveController {
  @override
  void build() {
    return;
  }

  Future<void> showSingleViewLive({
    // ignore: avoid_build_context_in_providers
    required BuildContext context,
    required LiveDetail liveDetail,
  }) async {
    if (liveDetail.adult && liveDetail.userAdultStatus != 'ADULT') {
      await PopupUtils.showSingleDialog(
        context: context,
        titleText: '19금 연령제한',
        contentText: '연령제한된 컨텐츠는 로그인해야 시청할 수 있습니다.',
      );
    } else {
      if (liveDetail.livePath != null && context.mounted) {
        context.pushNamed(
          AppRoute.singleViewLive.routeName,
          queryParameters: {
            'videoPath': liveDetail.livePath,
            'channelId': liveDetail.channel.channelId,
            'chatChannelId': liveDetail.chatChannelId,
            'openDate': liveDetail.openDate,
          },
        );
      }
    }
  }

  Future<void> showNowLive({
    // ignore: avoid_build_context_in_providers
    required BuildContext context,
    required String channelId,
    required ChewieController videoController,
  }) async {
    final currentLiveDetail =
        await ref.read(liveRepositoryProvider).getLiveDetail(
              channelId: channelId,
            );

    if (currentLiveDetail != null) {
      if (context.mounted) {
        // Timer close
        ref.read(videoControlsTimerProvider.notifier).cancelTimer();

        // Controls close
        ref.read(showControlsProvider.notifier).setState(false);

        context.pushReplacementNamed(
          AppRoute.singleViewLive.routeName,
          queryParameters: {
            'videoPath': currentLiveDetail.livePath,
            'channelId': currentLiveDetail.channel.channelId,
            'chatChannelId': currentLiveDetail.chatChannelId,
            'openDate': currentLiveDetail.openDate,
          },
        );
      }
    } else {
      videoController.seekTo(const Duration(days: 3));
    }
  }
}
