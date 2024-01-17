import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/popup/popup_utils.dart';
import '../../../utils/router/app_router.dart';
import '../../live/model/live.dart';

part 'home_controller.g.dart';

@riverpod
class HomeController extends _$HomeController {
  @override
  void build() {
    return;
  }

  Future<void> showLive({
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
      final List media = liveDetail.livePlayback.media;
      final Map<String, dynamic>? mediaPath =
          media.firstWhere((video) => video['mediaId'] == "HLS");

      if (mediaPath != null && context.mounted) {
        context.pushNamed(
          AppRoute.singleView.routeName,
          queryParameters: {'videoPath': mediaPath['path']},
        );
      }
    }
  }
}
