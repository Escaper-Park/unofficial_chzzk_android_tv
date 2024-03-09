import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../features/live/model/live.dart';
import '../../../features/multi_view/controller/multi_view_controller.dart';
import '../../router/app_router.dart';

part 'multi_view_stream_controller.g.dart';

@riverpod
class MultiViewStreamController extends _$MultiViewStreamController {
  @override
  int? build() {
    // Current Selected Channel
    return null;
  }

  void setCurrentChannel(int index) {
    state == index ? state = null : state = index;
  }

  Future<void> restartMultiView({
    // ignore: avoid_build_context_in_providers
    required BuildContext context,
    required List<LiveDetail> liveDetails,
  }) async {
    context.pushReplacementNamed(AppRoute.multiViewStreaming.routeName,
        extra: liveDetails);
  }
}

@riverpod
class MultiViewVolumeController extends _$MultiViewVolumeController {
  @override
  List<double> build() {
    final int length = ref.watch(multiViewControllerProvider).length;

    // Initial sound settings
    return List<double>.generate(length, (index) => index == 0 ? 1.0 : 0.0);
  }

  void setVolume({required int index, required double volume}) {
    List<double> newState = [...state];
    newState[index] = volume;

    state = newState;
  }

  void muteOrUnmute({required int index, bool init = false}) {
    List<double> newState = [...state];

    // Unmute
    if (newState[index] == 0.0) {
      newState[index] = init ? 1.0 : state[index];
    }
    // mute
    else {
      newState[index] = init ? 0.0 : state[index];
    }

    state = newState;
  }
}
