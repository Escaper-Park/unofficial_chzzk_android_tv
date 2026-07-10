import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/tv/focus/focus.dart';
import '../../../player_shared/presentation/overlay_controls/overlay_controls.dart';
import '../../../settings/domain/entities/settings_preferences.dart';
import '../../../settings/presentation/widgets/player_chat_settings_overlay.dart';
import '../bloc/live_player_bloc.dart';
import 'live_player_controls_overlay_design.dart';
import 'live_player_multiview_info_panel.dart';
import 'live_player_overlay_actions.dart';
import 'live_player_overlay_chat_mode_menu.dart';
import 'live_player_overlay_group_menus.dart';
import 'live_player_overlay_links.dart';
import 'live_player_overlay_multiview_default_settings_actions.dart';
import 'live_player_overlay_multiview_menus.dart';
import 'live_player_overlay_multiview_settings_actions.dart';
import 'live_player_overlay_primary_menus.dart';
import 'live_player_overlay_realtime_info.dart';
import 'live_player_overlay_resolution_menu.dart';
import 'live_player_overlay_settings_actions.dart';
import 'live_player_overlay_view_menus.dart';

part 'live_player_controls_overlay_content.dart';
part 'live_player_controls_overlay_menu_panel.dart';
part 'live_player_controls_overlay_modes.dart';

class LivePlayerControlsOverlay extends HookWidget {
  const LivePlayerControlsOverlay({
    super.key,
    required this.state,
    required this.controlsNode,
    required this.playbackPaused,
    required this.muted,
    required this.onPlaybackPausedChanged,
    this.onRealtimePressed,
    required this.onMutedChanged,
    required this.onInteraction,
    required this.modalDismissSerial,
    required this.onModalVisibilityChanged,
    this.selectSlotDetailsFromBloc = false,
  });

  final LivePlayerState state;
  final FocusScopeNode controlsNode;
  final bool playbackPaused;
  final bool muted;
  final ValueChanged<bool> onPlaybackPausedChanged;
  final VoidCallback? onRealtimePressed;
  final ValueChanged<bool> onMutedChanged;
  final VoidCallback onInteraction;
  final int modalDismissSerial;
  final ValueChanged<bool> onModalVisibilityChanged;
  final bool selectSlotDetailsFromBloc;

  @override
  Widget build(BuildContext context) {
    final actionMode = useState(_LiveOverlayActionMode.primary);
    final activeMenu = useState(_LiveOverlayMenu.none);
    final activeChatSettingIndex = useState<int?>(null);
    final activeMultiviewDefaultSettingIndex = useState<int?>(null);
    final primaryLinks = useMemoized(LiveOverlayPrimaryLinks.new);
    final settingsLinks = useMemoized(LiveOverlaySettingsLinks.new);
    final multiviewSettingsLinks = useMemoized(
      LiveOverlayMultiviewSettingsLinks.new,
    );
    final multiviewDefaultSettingLinks = useMemoized(
      LiveOverlayMultiviewDefaultSettingsLinks.new,
    );
    final settingsFirstFocusNode = useFocusNode(
      debugLabel: 'live player settings first action',
    );
    final lastModalDismissSerial = useRef(modalDismissSerial);
    final chatSettingLinks = useMemoized(
      () => [
        for (var index = 0; index < playerChatSettingsCount; index += 1)
          LayerLink(),
      ],
    );

    void closeMenu({bool notify = true}) {
      final wasOpen = activeMenu.value != _LiveOverlayMenu.none;
      activeMenu.value = _LiveOverlayMenu.none;
      activeChatSettingIndex.value = null;
      activeMultiviewDefaultSettingIndex.value = null;
      if (wasOpen && notify) {
        onModalVisibilityChanged(false);
      }
    }

    void openMenu(
      _LiveOverlayMenu menu, {
      int? chatSettingIndex,
      int? multiviewDefaultSettingIndex,
    }) {
      onInteraction();
      activeMenu.value = menu;
      activeChatSettingIndex.value = chatSettingIndex;
      activeMultiviewDefaultSettingIndex.value = multiviewDefaultSettingIndex;
      onModalVisibilityChanged(true);
    }

    void setActionMode(_LiveOverlayActionMode mode) {
      onInteraction();
      closeMenu();
      actionMode.value = mode;
    }

    void updatePreferences(SettingsPreferences preferences) {
      onInteraction();
      context.read<LivePlayerBloc>().add(
        LivePlayerEvent.preferencesChanged(preferences: preferences),
      );
    }

    void updateSlotResolution({
      required String slotId,
      required int resolutionIndex,
    }) {
      onInteraction();
      context.read<LivePlayerBloc>().add(
        LivePlayerEvent.slotResolutionSelected(
          slotId: slotId,
          resolutionIndex: resolutionIndex,
        ),
      );
    }

    useEffect(() {
      if (lastModalDismissSerial.value != modalDismissSerial) {
        lastModalDismissSerial.value = modalDismissSerial;
        closeMenu(notify: false);
      }

      return null;
    }, [modalDismissSerial]);

    useEffect(() {
      if (actionMode.value == _LiveOverlayActionMode.settings) {
        settingsFirstFocusNode.requestFocus();
      }

      return null;
    }, [actionMode.value]);

    final slot = state.activeSlot;
    final showingMultiviewInfo =
        activeMenu.value == _LiveOverlayMenu.multiviewInfo;
    final activeMenuPanel = showingMultiviewInfo
        ? null
        : _activeMenuPanel(
            context: context,
            state: state,
            slot: slot,
            activeMenu: activeMenu.value,
            activeChatSettingIndex: activeChatSettingIndex.value,
            activeMultiviewDefaultSettingIndex:
                activeMultiviewDefaultSettingIndex.value,
            primaryLinks: primaryLinks,
            settingsLinks: settingsLinks,
            multiviewSettingsLinks: multiviewSettingsLinks,
            multiviewDefaultSettingLinks: multiviewDefaultSettingLinks,
            chatSettingLinks: chatSettingLinks,
            playbackPaused: playbackPaused,
            muted: muted,
            onPlaybackPausedChanged: (value) {
              onInteraction();
              onPlaybackPausedChanged(value);
            },
            onRealtimePressed: onRealtimePressed ?? () {},
            onMutedChanged: (value) {
              onInteraction();
              onMutedChanged(value);
            },
            onInteraction: onInteraction,
            onCloseMenu: closeMenu,
            onOpenMenu: openMenu,
            onPreferencesChanged: updatePreferences,
            onSlotResolutionSelected: updateSlotResolution,
          );

    return Focus(
      canRequestFocus: false,
      skipTraversal: true,
      onKeyEvent: (_, event) {
        if (event is KeyDownEvent || event is KeyRepeatEvent) {
          onInteraction();
        }

        return KeyEventResult.ignored;
      },
      child: TvFocusSection(
        node: controlsNode,
        child: Stack(
          fit: StackFit.expand,
          children: [
            _livePlayerControlsMainSurface(
              state: state,
              slot: slot,
              actionMode: actionMode.value,
              showingMultiviewInfo: showingMultiviewInfo,
              selectSlotDetailsFromBloc: selectSlotDetailsFromBloc,
              chatSettingLinks: chatSettingLinks,
              onOpenMenu: openMenu,
              onActionModeChanged: setActionMode,
              settingsLinks: settingsLinks,
              settingsFirstFocusNode: settingsFirstFocusNode,
              muted: muted,
              multiviewSettingsLinks: multiviewSettingsLinks,
              multiviewDefaultSettingLinks: multiviewDefaultSettingLinks,
              primaryLinks: primaryLinks,
              playbackPaused: playbackPaused,
            ),
            ?activeMenuPanel,
          ],
        ),
      ),
    );
  }
}
