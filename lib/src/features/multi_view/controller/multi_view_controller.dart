import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/popup/popup_utils.dart';
import '../../../utils/router/app_router.dart';
import '../../live/model/live.dart';

part 'multi_view_controller.g.dart';

@riverpod
class MultiViewController extends _$MultiViewController {
  @override
  List<LiveDetail> build() {
    return [];
  }

  void addChannel(LiveDetail liveDetail) {
    if (state.length < 4 && !state.contains(liveDetail)) {
      state = [...state, liveDetail];
    }
  }

  void removeChannel(String channelId) {
    state = [
      for (final liveDetail in state)
        if (liveDetail.channel.channelId != channelId) liveDetail
    ];
  }

  Future<void> showMultiViewChannel({
    // ignore: avoid_build_context_in_providers
    required BuildContext context,
    required List<LiveDetail> liveDetails,
  }) async {
    if (context.mounted) {
      if (state.length < 2) {
        await PopupUtils.showSingleDialog(
          context: context,
          titleText: '멀티뷰',
          contentText: '채널을 2개 이상 4개 이하로 선택해주세요',
        );

        return;
      }

      // check adult state
      for (LiveDetail live in state) {
        if (live.adult && live.userAdultStatus != 'ADULT') {
          await PopupUtils.showSingleDialog(
            context: context,
            titleText: '19금 연령제한',
            contentText: '연령제한된 컨텐츠는 로그인해야 시청할 수 있습니다.',
          );

          return;
        }
      }

      context.pushNamed(
        AppRoute.multiViewStreaming.routeName,
        extra: liveDetails,
      );
    }
  }
}
