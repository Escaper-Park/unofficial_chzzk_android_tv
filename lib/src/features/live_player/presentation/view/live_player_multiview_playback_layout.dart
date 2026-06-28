import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/ui/ui.dart';
import '../../../chat/presentation/player_chat.dart';
import '../../../player_shared/presentation/overlay_controls/overlay_controls.dart';
import '../../../settings/domain/entities/settings_preferences.dart';
import '../bloc/live_player_bloc.dart';
import '../live_player_screen_design.dart';
import 'live_player_multiview_chat_policy.dart';
import 'live_player_playback_session_controller.dart';
import 'live_player_status_surface.dart';
import 'live_player_surface.dart';

part 'live_player_multiview_focus_layout.dart';
part 'live_player_multiview_pbp_layout.dart';
part 'live_player_multiview_pip_geometry.dart';
part 'live_player_multiview_pip_layout.dart';
part 'live_player_multiview_slot_cell.dart';

typedef LivePlayerStatusSurfaceBuilder =
    Widget? Function(
      LivePlayerSlotState slot, {
      required bool active,
      required bool isMultiview,
    });

class LivePlayerPlaybackLayout extends HookWidget {
  const LivePlayerPlaybackLayout({
    super.key,
    required this.state,
    required this.playbackPaused,
    required this.singleMuted,
    required this.chat,
    required this.playbackSessionController,
    required this.statusSurfaceFor,
  });

  final LivePlayerState state;
  final bool playbackPaused;
  final bool singleMuted;
  final Widget? chat;
  final LivePlayerPlaybackSessionController playbackSessionController;
  final LivePlayerStatusSurfaceBuilder statusSurfaceFor;

  @override
  Widget build(BuildContext context) {
    final activeOutlineController = useMemoized(
      () => TvTimedVisibilityController(
        displayDuration: LivePlayerScreenDesign.multiviewActiveOutlineDuration,
      ),
      const [],
    );
    useListenable(activeOutlineController);
    final lastHighlightSerial = useRef(state.activeSlotHighlightSerial);

    useEffect(() {
      if (lastHighlightSerial.value != state.activeSlotHighlightSerial) {
        lastHighlightSerial.value = state.activeSlotHighlightSerial;
        activeOutlineController.show();
      }

      return null;
    }, [activeOutlineController, state.activeSlotHighlightSerial]);

    useEffect(() {
      return activeOutlineController.dispose;
    }, [activeOutlineController]);

    return ColoredBox(
      color: LivePlayerScreenDesign.backgroundColor,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final size = constraints.biggest;
          final slotRects = _livePlayerSlotRects(size, state);
          final showFocusChat = livePlayerUsesFocusSideChat(state);
          final showMultiviewSideChat = livePlayerUsesPbpSideChat(state);
          final effectiveChatMode = livePlayerEffectiveChatPresentationMode(
            state,
          );
          final singleChatMode = PlayerChatPresentationMode.fromSettingsIndex(
            state.settingsPreferences.liveSettings.chatWindowIndex,
          );
          final showSingleSideChat =
              !state.isMultiview &&
              chat != null &&
              singleChatMode == PlayerChatPresentationMode.sidePanel;
          final showSingleOverlayChat =
              !state.isMultiview &&
              chat != null &&
              singleChatMode != PlayerChatPresentationMode.sidePanel;
          final showMultiviewOverlayChat =
              state.isMultiview &&
              chat != null &&
              effectiveChatMode == PlayerChatPresentationMode.overlay;

          return Stack(
            fit: StackFit.expand,
            children: [
              for (final slot in _livePlayerPaintOrder(state))
                if (slotRects.containsKey(slot.slotId))
                  Positioned.fromRect(
                    key: ValueKey(
                      'live-player-playback-slot-${slot.slotId}',
                    ),
                    rect: slotRects[slot.slotId]!,
                    child: _LivePlayerSlotCell(
                      slotId: slot.slotId,
                      isMultiview: state.isMultiview,
                      active:
                          state.isMultiview &&
                          slot.slotId == state.activeSlotId,
                      activeOutlineVisible:
                          state.isMultiview &&
                          slot.slotId == state.activeSlotId &&
                          activeOutlineController.isShowing,
                      playbackPaused: playbackPaused,
                      volume: state.isMultiview
                          ? state.slotPlaybackVolume(slot.slotId)
                          : singleMuted
                          ? 0
                          : 1,
                      mixWithOthers: true,
                      watchEventEnabled:
                          !state.isMultiview &&
                          state.watchEventReportingEnabled,
                      playbackSessionController: playbackSessionController,
                      statusSurfaceFor: statusSurfaceFor,
                    ),
                  ),
              if (showSingleSideChat)
                Positioned.fromRect(
                  rect: _singleSideChatRect(
                    size,
                    state.settingsPreferences.chatSettings,
                  ),
                  child: RepaintBoundary(child: chat!),
                )
              else if (showSingleOverlayChat)
                Positioned.fill(child: RepaintBoundary(child: chat!))
              else if (showMultiviewSideChat && chat != null)
                Positioned.fromRect(
                  rect: _singleSideChatRect(
                    size,
                    state.settingsPreferences.chatSettings,
                  ),
                  child: RepaintBoundary(child: chat!),
                )
              else if (showMultiviewOverlayChat)
                Positioned.fill(child: RepaintBoundary(child: chat!)),
              if (showFocusChat)
                Positioned.fromRect(
                  rect: _focusChatRect(
                    size,
                    chatOnLeft: _singleSideChatOnLeft(
                      state.settingsPreferences.chatSettings,
                    ),
                    fullHeight: state.slots.length <= 3,
                  ),
                  child: RepaintBoundary(
                    child:
                        chat ??
                        const ColoredBox(
                          color: LivePlayerScreenDesign.backgroundColor,
                        ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

Map<String, Rect> _livePlayerSlotRects(
  Size size,
  LivePlayerState state,
) {
  if (!state.isMultiview) {
    return {
      state.activeSlotId: _singlePlaybackRect(
        size,
        state.settingsPreferences.liveSettings.chatWindowIndex,
        state.settingsPreferences.chatSettings,
      ),
    };
  }

  return switch (state.multiviewLayoutMode) {
    LivePlayerMultiviewLayoutMode.pbp => _pbpSlotRects(
      size,
      state.slots,
      chatSettings: state.settingsPreferences.chatSettings,
      useSideChat: livePlayerUsesPbpSideChat(state),
    ),
    LivePlayerMultiviewLayoutMode.pip => _pipSlotRects(size, state),
    LivePlayerMultiviewLayoutMode.focus => _focusSlotRects(
      size,
      activeSlot: state.activeSlot,
      reserveChat: livePlayerUsesFocusSideChat(state),
      chatOnLeft: _singleSideChatOnLeft(state.settingsPreferences.chatSettings),
      subSlots: [
        for (final slot in state.slots)
          if (slot.slotId != state.activeSlotId) slot,
      ],
    ),
  };
}

List<LivePlayerSlotState> _livePlayerPaintOrder(LivePlayerState state) {
  if (!state.isMultiview) {
    return [state.activeSlot];
  }

  if (state.multiviewLayoutMode != LivePlayerMultiviewLayoutMode.pip) {
    return state.slots;
  }

  return [
    state.activeSlot,
    for (final slot in state.slots)
      if (slot.slotId != state.activeSlotId) slot,
  ];
}

Set<String> _playbackEnabledSlotIds(LivePlayerState state) {
  if (!state.isMultiview) {
    return {state.activeSlotId};
  }

  final enabledSlotIds = <String>{};
  var canStartNextPendingSlot = true;
  for (final slot in state.slots) {
    if (slot.status == LivePlayerSlotStatus.playing &&
        slot.playbackUri != null) {
      enabledSlotIds.add(slot.slotId);
    } else if (canStartNextPendingSlot) {
      enabledSlotIds.add(slot.slotId);
    }

    canStartNextPendingSlot =
        canStartNextPendingSlot && _slotStartupFinished(slot);
  }

  return enabledSlotIds;
}

bool _slotStartupFinished(LivePlayerSlotState slot) {
  return switch (slot.status) {
    LivePlayerSlotStatus.empty ||
    LivePlayerSlotStatus.ended ||
    LivePlayerSlotStatus.failure => true,
    LivePlayerSlotStatus.playing => slot.playbackUri != null,
    LivePlayerSlotStatus.loadingSource || LivePlayerSlotStatus.ready => false,
  };
}

Rect _singlePlaybackRect(
  Size size,
  int chatPresentationModeIndex,
  ChatSettings chatSettings,
) {
  final mode = PlayerChatPresentationMode.fromSettingsIndex(
    chatPresentationModeIndex,
  );
  if (mode != PlayerChatPresentationMode.sidePanel) {
    return Offset.zero & size;
  }

  final sideWidth = _singleSideChatWidth(size, chatSettings);
  if (_singleSideChatOnLeft(chatSettings)) {
    return Rect.fromLTWH(
      sideWidth,
      0,
      math.max(0, size.width - sideWidth),
      size.height,
    );
  }

  return Rect.fromLTWH(
    0,
    0,
    math.max(0, size.width - sideWidth),
    size.height,
  );
}

Rect _singleSideChatRect(
  Size size,
  ChatSettings chatSettings,
) {
  final sideWidth = _singleSideChatWidth(size, chatSettings);
  if (_singleSideChatOnLeft(chatSettings)) {
    return Rect.fromLTWH(0, 0, sideWidth, size.height);
  }

  return Rect.fromLTWH(size.width - sideWidth, 0, sideWidth, size.height);
}

double _singleSideChatWidth(Size size, ChatSettings chatSettings) {
  final safeWidth = size.width.isFinite && size.width > 0 ? size.width : 0.0;

  return safeWidth * chatSettings.chatSidePanelWidth.clamp(0, 100) / 100;
}

bool _singleSideChatOnLeft(ChatSettings chatSettings) {
  return chatSettings.chatSidePanelPositionX <= 50;
}
