import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/tv/focus/focus.dart';
import '../../../player_shared/presentation/overlay_controls/overlay_controls.dart';
import '../../../settings/domain/entities/settings_preferences.dart';
import '../../../settings/presentation/widgets/player_chat_settings_overlay.dart';
import '../../../vod/domain/entities/vod_detail.dart';
import '../../../vod/domain/entities/vod_playback.dart';
import '../bloc/vod_player_bloc.dart';
import '../vod_player_screen_ui_mapper.dart';
import 'tv_vod_overlay_playback_info.dart';
import 'vod_player_chapter_panel.dart';
import 'vod_player_controls_overlay_design.dart';
import 'vod_player_overlay_actions.dart';
import 'vod_player_overlay_chat_mode_menu.dart';
import 'vod_player_overlay_favorite_menus.dart';
import 'vod_player_overlay_resolution_menu.dart';
import 'vod_player_overlay_settings_menus.dart';
import 'vod_player_playback_helpers.dart';
import 'vod_player_playback_snapshot.dart';

part 'vod_player_controls_overlay_mappers.dart';
part 'vod_player_controls_overlay_menus.dart';
part 'vod_player_controls_overlay_menu_host.dart';
part 'vod_player_controls_overlay_models.dart';
part 'vod_player_controls_overlay_content.dart';
part 'vod_player_controls_overlay_playback_info.dart';

class VodPlayerControlsOverlay extends HookWidget {
  const VodPlayerControlsOverlay({
    super.key,
    required this.state,
    required this.controlsNode,
    required this.playbackPaused,
    required this.muted,
    required this.onPlaybackPausedChanged,
    required this.onMutedChanged,
    required this.onSeek,
    required this.onInteraction,
    required this.modalDismissSerial,
    required this.onModalVisibilityChanged,
    this.playbackSnapshot,
    this.onSeekFeedback,
  });

  final VodPlayerState state;
  final FocusScopeNode controlsNode;
  final bool playbackPaused;
  final bool muted;
  final ValueChanged<bool> onPlaybackPausedChanged;
  final ValueChanged<bool> onMutedChanged;
  final ValueChanged<Duration> onSeek;
  final VodPlayerPlaybackSnapshotListenable? playbackSnapshot;
  final VoidCallback onInteraction;
  final int modalDismissSerial;
  final ValueChanged<bool> onModalVisibilityChanged;
  final TvVodOverlaySeekFeedbackCallback? onSeekFeedback;

  @override
  Widget build(BuildContext context) {
    final actionMode = useState(_VodOverlayActionMode.primary);
    final activeMenu = useState(_VodOverlayMenu.none);
    final activeChatSettingIndex = useState<int?>(null);
    final primaryLinks = useMemoized(VodOverlayPrimaryLinks.new);
    final settingsLinks = useMemoized(VodOverlaySettingsLinks.new);
    final actionsSectionNode = useFocusScopeNode(
      debugLabel: 'vod player overlay actions section',
    );
    final seekSectionNode = useFocusScopeNode(
      debugLabel: 'vod player overlay seek section',
    );
    final settingsFirstFocusNode = useFocusNode(
      debugLabel: 'vod player settings first action',
    );
    final lastModalDismissSerial = useRef(modalDismissSerial);
    final chatSettingLinks = useMemoized(
      () => [
        for (var index = 0; index < playerChatSettingsCount; index += 1)
          LayerLink(),
      ],
    );

    void closeMenu({bool notify = true}) {
      final wasOpen = activeMenu.value != _VodOverlayMenu.none;
      activeMenu.value = _VodOverlayMenu.none;
      activeChatSettingIndex.value = null;
      if (wasOpen && notify) {
        onModalVisibilityChanged(false);
      }
    }

    void openMenu(
      _VodOverlayMenu menu, {
      int? chatSettingIndex,
    }) {
      onInteraction();
      activeMenu.value = menu;
      activeChatSettingIndex.value = chatSettingIndex;
      onModalVisibilityChanged(true);
    }

    void setActionMode(_VodOverlayActionMode mode) {
      onInteraction();
      closeMenu();
      actionMode.value = mode;
    }

    useEffect(() {
      if (lastModalDismissSerial.value != modalDismissSerial) {
        lastModalDismissSerial.value = modalDismissSerial;
        closeMenu(notify: false);
      }

      return null;
    }, [modalDismissSerial]);

    useEffect(() {
      if (actionMode.value == _VodOverlayActionMode.settings) {
        settingsFirstFocusNode.requestFocus();
      }

      return null;
    }, [actionMode.value]);

    final slot = state.activeSlot;
    final seekChapters = useMemoized(
      () => _seekChapters(slot.chapters),
      [slot.chapters],
    );
    final seekThumbnail = useMemoized(
      () => _seekThumbnail(slot.seekThumbnail),
      [slot.seekThumbnail],
    );
    final duration = Duration(seconds: slot.durationSeconds);
    final fallbackPlaybackSnapshot = useMemoized(
      () => ValueNotifier(vodPlayerPlaybackSnapshotForSlot(slot)),
      [
        slot.slotId,
        slot.videoNo,
        slot.playbackUri,
        slot.position,
        slot.duration,
        slot.durationSeconds,
      ],
    );
    useEffect(
      () => fallbackPlaybackSnapshot.dispose,
      [fallbackPlaybackSnapshot],
    );
    final playbackSnapshot = this.playbackSnapshot ?? fallbackPlaybackSnapshot;

    void updatePreferences(SettingsPreferences preferences) {
      onInteraction();
      final bloc = context.read<VodPlayerBloc>();
      if (preferences.vodSettings.resolutionIndex !=
          state.settingsPreferences.vodSettings.resolutionIndex) {
        final playbackUri = slot.playbackUri;
        if (playbackUri != null) {
          final snapshot = playbackSnapshot.value;
          bloc.add(
            VodPlayerEvent.playbackPositionChanged(
              slotId: slot.slotId,
              playbackUri: playbackUri,
              position: snapshot.position,
              duration: vodPlayerSnapshotDurationForSlot(slot, snapshot),
            ),
          );
        }
      }

      bloc.add(
        VodPlayerEvent.preferencesChanged(preferences: preferences),
      );
    }

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
            _vodPlayerControlsMainSurface(
              state: state,
              slot: slot,
              actionMode: actionMode.value,
              chatSettingLinks: chatSettingLinks,
              onOpenMenu: openMenu,
              onActionModeChanged: setActionMode,
              actionsSectionNode: actionsSectionNode,
              seekSectionNode: seekSectionNode,
              settingsLinks: settingsLinks,
              settingsFirstFocusNode: settingsFirstFocusNode,
              muted: muted,
              primaryLinks: primaryLinks,
              playbackPaused: playbackPaused,
              onPlaybackPausedChanged: onPlaybackPausedChanged,
              playbackSnapshot: playbackSnapshot,
              duration: duration,
              seekChapters: seekChapters,
              seekThumbnail: seekThumbnail,
              onSeek: onSeek,
              onSeekFeedback: onSeekFeedback,
              onInteraction: onInteraction,
            ),
            _VodPlayerControlsOverlayMenuHost(
              state: state,
              slot: slot,
              playbackSnapshot: playbackSnapshot,
              activeMenu: activeMenu.value,
              activeChatSettingIndex: activeChatSettingIndex.value,
              primaryLinks: primaryLinks,
              settingsLinks: settingsLinks,
              chatSettingLinks: chatSettingLinks,
              muted: muted,
              onMutedChanged: onMutedChanged,
              onSeek: onSeek,
              onInteraction: onInteraction,
              onCloseMenu: closeMenu,
              onOpenMenu: openMenu,
              onPreferencesChanged: updatePreferences,
            ),
          ],
        ),
      ),
    );
  }
}
