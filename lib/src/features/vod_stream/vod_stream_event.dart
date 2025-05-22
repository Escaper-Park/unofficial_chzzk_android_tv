import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/constants/enums.dart'
    show PlaybackDirection, VodStreamOverlayType;
import '../../utils/wakelock/wakelock_controller.dart';

import '../vod/controller/vod_controller.dart';
import '../vod/model/vod.dart';
import 'controller/vod_chat_controller.dart';
import 'controller/vod_overlay_controller.dart';
import 'controller/vod_player_controller.dart';
import 'controller/vod_window_controller.dart';

mixin class VodStreamEvent {
  /* dispose chat */
  void disposeChatQueue(WidgetRef ref, {required int videoNo}) {
    ref
        .read(vodChatQueueControllerProvider(videoNo: videoNo).notifier)
        .disposeQueue();
    
    ref.invalidate(vodChatQueueControllerProvider(videoNo: videoNo));
  }

  /* navigate */
  void pop(BuildContext context) {
    if (context.mounted) {
      context.pop();
    }
  }

  /* video player */
  Future<void> toStart(WidgetRef ref) async {
    await ref.read(vodPlayerControllerProvider.notifier).seekTo(
          direction: PlaybackDirection.backward,
          endSeek: true,
          duration: Duration(seconds: 0),
        );
  }

  Future<void> pause(WidgetRef ref) async {
    await ref.read(vodPlayerControllerProvider.notifier).pause();
    await ref.read(wakelockControllerProvider.notifier).disable();
  }

  Future<void> resume(WidgetRef ref) async {
    await ref.read(vodPlayerControllerProvider.notifier).resume();
    await ref.read(wakelockControllerProvider.notifier).enable();
  }

  Future<void> changeSource(WidgetRef ref, {required Vod vod}) async {
    final getVodResult = await ref
        .read(vodControllerProvider.notifier)
        .addVodToPlaylist(videoNo: vod.videoNo);

    if (getVodResult == false) return;

    await ref.read(vodPlayerControllerProvider.notifier).changeSource();
  }

  Future<void> changeResolution(
    WidgetRef ref, {
    required int resolutionIndex,
  }) async {
    await ref
        .read(vodPlayerControllerProvider.notifier)
        .changeResolution(resolutionIndex: resolutionIndex);
  }

  Future<void> disposeController(WidgetRef ref) async {
    await ref.read(vodPlayerControllerProvider.notifier).dispose();
  }

  Future<void> seekToByButton(
    WidgetRef ref, {
    required bool endSeek,
    required PlaybackDirection direction,
  }) async {
    await ref.read(vodPlayerControllerProvider.notifier).seekToByButton(
          endSeek: endSeek,
          direction: direction,
        );
  }

  Future<void> seekToBySlider(
    WidgetRef ref, {
    required PlaybackDirection direction,
    required bool endSeek,
    required double pos,
  }) async {
    await ref.read(vodPlayerControllerProvider.notifier).seekTo(
          direction: direction,
          endSeek: endSeek,
          duration: Duration(
            seconds: pos.toInt(),
          ),
        );
  }

  /* screen */
  void changeOverlay(
    WidgetRef ref, {
    required VodStreamOverlayType overlayType,
    required FocusNode videoFocusNode,
  }) {
    ref.read(vodOverlayControllerProvider.notifier).changeOverlay(
          overlayType: overlayType,
          videoFocusNode: videoFocusNode,
        );
  }

  void resetOverlayTimer(WidgetRef ref, {required FocusNode videoFocusNode}) {
    ref.read(vodOverlayControllerProvider.notifier).resetOverlayTimer(
          videoFocusNode: videoFocusNode,
        );
  }

  Future<void> toggleWakelock(
    WidgetRef ref, {
    required bool enable,
  }) async {
    if (enable) {
      await ref.read(wakelockControllerProvider.notifier).enable();
    } else {
      await ref.read(wakelockControllerProvider.notifier).disable();
    }
  }

  Future<void> toggleOverlayChat(WidgetRef ref) async {
    await ref.read(vodWindowControllerProvider.notifier).toggleOverlayChat();
  }

  Future<void> toggleViewMode(WidgetRef ref) async {
    await ref.read(vodWindowControllerProvider.notifier).toggleViewMode();
  }
}
