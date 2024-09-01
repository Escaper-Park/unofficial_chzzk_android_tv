import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/widgets/dpad_widgets.dart';

import '../../../utils/popup/popup_utils.dart';
import '../../setting/controller/chat_settings_controller.dart';
import '../../setting/widgets/chat/chat_settings_data.dart';
import './controller/live_stream_controllers_index.dart';
import './widgets/controls/controls_index.dart';
import './widgets/contents/live_stream_contents_index.dart';

class LiveControlsOverlay extends HookConsumerWidget {
  const LiveControlsOverlay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // snackbar
    const int snackbarDisplaySeconds = 2;
    DateTime? lastPressedBackButtonAt;

    // for ready to input button
    final videoFocusNode = useFocusNode();
    final controlsFSN = useFocusScopeNode();

    final screenMode = ref.watch(liveModeControllerProvider);
    final liveOverlayType = ref.watch(liveOverlayControllerProvider);

    // To change Audio, Screen active
    final currentActivatedLiveIndex =
        ref.watch(currentActivatedLiveIndexProvider);
    final currentActivatedAudioSourceIndex =
        ref.watch(currentActivatedAudioSourceIndexProvider);

    final currentControl = switch (liveOverlayType) {
      LiveOverlayType.none => const SizedBox.shrink(),
      LiveOverlayType.main => LiveStreamMainControls(
          videoFocusNode: videoFocusNode,
          controlsFSN: controlsFSN,
        ),
      LiveOverlayType.following => LiveStreamFollowingLivesOverlay(
          videoFocusNode: videoFocusNode,
          controlsFSN: controlsFSN,
        ),
      LiveOverlayType.popular => LiveStreamPopularLivesOverlay(
          videoFocusNode: videoFocusNode,
          controlsFSN: controlsFSN,
        ),
      LiveOverlayType.category => Consumer(
          builder: (context, ref, child) {
            final currentliveDetail = ref.read(livePlaylistControllerProvider)[
                currentActivatedAudioSourceIndex];

            return LiveStreamCategoryLivesOverlay(
              videoFocusNode: videoFocusNode,
              controlsFSN: controlsFSN,
              channelId: currentliveDetail.channel.channelId,
            );
          },
        ),
      LiveOverlayType.chatSettings => ChatSettingsControlsOverlay(
          videoFocusNode: videoFocusNode,
          controlsFSN: controlsFSN,
        ),
      LiveOverlayType.soundSettings => SoundSettingsControlsOverlay(
          videoFocusNode: videoFocusNode,
          controlsFSN: controlsFSN,
        ),
      LiveOverlayType.resolutionSettings => ResolutionSettingsControlsOverlay(
          videoFocusNode: videoFocusNode,
          controlsFSN: controlsFSN,
        ),
      LiveOverlayType.multiviewPlayInfo => MultiviewPlayInfo(
          videoFocusNode: videoFocusNode,
          controlsFSN: controlsFSN,
        ),
      LiveOverlayType.multiviewScreenSettings => MultiviewScreenControlsOverlay(
          videoFocusNode: videoFocusNode,
          controlsFSN: controlsFSN,
        ),
    };

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        // add !didpop to prevent context.pop from working twice.
        if (!didPop) {
          // pop if overlay is hidden
          if (liveOverlayType == LiveOverlayType.none) {
            final currentTime = DateTime.now();

            // Before [Snackbar] is visible
            if (lastPressedBackButtonAt == null ||
                currentTime.difference(lastPressedBackButtonAt!) >
                    const Duration(seconds: snackbarDisplaySeconds)) {
              lastPressedBackButtonAt = currentTime;

              if (context.mounted) {
                // Show Snackbar
                const String msg = '뒤로 가기를 한 번 더 누르면 종료됩니다';
                PopupUtils.showSnackbar(context, msg, milliseconds: 1000);
              }
            }
            // While [Snackbar] is Visible
            else {
              // dispose all videos and pop
              final liveCount = ref
                  .read(livePlaylistControllerProvider.notifier)
                  .getLiveCount();

              for (int i = 0; i < liveCount; i++) {
                ref
                    .read(singleLivePlayerControllerProvider(index: i).notifier)
                    .dispose();
              }

              if (context.mounted) context.pop();
            }
          }
          // hide overlay
          else {
            ref.read(liveOverlayControllerProvider.notifier).changeOverlay(
                  overlayType: LiveOverlayType.none,
                  videoFocusNode: videoFocusNode,
                );
          }
        }
      },
      child: Stack(
        children: [
          // Dpad Controller
          DpadActionWidget(
            autofocus: true,
            focusNode: videoFocusNode,
            useFocusedBorder: false,
            useKeyRepeatEvent: false,
            borderRadius: 0.0,
            dpadActionCallbacks: {
              // OK
              DpadAction.select: () {
                videoFocusNode.unfocus();
                controlsFSN.requestFocus();

                // show main controls
                ref.read(liveOverlayControllerProvider.notifier).changeOverlay(
                      overlayType: LiveOverlayType.main,
                      videoFocusNode: videoFocusNode,
                    );
              },
              // UP
              DpadAction.arrowUp: () {
                videoFocusNode.unfocus();
                controlsFSN.requestFocus();

                // show other contents
                ref.read(liveOverlayControllerProvider.notifier).changeOverlay(
                      overlayType: LiveOverlayType.following,
                      videoFocusNode: videoFocusNode,
                    );
              },
              // Down
              DpadAction.arrowDown: () {
                // single
                if (screenMode == LiveMode.singleView) {
                  // overlay chat on/off
                  ref
                      .read(chatWindowModeControllerProvider.notifier)
                      .toggleOverlayChat();
                }
                // multiview
                else {
                  ref
                      .read(currentActivatedLiveIndexProvider.notifier)
                      .setFocusScreenIndex(currentActivatedAudioSourceIndex);
                }
              },
              // Left
              DpadAction.arrowLeft: () {
                // singleview
                if (screenMode == LiveMode.singleView) {
                  _setChatPosition(ref, DpadAction.arrowLeft);
                }
                // multiview
                else {
                  // change only focused audio
                  if (currentActivatedLiveIndex == null) {
                    _changeActiveAudioSource(
                      context,
                      ref,
                      DpadAction.arrowLeft,
                      currentActivatedAudioSourceIndex,
                    );
                  }
                  // change focused screen and audio
                  else {
                    _changeActiveLive(
                      context,
                      ref,
                      DpadAction.arrowLeft,
                      currentActivatedLiveIndex,
                    );
                  }
                }
              },
              // Right
              DpadAction.arrowRight: () {
                // singleview
                if (screenMode == LiveMode.singleView) {
                  _setChatPosition(ref, DpadAction.arrowRight);
                }
                // multiview
                else {
                  // change only focused audio
                  if (currentActivatedLiveIndex == null) {
                    _changeActiveAudioSource(
                      context,
                      ref,
                      DpadAction.arrowRight,
                      currentActivatedAudioSourceIndex,
                    );
                  }
                  // change focused screen and audio
                  else {
                    _changeActiveLive(
                      context,
                      ref,
                      DpadAction.arrowRight,
                      currentActivatedLiveIndex,
                    );
                  }
                }
              },
            },
            child: const SizedBox.shrink(),
          ),
          // controls
          currentControl,
        ],
      ),
    );
  }

  void _setChatPosition(WidgetRef ref, DpadAction action) {
    final chatSettings = ref.read(chatSettingsControllerProvider);
    final itemData = ChatSettingsData.chatPositionData;
    final (int, int) pos =
        (chatSettings.chatPositionX, chatSettings.chatPositionY);

    final currentChatPositionIndex =
        ChatSettingsData.getPositionIndex(pos.$1, pos.$2);

    int updatedValue = 0;
    // arrow left: -
    if (action == DpadAction.arrowLeft) {
      updatedValue = (currentChatPositionIndex - 1) % 9;
    }
    // arrow right: +
    else if (action == DpadAction.arrowRight) {
      updatedValue = (currentChatPositionIndex + 1) % 9;
    }

    final (int, int) updatedPos =
        (itemData[updatedValue].posX, itemData[updatedValue].posY);

    ref
        .read(chatSettingsControllerProvider.notifier)
        .setChatPositionX(updatedPos.$1);
    ref
        .read(chatSettingsControllerProvider.notifier)
        .setChatPositionY(updatedPos.$2);
  }

  void _changeActiveAudioSource(
    BuildContext context,
    WidgetRef ref,
    DpadAction action,
    int currentAudioSourceIndex,
  ) {
    final liveCount =
        ref.read(livePlaylistControllerProvider.notifier).getLiveCount();

    int updatedValue = 0;
    // left: -
    if (action == DpadAction.arrowLeft) {
      updatedValue = (currentAudioSourceIndex - 1) % liveCount;
    }
    // right: +
    else if (action == DpadAction.arrowRight) {
      updatedValue = (currentAudioSourceIndex + 1) % liveCount;
    }
    // down: =
    else if (action == DpadAction.arrowDown) {
      updatedValue = currentAudioSourceIndex;
    }

    ref
        .read(currentActivatedAudioSourceIndexProvider.notifier)
        .setAudioSource(updatedValue);

    for (int i = 0; i < liveCount; i++) {
      // unmute
      if (i == updatedValue) {
        ref
            .read(singleLivePlayerControllerProvider(index: i).notifier)
            .setMute(false);
      }
      // mute
      else {
        ref
            .read(singleLivePlayerControllerProvider(index: i).notifier)
            .setMute(true);
      }
    }

    _showActiveMsg(
      context,
      ref,
      updatedValue,
    );
  }

  void _changeActiveLive(
    BuildContext context,
    WidgetRef ref,
    DpadAction action,
    int currentActiveIndex,
  ) {
    final liveCount =
        ref.read(livePlaylistControllerProvider.notifier).getLiveCount();

    int updatedValue = 0;

    // left: -
    if (action == DpadAction.arrowLeft) {
      updatedValue = (currentActiveIndex - 1) % liveCount;
    }
    // right: +
    else if (action == DpadAction.arrowRight) {
      updatedValue = (currentActiveIndex + 1) % liveCount;
    }

    ref
        .read(currentActivatedLiveIndexProvider.notifier)
        .setFocusScreenIndex(updatedValue);

    _changeActiveAudioSource(context, ref, action, currentActiveIndex);
  }

  void _showActiveMsg(BuildContext context, WidgetRef ref, int index) {
    final screenHeight = MediaQuery.of(context).size.height;
    final liveDetail = ref.read(livePlaylistControllerProvider)[index];

    final msg = '${liveDetail.channel.channelName} 채널 활성화';

    PopupUtils.showSnackbar(
      context,
      msg,
      milliseconds: 1000,
      bottomMargin: screenHeight - 45.0,
    );
  }
}
