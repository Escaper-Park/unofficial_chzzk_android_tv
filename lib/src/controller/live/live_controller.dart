import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/live/live.dart';
import '../../utils/popup/popup_utils.dart';
import '../../utils/router/app_router.dart';

part 'live_controller.g.dart';

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
}
