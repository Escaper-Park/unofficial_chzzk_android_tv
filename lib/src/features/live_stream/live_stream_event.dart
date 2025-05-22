import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/extensions/custom_extensions.dart';
import '../../common/constants/enums.dart'
    show DpadAction, LiveMode, LiveStreamOverlayType;
import '../../utils/popup/popup_utils.dart';
import '../../utils/wakelock/wakelock_controller.dart';
import '../channel/model/channel.dart';
import '../group/controller/group_controller.dart';
import '../group/model/group.dart';
import '../home/controller/home_refresh_controller.dart';
import '../live/controller/live_controller.dart';
import '../live/model/live_detail.dart';
import '../live/model/live_info.dart';
import '../settings/controller/chat_setting_controller.dart';
import '../settings/controller/stream_setting_controller.dart';
import '../settings/widgets/value/chat_setting_data.dart';
import 'controller/live_chat_controller.dart';
import 'controller/live_mode_controller.dart';
import 'controller/live_overlay_controller.dart';
import 'controller/live_player_controller.dart';
import 'controller/live_playlist_controller.dart';
import 'controller/live_window_controller.dart';
import 'controller/live_stream_navigator_controller.dart';

mixin class LiveStreamEvent {
  /* from home */
  void refreshHome(WidgetRef ref) {
    ref.read(homeRefreshControllerProvider.notifier).refresh();
  }

  /* live chat */
  Future<void> disconnectChat(
    WidgetRef ref, {
    required String channelId,
    required String chatChannelId,
  }) async {
    await ref
        .read(
          liveChatControllerProvider(
            channelId: channelId,
            chatChannelId: chatChannelId,
          ).notifier,
        )
        .disconnect();
  }

  Future<void> reconnectChat(
    WidgetRef ref, {
    required String channelId,
    required String chatChannelId,
  }) async {
    ref.invalidate(
      liveChatControllerProvider(
        channelId: channelId,
        chatChannelId: chatChannelId,
      ),
    );
  }

  /* utils */
  Future<void> _executeForAllindices({
    required int count,
    required Future<void> Function(int index) action,
  }) async {
    final futures = List.generate(
      count,
      (index) => action(index),
    );
    await Future.wait(futures);
  }

  /* video player */
  Future<void> pauseAll(WidgetRef ref) async {
    final liveCount = _getLiveCount(ref);

    ref.read(currentActivatedLiveControllerProvider.notifier).reset();
    ref.read(currentActivatedAudioControllerProvider.notifier).reset();

    await _executeForAllindices(
      count: liveCount,
      action: (index) =>
          ref.read(livePlayerControllerProvider(index: index).notifier).pause(),
    );

    await ref.read(wakelockControllerProvider.notifier).disable();
  }

  Future<void> resumeAll(WidgetRef ref) async {
    final liveCount = _getLiveCount(ref);

    await _executeForAllindices(
      count: liveCount,
      action: (index) => _changeSource(ref, index: index),
    );

    await ref.read(wakelockControllerProvider.notifier).enable();
  }

  Future<void> disposeAll(WidgetRef ref) async {
    final liveCount = _getLiveCount(ref);

    await _executeForAllindices(
      count: liveCount,
      action: (index) => ref
          .read(livePlayerControllerProvider(index: index).notifier)
          .dispose(),
    );

    ref.read(livePlaylistControllerProvider.notifier).reset();
    ref.read(liveModeControllerProvider.notifier).reset();
  }

  /* screen */
  void focusScreenInMultiview(WidgetRef ref) {
    // focus screen by audio index.
    final currentActivatedAudioIndex =
        ref.read(currentActivatedAudioControllerProvider);

    setFocusedScreenIndex(ref, index: currentActivatedAudioIndex);
  }

  int getCurrentActivatedAudioIndex(WidgetRef ref) =>
      ref.watch(currentActivatedAudioControllerProvider);
  int? getCurrentActivatedLiveIndex(WidgetRef ref) =>
      ref.watch(currentActivatedLiveControllerProvider);

  void changeActivatedScreenOrAudio(
    WidgetRef ref,
    BuildContext context, {
    required int? currentActivatedLiveIndex,
    required int currentActivatedAudioIndex,
    required DpadAction action,
  }) {
    // while a specific screen is not focused, change only audio focus.
    if (currentActivatedLiveIndex == null) {
      _changeActivatedAudioSource(
        ref,
        context,
        action: action,
        currentActivatedAudioIndex: currentActivatedAudioIndex,
      );
    }
    // change the screen and the audio focus both.
    else {
      _changeActivatedLive(
        ref,
        context,
        currentActivatedLiveIndex: currentActivatedLiveIndex,
        action: action,
      );
    }
  }

  void setFocusedScreenIndex(WidgetRef ref, {required int index}) {
    ref
        .read(currentActivatedLiveControllerProvider.notifier)
        .setFocusedScreenIndex(index);
  }

  void _changeActivatedLive(
    WidgetRef ref,
    BuildContext context, {
    required int? currentActivatedLiveIndex,
    required DpadAction action,
  }) {
    final liveCount = _getLiveCount(ref);

    if (currentActivatedLiveIndex == null) return;

    int updatedIndex = 0;
    if (action == DpadAction.arrowLeft) {
      updatedIndex = (currentActivatedLiveIndex - 1) % liveCount;
    } else if (action == DpadAction.arrowRight) {
      updatedIndex = (currentActivatedLiveIndex + 1) % liveCount;
    }
    setFocusedScreenIndex(ref, index: updatedIndex);

    _changeActivatedAudioSource(
      ref,
      context,
      action: action,
      currentActivatedAudioIndex: currentActivatedLiveIndex,
    );
  }

  void _changeActivatedAudioSource(
    WidgetRef ref,
    BuildContext context, {
    required int currentActivatedAudioIndex,
    required DpadAction action,
  }) {
    final liveCount = _getLiveCount(ref);

    int updatedIndex = 0;
    // left: -
    if (action == DpadAction.arrowLeft) {
      updatedIndex = (currentActivatedAudioIndex - 1) % liveCount;
    }
    // right: +
    else if (action == DpadAction.arrowRight) {
      updatedIndex = (currentActivatedAudioIndex + 1) % liveCount;
    }
    // down: s=
    else if (action == DpadAction.arrowDown) {
      updatedIndex = currentActivatedAudioIndex;
    }

    ref
        .read(currentActivatedAudioControllerProvider.notifier)
        .setAudioSource(updatedIndex);

    // mute others
    for (int i = 0; i < liveCount; i++) {
      ref
          .read(livePlayerControllerProvider(index: i).notifier)
          .toggleMute(i != updatedIndex);
    }

    _showActiveMessage(ref, context, index: updatedIndex);
  }

  void _showActiveMessage(
    WidgetRef ref,
    BuildContext context, {
    required int index,
  }) {
    final screenHeight = context.screenHeight;
    final liveDetail = ref.read(livePlaylistControllerProvider)[index];

    final msg = '${liveDetail.channel.channelName} 채널 활성화';

    PopupUtils.showSnackBar(
      context: context,
      content: msg,
      displayDuration: 1000,
      bottomMargin: screenHeight - 45.0,
    );
  }

  void changeOverlay(
    WidgetRef ref, {
    required LiveStreamOverlayType overlayType,
    required FocusNode videoFocusNode,
  }) {
    ref.read(liveOverlayControllerProvider.notifier).changeOverlay(
          overlayType: overlayType,
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
    await ref.read(liveWindowControllerProvider.notifier).toggleOverlayChat();
  }

  Future<void> toggleViewMode(WidgetRef ref) async {
    await ref.read(liveWindowControllerProvider.notifier).toggleViewMode();
  }

  void setChatPosition(WidgetRef ref, DpadAction action) {
    final chatSettings = ref.read(chatSettingsControllerProvider);
    final chatPosData = ChatSettingsData.chatPositionData;
    final (int, int) pos =
        (chatSettings.chatPositionX, chatSettings.chatPositionY);

    final currentChatPositionIndex =
        ChatSettingsData.getPositionIndex(pos.$1, pos.$2);

    int updatedPosIndex = 0;
    if (action == DpadAction.arrowLeft) {
      updatedPosIndex = (currentChatPositionIndex - 1) % 9;
    } else if (action == DpadAction.arrowRight) {
      updatedPosIndex = (currentChatPositionIndex + 1) % 9;
    }

    final (int, int) updatedPos =
        (chatPosData[updatedPosIndex].posX, chatPosData[updatedPosIndex].posY);

    ref
        .read(chatSettingsControllerProvider.notifier)
        .setChatPositionX(updatedPos.$1);
    ref
        .read(chatSettingsControllerProvider.notifier)
        .setChatPositionY(updatedPos.$2);
  }

  /* controls */
  void resetOverlayTimer(WidgetRef ref, {required FocusNode videoFocusNode}) {
    ref.read(liveOverlayControllerProvider.notifier).resetOverlayTimer(
          videoFocusNode: videoFocusNode,
        );
  }

  Future<void> singleLivePlayOrPause(WidgetRef ref) async {
    await ref
        .read(livePlayerControllerProvider(index: 0).notifier)
        .playOrPause();
  }

  Future<void> playInRealTime(
    WidgetRef ref, {
    required FocusNode videoFocusNode,
  }) async {
    changeOverlay(
      ref,
      overlayType: LiveStreamOverlayType.none,
      videoFocusNode: videoFocusNode,
    );
    await _changeSource(ref, index: 0);
  }

  Future<void> showGroupListDialog(
    WidgetRef ref,
    BuildContext context, {
    required Widget Function(BuildContext dialogContext) groupListWidget,
  }) async {
    await PopupUtils.showWidgetDialog(
      context: context,
      widget: (dialogContext) {
        return groupListWidget(dialogContext);
      },
    );
  }

  Future<void> addMemberToGroup(
    WidgetRef ref,
    BuildContext context, {
    required BuildContext dialogContext,
    required Group group,
    required Channel channel,
  }) async {
    final addResult =
        await ref.read(groupControllerProvider.notifier).addMemberToGroup(
              id: group.id,
              member: channel.channelId,
            );

    final String successComment =
        '${group.groupName} 그룹에 ${channel.channelName} 채널이 추가되었습니다';
    final String failureComment =
        '${group.groupName} 그룹에 ${channel.channelName} 채널이 이미 참여하고 있습니다';

    if (context.mounted) {
      Navigator.of(dialogContext).pop();

      PopupUtils.showSnackBar(
        context: context,
        content: addResult ? successComment : failureComment,
      );
    }
  }

  Future<void> changeToMultiviewMode(WidgetRef ref) async {
    ref
        .read(liveWindowControllerProvider.notifier)
        .toggleLiveMode(LiveMode.multi);
    ref.read(liveModeControllerProvider.notifier).changeMode();
  }

  Future<void> changeToSingleviewMode(WidgetRef ref) async {
    await ref
        .read(livePlaylistControllerProvider.notifier)
        .changeToSingleView();
    ref.read(currentActivatedLiveControllerProvider.notifier).reset();

    ref
        .read(liveWindowControllerProvider.notifier)
        .toggleLiveMode(LiveMode.single);

    ref.read(liveModeControllerProvider.notifier).changeMode();
  }

  void removeLastLive(WidgetRef ref) {
    final currentActivatedAudioIndex =
        ref.read(currentActivatedAudioControllerProvider);

    final liveCount = _getLiveCount(ref);

    if (liveCount > 1) {
      ref.read(currentActivatedAudioControllerProvider.notifier).reset();

      // if activated audio source is last one
      if (currentActivatedAudioIndex == liveCount - 1) {
        // unmute first
        ref
            .read(livePlayerControllerProvider(index: 0).notifier)
            .toggleMute(false);
      }

      ref.read(currentActivatedLiveControllerProvider.notifier).reset();
      ref.read(livePlaylistControllerProvider.notifier).removeLastIndexLive();
    }
  }

  Future<void> play(
    WidgetRef ref,
    BuildContext context, {
    required LiveMode liveMode,
    required LiveInfo liveInfo,
    required Channel channel,
  }) async {
    const int maxLiveCount = 4;

    // blocked
    if (channel.personalData?.privateUserBlock == true) return;

    // adult banned alert
    if (liveInfo.adult == true && liveInfo.liveImageUrl == null) {
      if (context.mounted) {
        PopupUtils.showSnackBar(
          context: context,
          content: '사용자 보호를 위해 연령 제한이 설정된 라이브입니다. 시청을 원하면 로그인 후 본인 인증을 완료해주세요',
        );
      }
      return;
    }

    // abroad banned alert
    if (liveInfo.blindType == 'ABROAD') {
      if (context.mounted) {
        PopupUtils.showSnackBar(
          context: context,
          content: '해외 시청이 제한된 라이브입니다',
        );
      }
      return;
    }

    final LiveDetail? liveDetail = await ref
        .read(liveControllerProvider.notifier)
        .getLiveDetail(channelId: channel.channelId);

    if (liveDetail == null) return;

    final bool isContainsInPlaylist =
        ref.read(livePlaylistControllerProvider.notifier).checkIsContains(
              liveDetail: liveDetail,
            );

    if (isContainsInPlaylist) return;

    // ended stream.
    if (liveDetail.livePlaybackJson.media.isEmpty) {
      if (context.mounted) {
        PopupUtils.showSnackBar(
          context: context,
          content: '종료된 방송입니다',
        );
      }
      return;
    }

    /* play */
    // single view
    if (liveMode == LiveMode.single) {
      ref.read(livePlaylistControllerProvider.notifier).reset();
      ref
          .read(livePlaylistControllerProvider.notifier)
          .addLive(liveDetail: liveDetail);

      if (context.mounted) {
        await _changeSource(ref, index: 0);
        return;
      }

      return;
    }
    // multi view
    else {
      final liveCount = _getLiveCount(ref);

      if (liveCount >= maxLiveCount && context.mounted) {
        PopupUtils.showSnackBar(
          context: context,
          content: '멀티뷰는 최대 4개까지 재생할 수 있습니다',
        );

        return;
      }

      ref
          .read(livePlaylistControllerProvider.notifier)
          .addLive(liveDetail: liveDetail);

      return;
    }
  }

  Future<void> _changeSource(WidgetRef ref, {required int index}) async {
    await ref
        .read(livePlayerControllerProvider(index: index).notifier)
        .changeSource();
  }

  int _getLiveCount(WidgetRef ref) =>
      ref.read(livePlaylistControllerProvider.notifier).getLiveCount();

  /* contents */
  Future<void> categoryLivesFetchMore(
    WidgetRef ref, {
    required String channelId,
  }) async {
    await ref
        .read(
          liveStreamCategoryLivesControllerProvider(channelId: channelId)
              .notifier,
        )
        .fetchMore();
  }

  Future<void> popularLivesFetchMore(WidgetRef ref) async {
    await ref
        .read(liveStreamPopularLivesControllerProvider.notifier)
        .fetchMore();
  }

  Future<void> changeResolution(
    WidgetRef ref, {
    required int controllerIndex,
    required int resolutionIndex,
  }) async {
    await ref
        .read(livePlayerControllerProvider(index: controllerIndex).notifier)
        .changeResolution(
          resolutionIndex: resolutionIndex,
        );
  }

  Future<void> setShowGroup(WidgetRef ref, {required int value}) async =>
      await ref
          .read(streamSettingsControllerProvider.notifier)
          .setShowGroupIndex(value);

  void selectActivatedGroup(WidgetRef ref, {required int groupIndex}) async {
    ref
        .read(groupControllerProvider.notifier)
        .setActivatedGroup(index: groupIndex);
  }
}
