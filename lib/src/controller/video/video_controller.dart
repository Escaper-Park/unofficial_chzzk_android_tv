import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:unofficial_chzzk_android_tv/src/utils/router/app_router.dart';

import '../../model/video/video.dart';
import '../../service/video/video_repository.dart';
import '../../utils/popup/popup_utils.dart';
import '../auth/auth_controller.dart';

part 'video_controller.g.dart';

@riverpod
class VideoController extends _$VideoController {
  Options? _options;

  @override
  FutureOr<List<Video>?> build({
    required String channelId,
  }) async {
    final auth = ref.watch(authControllerProvider).value;

    _options = auth?.getOptions();

    return getChannelVideos(channelId: channelId);
  }

  Future<List<Video>?> getChannelVideos({
    required String channelId,
  }) async {
    return await ref
        .watch(videoRepositoryProvider)
        .getChannelVideoList(channelId: channelId, options: _options);
  }

  Future<void> showSingleViewVod({
    // ignore: avoid_build_context_in_providers
    required BuildContext context,
    required int videoNo,
  }) async {
    final String? vodPath = await ref.watch(videoRepositoryProvider).getVodPath(
          videoNo: videoNo,
          options: _options,
        );

    if (vodPath == null) {
      if (context.mounted) {
        await PopupUtils.showSingleDialog(
          context: context,
          titleText: '19금 연령제한',
          contentText: '연령제한된 컨텐츠는 로그인해야 시청할 수 있습니다.',
        );
      }
    } else {
      if (context.mounted) {
        context.pushNamed(
          AppRoute.singleViewVod.routeName,
          queryParameters: {
            'vodPath': vodPath,
          },
        );
      }
    }
  }
}
