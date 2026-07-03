// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:unofficial_chzzk_android_tv/src/app/router/app_routes.dart';
import 'package:unofficial_chzzk_android_tv/src/core/assets/app_asset_paths.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/entities/category_info.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/entities/category_item.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/entities/category_live.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/entities/category_page.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/entities/category_video.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/repositories/category_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/entities/channel_detail.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/entities/channel_my_info.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/entities/channel_video.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/repositories/channel_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/chat/domain/entities/chat.dart';
import 'package:unofficial_chzzk_android_tv/src/features/chat/domain/repositories/chat_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/chat/presentation/player_chat.dart';
import 'package:unofficial_chzzk_android_tv/src/features/following/domain/entities/following_feed.dart';
import 'package:unofficial_chzzk_android_tv/src/features/following/domain/entities/following_sort.dart';
import 'package:unofficial_chzzk_android_tv/src/features/following/domain/repositories/following_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/group/domain/entities/group_collection.dart';
import 'package:unofficial_chzzk_android_tv/src/features/group/domain/repositories/group_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_detail.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_feed.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_sort.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_status.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/repositories/live_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live_player/presentation/bloc/live_player_bloc.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live_player/presentation/live_player_route_target.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live_player/presentation/live_player_screen_design.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live_player/presentation/live_player_screen_string.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live_player/presentation/view/live_player_multiview_chat_policy.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live_player/presentation/view/live_player_playback_session_controller.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live_player/presentation/view/live_player_status_surface.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live_player/presentation/view/live_player_view.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/domain/entities/settings_preferences.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/domain/repositories/settings_preferences_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_sort.dart';
import 'package:video_player_platform_interface/video_player_platform_interface.dart';

void main() {
  test(
    'playback session controller suspends handles registered after exit',
    () {
      final controller = LivePlayerPlaybackSessionController();
      var firstSuspendCount = 0;
      var lateSuspendCount = 0;

      controller
        ..register(
          LivePlayerPlaybackSessionHandle(() {
            firstSuspendCount += 1;
          }),
        )
        ..suspendAll()
        ..register(
          LivePlayerPlaybackSessionHandle(() {
            lateSuspendCount += 1;
          }),
        );

      expect(firstSuspendCount, 1);
      expect(lateSuspendCount, 1);
    },
  );

  testWidgets('down toggles overlay chat when the initial setting is hidden', (
    tester,
  ) async {
    final bloc = await _pumpLivePlayer(tester);

    await _sendKeyAndWait(
      tester,
      LogicalKeyboardKey.arrowDown,
      until: () =>
          bloc.state.settingsPreferences.liveSettings.chatWindowIndex == 1,
    );
    await _sendKeyAndWait(
      tester,
      LogicalKeyboardKey.arrowDown,
      until: () =>
          bloc.state.settingsPreferences.liveSettings.chatWindowIndex == 0,
    );
    await _sendKeyAndWait(
      tester,
      LogicalKeyboardKey.arrowDown,
      until: () =>
          bloc.state.settingsPreferences.liveSettings.chatWindowIndex == 1,
    );
  });

  testWidgets('down restores the last visible side chat mode', (tester) async {
    final bloc = await _pumpLivePlayer(
      tester,
      preferences: const SettingsPreferences(
        liveSettings: LiveSettings(chatWindowIndex: 2),
      ),
    );

    await _sendKeyAndWait(
      tester,
      LogicalKeyboardKey.arrowDown,
      until: () =>
          bloc.state.settingsPreferences.liveSettings.chatWindowIndex == 0,
    );
    await _sendKeyAndWait(
      tester,
      LogicalKeyboardKey.arrowDown,
      until: () =>
          bloc.state.settingsPreferences.liveSettings.chatWindowIndex == 2,
    );
  });

  testWidgets('left and right cycle overlay chat position presets', (
    tester,
  ) async {
    final bloc = await _pumpLivePlayer(
      tester,
      preferences: const SettingsPreferences(
        liveSettings: LiveSettings(chatWindowIndex: 1),
      ),
    );

    await _sendKeyAndWait(
      tester,
      LogicalKeyboardKey.arrowRight,
      until: () =>
          bloc.state.settingsPreferences.chatSettings.overlayChatPositionX ==
              0 &&
          bloc.state.settingsPreferences.chatSettings.overlayChatPositionY ==
              100 &&
          bloc
                  .state
                  .settingsPreferences
                  .chatSettings
                  .overlayChatQuickPositionIndex ==
              6,
    );
    await _sendKeyAndWait(
      tester,
      LogicalKeyboardKey.arrowLeft,
      until: () =>
          bloc.state.settingsPreferences.chatSettings.overlayChatPositionX ==
              100 &&
          bloc.state.settingsPreferences.chatSettings.overlayChatPositionY ==
              50 &&
          bloc
                  .state
                  .settingsPreferences
                  .chatSettings
                  .overlayChatQuickPositionIndex ==
              5,
    );
  });

  testWidgets('left and right move side chat between sides', (tester) async {
    final bloc = await _pumpLivePlayer(
      tester,
      preferences: const SettingsPreferences(
        liveSettings: LiveSettings(chatWindowIndex: 2),
      ),
    );

    await _sendKeyAndWait(
      tester,
      LogicalKeyboardKey.arrowLeft,
      until: () =>
          bloc.state.settingsPreferences.chatSettings.chatSidePanelPositionX ==
              0 &&
          bloc.state.settingsPreferences.chatSettings.sideChatPositionIndex ==
              0,
    );
    await _sendKeyAndWait(
      tester,
      LogicalKeyboardKey.arrowRight,
      until: () =>
          bloc.state.settingsPreferences.chatSettings.chatSidePanelPositionX ==
              100 &&
          bloc.state.settingsPreferences.chatSettings.sideChatPositionIndex ==
              1,
    );
  });

  testWidgets('multiview PBP shows overlay chat when enabled', (
    tester,
  ) async {
    final bloc = await _pumpLivePlayer(
      tester,
      preferences: const SettingsPreferences(
        liveSettings: LiveSettings(multiviewChatWindowIndex: 1),
      ),
    );
    final videoPlatform =
        VideoPlayerPlatform.instance as _FakeVideoPlayerPlatform;

    await _pumpUntil(
      tester,
      until: () =>
          bloc.state.activeSlot.status == LivePlayerSlotStatus.playing &&
          bloc.state.activeSlot.playbackUri != null,
    );

    bloc.add(
      const LivePlayerEvent.viewModeSelected(
        viewMode: LivePlayerViewMode.multiview,
      ),
    );
    await _pumpUntil(tester, until: () => bloc.state.isMultiview);
    await _pumpUntil(
      tester,
      until: () => videoPlatform.mixWithOthersValues.contains(true),
    );

    expect(videoPlatform.mixWithOthersValues.last, isTrue);
    expect(find.text(PlayerChatString.loading), findsOneWidget);
  });

  test('multiview chat policy coerces unsupported side chat to overlay', () {
    final pbpTwoSlotState = _multiviewChatPolicyState(
      mode: LivePlayerMultiviewLayoutMode.pbp,
      slotCount: 2,
      chatWindowIndex: 2,
    );

    expect(
      livePlayerEffectiveChatPresentationMode(pbpTwoSlotState),
      PlayerChatPresentationMode.sidePanel,
    );
    expect(
      livePlayerEffectiveChatPresentationMode(
        pbpTwoSlotState.copyWith(
          multiviewLayoutMode: LivePlayerMultiviewLayoutMode.pip,
        ),
      ),
      PlayerChatPresentationMode.overlay,
    );
    expect(
      livePlayerEffectiveChatPresentationMode(
        _multiviewChatPolicyState(
          mode: LivePlayerMultiviewLayoutMode.pbp,
          slotCount: 3,
          chatWindowIndex: 2,
        ),
      ),
      PlayerChatPresentationMode.overlay,
    );
    expect(
      livePlayerEffectiveChatPresentationMode(
        _multiviewChatPolicyState(
          mode: LivePlayerMultiviewLayoutMode.focus,
          slotCount: 2,
          chatWindowIndex: 1,
        ),
      ),
      PlayerChatPresentationMode.sidePanel,
    );
  });

  testWidgets('multiview PBP side chat stacks two slots beside chat only', (
    tester,
  ) async {
    final bloc = await _pumpLivePlayer(
      tester,
      preferences: const SettingsPreferences(
        liveSettings: LiveSettings(
          multiviewMaxCount: 4,
          multiviewChatWindowIndex: 2,
        ),
        chatSettings: ChatSettings(
          chatSidePanelWidth: 30,
          chatSidePanelPositionX: 100,
          sideChatPositionIndex: 1,
        ),
      ),
      liveRepository: _FakeLiveRepository(
        detailsByChannelId: {
          'channel-b': _liveDetailForChannel(
            liveId: 2,
            channelId: 'channel-b',
            channelName: 'Channel B',
          ),
          'channel-c': _liveDetailForChannel(
            liveId: 3,
            channelId: 'channel-c',
            channelName: 'Channel C',
          ),
        },
      ),
    );

    await _pumpUntil(
      tester,
      until: () =>
          bloc.state.activeSlot.status == LivePlayerSlotStatus.playing &&
          bloc.state.activeSlot.playbackUri != null,
    );

    bloc.add(
      const LivePlayerEvent.viewModeSelected(
        viewMode: LivePlayerViewMode.multiview,
      ),
    );
    await _pumpUntil(tester, until: () => bloc.state.isMultiview);
    await _addMultiviewLive(
      tester,
      bloc,
      slotId: 'slot-1',
      live: _liveForChannel(
        liveId: 2,
        channelId: 'channel-b',
        channelName: 'Channel B',
      ),
    );
    await tester.pump();

    _expectRect(
      _playbackSlotRect(tester, 'primary'),
      const Rect.fromLTWH(0, 0, 672, 270),
    );
    _expectRect(
      _playbackSlotRect(tester, 'slot-1'),
      const Rect.fromLTWH(0, 270, 672, 270),
    );
    expect(find.text(PlayerChatString.loading), findsOneWidget);

    await _addMultiviewLive(
      tester,
      bloc,
      slotId: 'slot-2',
      live: _liveForChannel(
        liveId: 3,
        channelId: 'channel-c',
        channelName: 'Channel C',
      ),
    );
    await tester.pump();

    _expectRect(
      _playbackSlotRect(tester, 'primary'),
      const Rect.fromLTWH(0, 0, 480, 270),
    );
    _expectRect(
      _playbackSlotRect(tester, 'slot-1'),
      const Rect.fromLTWH(480, 0, 480, 270),
    );
    _expectRect(
      _playbackSlotRect(tester, 'slot-2'),
      const Rect.fromLTWH(0, 270, 480, 270),
    );
  });

  testWidgets('multiview focus uses full-height side chat up to three slots', (
    tester,
  ) async {
    final bloc = await _pumpLivePlayer(
      tester,
      preferences: const SettingsPreferences(
        liveSettings: LiveSettings(
          multiviewMaxCount: 4,
          multiviewChatWindowIndex: 1,
        ),
        chatSettings: ChatSettings(
          chatSidePanelWidth: 50,
          chatSidePanelPositionX: 0,
          sideChatPositionIndex: 0,
        ),
      ),
      liveRepository: _FakeLiveRepository(
        detailsByChannelId: {
          'channel-b': _liveDetailForChannel(
            liveId: 2,
            channelId: 'channel-b',
            channelName: 'Channel B',
          ),
          'channel-c': _liveDetailForChannel(
            liveId: 3,
            channelId: 'channel-c',
            channelName: 'Channel C',
          ),
        },
      ),
    );

    await _pumpUntil(
      tester,
      until: () =>
          bloc.state.activeSlot.status == LivePlayerSlotStatus.playing &&
          bloc.state.activeSlot.playbackUri != null,
    );

    bloc.add(
      const LivePlayerEvent.viewModeSelected(
        viewMode: LivePlayerViewMode.multiview,
      ),
    );
    await _pumpUntil(tester, until: () => bloc.state.isMultiview);
    await _addMultiviewLive(
      tester,
      bloc,
      slotId: 'slot-1',
      live: _liveForChannel(
        liveId: 2,
        channelId: 'channel-b',
        channelName: 'Channel B',
      ),
    );
    await _addMultiviewLive(
      tester,
      bloc,
      slotId: 'slot-2',
      live: _liveForChannel(
        liveId: 3,
        channelId: 'channel-c',
        channelName: 'Channel C',
      ),
    );
    bloc.add(
      const LivePlayerEvent.multiviewLayoutModeSelected(
        layoutMode: LivePlayerMultiviewLayoutMode.focus,
      ),
    );
    await _pumpUntil(
      tester,
      until: () =>
          bloc.state.multiviewLayoutMode == LivePlayerMultiviewLayoutMode.focus,
    );
    await tester.pump();

    _expectRect(
      _playbackSlotRect(tester, 'primary'),
      const Rect.fromLTWH(320, 0, 640, 360),
    );
    _expectRect(
      _playbackSlotRect(tester, 'slot-1'),
      const Rect.fromLTWH(640, 360, 320, 180),
    );
    _expectRect(
      _playbackSlotRect(tester, 'slot-2'),
      const Rect.fromLTWH(320, 360, 320, 180),
    );
    _expectRect(
      _chatLayerRect(tester, channelId: 'channel-a', chatChannelId: 'chat-a'),
      const Rect.fromLTWH(0, 0, 320, 540),
    );
    expect(find.text(PlayerChatString.loading), findsOneWidget);
  });

  testWidgets('multiview focus keeps legacy chat height at four slots', (
    tester,
  ) async {
    final bloc = await _pumpLivePlayer(
      tester,
      preferences: const SettingsPreferences(
        liveSettings: LiveSettings(
          multiviewMaxCount: 4,
          multiviewChatWindowIndex: 1,
        ),
        chatSettings: ChatSettings(
          chatSidePanelWidth: 50,
          chatSidePanelPositionX: 0,
          sideChatPositionIndex: 0,
        ),
      ),
      liveRepository: _FakeLiveRepository(
        detailsByChannelId: {
          'channel-b': _liveDetailForChannel(
            liveId: 2,
            channelId: 'channel-b',
            channelName: 'Channel B',
          ),
          'channel-c': _liveDetailForChannel(
            liveId: 3,
            channelId: 'channel-c',
            channelName: 'Channel C',
          ),
          'channel-d': _liveDetailForChannel(
            liveId: 4,
            channelId: 'channel-d',
            channelName: 'Channel D',
          ),
        },
      ),
    );

    await _pumpUntil(
      tester,
      until: () =>
          bloc.state.activeSlot.status == LivePlayerSlotStatus.playing &&
          bloc.state.activeSlot.playbackUri != null,
    );

    bloc.add(
      const LivePlayerEvent.viewModeSelected(
        viewMode: LivePlayerViewMode.multiview,
      ),
    );
    await _pumpUntil(tester, until: () => bloc.state.isMultiview);
    await _addMultiviewLive(
      tester,
      bloc,
      slotId: 'slot-1',
      live: _liveForChannel(
        liveId: 2,
        channelId: 'channel-b',
        channelName: 'Channel B',
      ),
    );
    await _addMultiviewLive(
      tester,
      bloc,
      slotId: 'slot-2',
      live: _liveForChannel(
        liveId: 3,
        channelId: 'channel-c',
        channelName: 'Channel C',
      ),
    );
    await _addMultiviewLive(
      tester,
      bloc,
      slotId: 'slot-3',
      live: _liveForChannel(
        liveId: 4,
        channelId: 'channel-d',
        channelName: 'Channel D',
      ),
    );
    bloc.add(
      const LivePlayerEvent.multiviewLayoutModeSelected(
        layoutMode: LivePlayerMultiviewLayoutMode.focus,
      ),
    );
    await _pumpUntil(
      tester,
      until: () =>
          bloc.state.multiviewLayoutMode == LivePlayerMultiviewLayoutMode.focus,
    );
    await tester.pump();

    _expectRect(
      _playbackSlotRect(tester, 'primary'),
      const Rect.fromLTWH(320, 0, 640, 360),
    );
    _expectRect(
      _playbackSlotRect(tester, 'slot-1'),
      const Rect.fromLTWH(640, 360, 320, 180),
    );
    _expectRect(
      _playbackSlotRect(tester, 'slot-2'),
      const Rect.fromLTWH(320, 360, 320, 180),
    );
    _expectRect(
      _playbackSlotRect(tester, 'slot-3'),
      const Rect.fromLTWH(0, 360, 320, 180),
    );
    _expectRect(
      _chatLayerRect(tester, channelId: 'channel-a', chatChannelId: 'chat-a'),
      const Rect.fromLTWH(0, 0, 320, 360),
    );
  });

  testWidgets('multiview default screen down cycles layout mode', (
    tester,
  ) async {
    final bloc = await _pumpLivePlayer(tester);

    await _pumpUntil(
      tester,
      until: () =>
          bloc.state.activeSlot.status == LivePlayerSlotStatus.playing &&
          bloc.state.activeSlot.playbackUri != null,
    );

    bloc.add(
      const LivePlayerEvent.viewModeSelected(
        viewMode: LivePlayerViewMode.multiview,
      ),
    );
    await _pumpUntil(tester, until: () => bloc.state.isMultiview);
    expect(bloc.state.multiviewLayoutMode, LivePlayerMultiviewLayoutMode.pbp);

    await _sendKeyAndWait(
      tester,
      LogicalKeyboardKey.arrowDown,
      until: () =>
          bloc.state.multiviewLayoutMode == LivePlayerMultiviewLayoutMode.pip,
    );
    await _sendKeyAndWait(
      tester,
      LogicalKeyboardKey.arrowDown,
      until: () =>
          bloc.state.multiviewLayoutMode == LivePlayerMultiviewLayoutMode.focus,
    );
    await _sendKeyAndWait(
      tester,
      LogicalKeyboardKey.arrowDown,
      until: () =>
          bloc.state.multiviewLayoutMode == LivePlayerMultiviewLayoutMode.pbp,
    );
  });

  testWidgets('single and multiview transitions keep primary player stable', (
    tester,
  ) async {
    final bloc = await _pumpLivePlayer(tester);
    final videoPlatform =
        VideoPlayerPlatform.instance as _FakeVideoPlayerPlatform;

    await _pumpUntil(
      tester,
      until: () =>
          bloc.state.activeSlot.status == LivePlayerSlotStatus.playing &&
          bloc.state.activeSlot.playbackUri != null,
    );
    await _pumpUntil(
      tester,
      until: () => videoPlatform.mixWithOthersValues.isNotEmpty,
    );

    final playbackUri = bloc.state.activeSlot.playbackUri!.toString();
    final singlePlayerId = videoPlatform.latestPlayerIdForUri(playbackUri);
    expect(singlePlayerId, isNotNull);
    expect(videoPlatform.mixWithOthersValues.last, isTrue);

    bloc.add(
      const LivePlayerEvent.viewModeSelected(
        viewMode: LivePlayerViewMode.multiview,
      ),
    );
    await _pumpUntil(tester, until: () => bloc.state.isMultiview);
    await tester.pump();
    expect(videoPlatform.latestPlayerIdForUri(playbackUri), singlePlayerId);

    bloc.add(
      const LivePlayerEvent.viewModeSelected(
        viewMode: LivePlayerViewMode.single,
      ),
    );
    await _pumpUntil(
      tester,
      until: () => bloc.state.viewMode == LivePlayerViewMode.single,
    );
    await tester.pump();
    expect(videoPlatform.latestPlayerIdForUri(playbackUri), singlePlayerId);
  });

  testWidgets('live video buffering indicator ignores short buffering blips', (
    tester,
  ) async {
    final bloc = await _pumpLivePlayer(tester);
    final videoPlatform =
        VideoPlayerPlatform.instance as _FakeVideoPlayerPlatform;

    await _pumpUntil(
      tester,
      until: () =>
          bloc.state.activeSlot.status == LivePlayerSlotStatus.playing &&
          bloc.state.activeSlot.playbackUri != null,
    );

    final playbackUri = bloc.state.activeSlot.playbackUri!.toString();
    final playerId = videoPlatform.latestPlayerIdForUri(playbackUri);
    expect(playerId, isNotNull);
    expect(find.byType(LivePlayerLoadingIndicator), findsNothing);

    videoPlatform.emitBufferingStart(playerId!);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 1999));
    expect(find.byType(LivePlayerLoadingIndicator), findsNothing);

    videoPlatform.emitBufferingEnd(playerId);
    await tester.pump();
    expect(find.byType(LivePlayerLoadingIndicator), findsNothing);

    videoPlatform.emitBufferingStart(playerId);
    await tester.pump();
    await tester.pump(const Duration(seconds: 2));
    expect(find.byType(LivePlayerLoadingIndicator), findsOneWidget);

    videoPlatform.emitBufferingEnd(playerId);
    await tester.pump();
    await tester.pump();
    expect(find.byType(LivePlayerLoadingIndicator), findsNothing);
  });

  testWidgets('multiview starts additional video players one at a time', (
    tester,
  ) async {
    const channelBUri = 'https://example.com/channel-b.m3u8';
    const channelCUri = 'https://example.com/channel-c.m3u8';
    final bloc = await _pumpLivePlayer(
      tester,
      preferences: const SettingsPreferences(
        liveSettings: LiveSettings(multiviewMaxCount: 4),
      ),
      liveRepository: _FakeLiveRepository(
        detailsByChannelId: {
          'channel-b': _liveDetailForChannel(
            liveId: 2,
            channelId: 'channel-b',
            channelName: 'Channel B',
          ),
          'channel-c': _liveDetailForChannel(
            liveId: 3,
            channelId: 'channel-c',
            channelName: 'Channel C',
          ),
        },
      ),
    );
    final videoPlatform =
        VideoPlayerPlatform.instance as _FakeVideoPlayerPlatform;

    await _pumpUntil(
      tester,
      until: () =>
          bloc.state.activeSlot.status == LivePlayerSlotStatus.playing &&
          bloc.state.activeSlot.playbackUri != null,
    );
    videoPlatform.delayInitializationForUri(channelBUri);

    bloc.add(
      const LivePlayerEvent.viewModeSelected(
        viewMode: LivePlayerViewMode.multiview,
      ),
    );
    await _pumpUntil(tester, until: () => bloc.state.isMultiview);
    bloc.add(
      LivePlayerEvent.browseLiveSelected(
        live: _liveForChannel(
          liveId: 2,
          channelId: 'channel-b',
          channelName: 'Channel B',
        ),
      ),
    );
    await _pumpUntil(
      tester,
      until: () =>
          bloc.state.slotById('slot-1')?.status == LivePlayerSlotStatus.ready,
    );
    await _pumpUntil(
      tester,
      until: () => videoPlatform.latestPlayerIdForUri(channelBUri) != null,
    );

    bloc.add(
      LivePlayerEvent.browseLiveSelected(
        live: _liveForChannel(
          liveId: 3,
          channelId: 'channel-c',
          channelName: 'Channel C',
        ),
      ),
    );
    await _pumpUntil(
      tester,
      until: () =>
          bloc.state.slotById('slot-2')?.status == LivePlayerSlotStatus.ready,
    );
    await tester.pump();

    expect(videoPlatform.latestPlayerIdForUri(channelCUri), isNull);

    videoPlatform.completeInitializationForUri(channelBUri);
    await _pumpUntil(
      tester,
      until: () =>
          bloc.state.slotById('slot-1')?.status == LivePlayerSlotStatus.playing,
    );
    await _pumpUntil(
      tester,
      until: () => videoPlatform.latestPlayerIdForUri(channelCUri) != null,
    );
    await _pumpUntil(
      tester,
      until: () =>
          bloc.state.slotById('slot-2')?.status == LivePlayerSlotStatus.playing,
    );
  });

  testWidgets('back exit suspends video controllers before route leaves', (
    tester,
  ) async {
    final bloc = await _pumpRoutedLivePlayer(tester);
    final videoPlatform =
        VideoPlayerPlatform.instance as _FakeVideoPlayerPlatform;

    await _pumpUntil(
      tester,
      until: () =>
          bloc.state.activeSlot.status == LivePlayerSlotStatus.playing &&
          bloc.state.activeSlot.playbackUri != null,
    );
    final playbackUri = bloc.state.activeSlot.playbackUri!.toString();
    final playerId = videoPlatform.latestPlayerIdForUri(playbackUri);
    expect(playerId, isNotNull);

    videoPlatform.playerCalls.clear();
    await tester.binding.handlePopRoute();
    await tester.pump();
    await tester.binding.handlePopRoute();
    await tester.pump();
    await tester.pumpAndSettle();
    await tester.pump(const Duration(milliseconds: 100));
    await tester.runAsync(() async {
      await Future<void>.delayed(Duration.zero);
    });
    await tester.idle();

    expect(find.text(_homeRouteLabel), findsOneWidget);
    final calls = videoPlatform.callsForPlayer(playerId!);
    expect(calls, contains('setVolume:0.0'));
    expect(calls, contains('pause'));
    expect(calls, contains('dispose'));
    expect(calls.indexOf('setVolume:0.0'), lessThan(calls.indexOf('dispose')));
    expect(calls.indexOf('pause'), lessThan(calls.indexOf('dispose')));
  });

  testWidgets(
    'back exit while multiview slot is initializing prevents later playback',
    (tester) async {
      const channelBUri = 'https://example.com/channel-b.m3u8';
      final bloc = await _pumpRoutedLivePlayer(
        tester,
        preferences: const SettingsPreferences(
          liveSettings: LiveSettings(multiviewMaxCount: 4),
        ),
        liveRepository: _FakeLiveRepository(
          detailsByChannelId: {
            'channel-b': _liveDetailForChannel(
              liveId: 2,
              channelId: 'channel-b',
              channelName: 'Channel B',
            ),
          },
        ),
      );
      final videoPlatform =
          VideoPlayerPlatform.instance as _FakeVideoPlayerPlatform;

      await _pumpUntil(
        tester,
        until: () =>
            bloc.state.activeSlot.status == LivePlayerSlotStatus.playing &&
            bloc.state.activeSlot.playbackUri != null,
      );
      videoPlatform.delayInitializationForUri(channelBUri);

      bloc.add(
        const LivePlayerEvent.viewModeSelected(
          viewMode: LivePlayerViewMode.multiview,
        ),
      );
      await _pumpUntil(tester, until: () => bloc.state.isMultiview);
      bloc.add(
        LivePlayerEvent.browseLiveSelected(
          live: _liveForChannel(
            liveId: 2,
            channelId: 'channel-b',
            channelName: 'Channel B',
          ),
        ),
      );
      await _pumpUntil(
        tester,
        until: () =>
            bloc.state.slotById('slot-1')?.status == LivePlayerSlotStatus.ready,
      );
      await _pumpUntil(
        tester,
        until: () => videoPlatform.latestPlayerIdForUri(channelBUri) != null,
      );
      final loadingPlayerId = videoPlatform.latestPlayerIdForUri(channelBUri);
      expect(loadingPlayerId, isNotNull);

      videoPlatform.playerCalls.clear();
      await tester.binding.handlePopRoute();
      await tester.pump();
      await tester.binding.handlePopRoute();
      await tester.pump();
      await tester.pumpAndSettle();

      videoPlatform.completeInitializationForUri(channelBUri);
      await tester.pump(const Duration(milliseconds: 100));
      await tester.runAsync(() async {
        await Future<void>.delayed(Duration.zero);
      });
      await tester.idle();

      expect(find.text(_homeRouteLabel), findsOneWidget);
      final calls = videoPlatform.callsForPlayer(loadingPlayerId!);
      expect(calls, contains('dispose'));
      expect(calls, isNot(contains('play')));
    },
  );

  testWidgets('multiview slot update keeps unchanged slot video view stable', (
    tester,
  ) async {
    final bloc = await _pumpLivePlayer(
      tester,
      liveRepository: const _FakeLiveRepository(
        detailsByChannelId: {
          'channel-b': LiveDetail(
            liveId: 2,
            title: 'Channel B live',
            status: 'OPEN',
            concurrentUserCount: 20,
            adult: false,
            chatChannelId: 'chat-b',
            livePlaybackJson:
                '{"media":[{"mediaId":"HLS","path":"https://example.com/channel-b.m3u8"}]}',
            channel: LiveChannel(
              channelId: 'channel-b',
              channelName: 'Channel B',
              verifiedMark: false,
            ),
          ),
        },
      ),
    );
    final videoPlatform =
        VideoPlayerPlatform.instance as _FakeVideoPlayerPlatform;

    await _pumpUntil(
      tester,
      until: () =>
          bloc.state.activeSlot.status == LivePlayerSlotStatus.playing &&
          bloc.state.activeSlot.playbackUri != null,
    );

    bloc.add(
      const LivePlayerEvent.viewModeSelected(
        viewMode: LivePlayerViewMode.multiview,
      ),
    );
    await _pumpUntil(tester, until: () => bloc.state.isMultiview);
    bloc.add(
      const LivePlayerEvent.browseLiveSelected(
        live: Live(
          liveId: 2,
          title: 'Channel B',
          concurrentUserCount: 20,
          adult: false,
          channel: LiveChannel(
            channelId: 'channel-b',
            channelName: 'Channel B',
            verifiedMark: false,
          ),
        ),
      ),
    );
    await _pumpUntil(
      tester,
      until: () =>
          bloc.state.slotById('slot-1')?.status == LivePlayerSlotStatus.playing,
    );

    final primaryPlayerId = videoPlatform.latestPlayerIdForUri(
      bloc.state.activeSlot.playbackUri.toString(),
    );
    final slot = bloc.state.slotById('slot-1')!;
    final playbackUri = slot.playbackUri!;
    final slotPlayerId = videoPlatform.latestPlayerIdForUri(
      playbackUri.toString(),
    );
    expect(primaryPlayerId, isNotNull);
    expect(slotPlayerId, isNotNull);
    expect(primaryPlayerId, isNot(slotPlayerId));

    await tester.pump();
    videoPlatform.buildViewPlayerIds.clear();
    bloc.add(
      LivePlayerEvent.playbackFailed(
        slotId: slot.slotId,
        playbackUri: playbackUri,
      ),
    );
    await _pumpUntil(
      tester,
      until: () =>
          bloc.state.slotById(slot.slotId)?.status ==
          LivePlayerSlotStatus.failure,
    );

    expect(videoPlatform.buildViewPlayerIds, isNot(contains(primaryPlayerId)));
    expect(find.text(LivePlayerScreenString.playbackFailed), findsNothing);
    expect(find.text(LivePlayerScreenString.retrySelectHint), findsNothing);
    expect(
      find.image(const AssetImage(AppAssetPaths.iconChzzkDark)),
      findsOneWidget,
    );

    bloc.add(const LivePlayerEvent.activeSlotSelected(slotId: 'slot-1'));
    await _pumpUntil(tester, until: () => bloc.state.activeSlotId == 'slot-1');
    await tester.pump();

    expect(find.text(LivePlayerScreenString.playbackFailed), findsOneWidget);
    expect(find.text(LivePlayerScreenString.retrySelectHint), findsOneWidget);
    expect(
      find.image(const AssetImage(AppAssetPaths.iconChzzkDark)),
      findsNothing,
    );
  });

  testWidgets('multiview PIP applies surface type by visual role', (
    tester,
  ) async {
    final bloc = await _pumpLivePlayer(
      tester,
      liveRepository: const _FakeLiveRepository(
        detailsByChannelId: {
          'channel-b': LiveDetail(
            liveId: 2,
            title: 'Channel B live',
            status: 'OPEN',
            concurrentUserCount: 20,
            adult: false,
            chatChannelId: 'chat-b',
            livePlaybackJson:
                '{"media":[{"mediaId":"HLS","path":"https://example.com/channel-b.m3u8"}]}',
            channel: LiveChannel(
              channelId: 'channel-b',
              channelName: 'Channel B',
              verifiedMark: false,
            ),
          ),
        },
      ),
    );
    final videoPlatform =
        VideoPlayerPlatform.instance as _FakeVideoPlayerPlatform;

    await _pumpUntil(
      tester,
      until: () =>
          bloc.state.activeSlot.status == LivePlayerSlotStatus.playing &&
          bloc.state.activeSlot.playbackUri != null,
    );

    bloc.add(
      const LivePlayerEvent.viewModeSelected(
        viewMode: LivePlayerViewMode.multiview,
      ),
    );
    await _pumpUntil(tester, until: () => bloc.state.isMultiview);
    bloc.add(
      const LivePlayerEvent.browseLiveSelected(
        live: Live(
          liveId: 2,
          title: 'Channel B',
          concurrentUserCount: 20,
          adult: false,
          channel: LiveChannel(
            channelId: 'channel-b',
            channelName: 'Channel B',
            verifiedMark: false,
          ),
        ),
      ),
    );
    await _pumpUntil(
      tester,
      until: () =>
          bloc.state.slotById('slot-1')?.status == LivePlayerSlotStatus.playing,
    );

    final primaryUri = bloc.state.slotById('primary')!.playbackUri!.toString();
    final secondaryUri = bloc.state.slotById('slot-1')!.playbackUri!.toString();
    final primaryPlayerId = videoPlatform.latestPlayerIdForUri(primaryUri);
    final secondaryPlayerId = videoPlatform.latestPlayerIdForUri(secondaryUri);
    expect(primaryPlayerId, isNotNull);
    expect(secondaryPlayerId, isNotNull);
    expect(
      videoPlatform.viewTypeForPlayer(primaryPlayerId!),
      VideoViewType.textureView,
    );
    expect(
      videoPlatform.viewTypeForPlayer(secondaryPlayerId!),
      VideoViewType.textureView,
    );

    bloc.add(
      const LivePlayerEvent.multiviewLayoutModeSelected(
        layoutMode: LivePlayerMultiviewLayoutMode.pip,
      ),
    );
    await _pumpUntil(
      tester,
      until: () =>
          bloc.state.multiviewLayoutMode == LivePlayerMultiviewLayoutMode.pip,
    );
    await _pumpUntil(
      tester,
      until: () {
        final playerId = videoPlatform.latestPlayerIdForUri(primaryUri);
        return playerId != null &&
            playerId != primaryPlayerId &&
            videoPlatform.viewTypeForPlayer(playerId) ==
                VideoViewType.platformView;
      },
    );
    final pipPrimaryPlayerId = videoPlatform.latestPlayerIdForUri(primaryUri);
    expect(pipPrimaryPlayerId, isNotNull);
    expect(videoPlatform.latestPlayerIdForUri(secondaryUri), secondaryPlayerId);
    expect(
      videoPlatform.viewTypeForPlayer(secondaryPlayerId),
      VideoViewType.textureView,
    );

    bloc.add(const LivePlayerEvent.activeSlotSelected(slotId: 'slot-1'));
    await _pumpUntil(tester, until: () => bloc.state.activeSlotId == 'slot-1');
    await _pumpUntil(
      tester,
      until: () {
        final primaryId = videoPlatform.latestPlayerIdForUri(primaryUri);
        final secondaryId = videoPlatform.latestPlayerIdForUri(secondaryUri);
        return primaryId != null &&
            secondaryId != null &&
            primaryId != pipPrimaryPlayerId &&
            secondaryId != secondaryPlayerId &&
            videoPlatform.viewTypeForPlayer(primaryId) ==
                VideoViewType.textureView &&
            videoPlatform.viewTypeForPlayer(secondaryId) ==
                VideoViewType.platformView;
      },
    );
    final pipInactivePrimaryPlayerId = videoPlatform.latestPlayerIdForUri(
      primaryUri,
    );
    final pipActiveSecondaryPlayerId = videoPlatform.latestPlayerIdForUri(
      secondaryUri,
    );
    expect(pipInactivePrimaryPlayerId, isNotNull);
    expect(pipActiveSecondaryPlayerId, isNotNull);

    bloc.add(
      const LivePlayerEvent.multiviewLayoutModeSelected(
        layoutMode: LivePlayerMultiviewLayoutMode.focus,
      ),
    );
    await _pumpUntil(
      tester,
      until: () =>
          bloc.state.multiviewLayoutMode == LivePlayerMultiviewLayoutMode.focus,
    );
    await _pumpUntil(
      tester,
      until: () {
        final secondaryId = videoPlatform.latestPlayerIdForUri(secondaryUri);
        return secondaryId != null &&
            secondaryId != pipActiveSecondaryPlayerId &&
            videoPlatform.viewTypeForPlayer(secondaryId) ==
                VideoViewType.textureView;
      },
    );
    final focusPrimaryPlayerId = videoPlatform.latestPlayerIdForUri(
      primaryUri,
    );
    final focusSecondaryPlayerId = videoPlatform.latestPlayerIdForUri(
      secondaryUri,
    );
    expect(focusPrimaryPlayerId, pipInactivePrimaryPlayerId);
    expect(focusSecondaryPlayerId, isNotNull);

    bloc.add(const LivePlayerEvent.activeSlotSelected(slotId: 'primary'));
    await _pumpUntil(tester, until: () => bloc.state.activeSlotId == 'primary');
    await tester.pump();
    expect(
      videoPlatform.latestPlayerIdForUri(primaryUri),
      focusPrimaryPlayerId,
    );
    expect(
      videoPlatform.latestPlayerIdForUri(secondaryUri),
      focusSecondaryPlayerId,
    );

    bloc.add(
      const LivePlayerEvent.multiviewLayoutModeSelected(
        layoutMode: LivePlayerMultiviewLayoutMode.pbp,
      ),
    );
    await _pumpUntil(
      tester,
      until: () =>
          bloc.state.multiviewLayoutMode == LivePlayerMultiviewLayoutMode.pbp,
    );
    await tester.pump();
    expect(
      videoPlatform.latestPlayerIdForUri(primaryUri),
      focusPrimaryPlayerId,
    );
    expect(
      videoPlatform.latestPlayerIdForUri(secondaryUri),
      focusSecondaryPlayerId,
    );
  });

  testWidgets('multiview PIP uses texture views for overlay slots', (
    tester,
  ) async {
    final bloc = await _pumpLivePlayer(
      tester,
      preferences: const SettingsPreferences(
        generalSetting: GeneralSetting(
          videoViewTypeIndex: playerVideoViewTypeIndexMax,
        ),
      ),
      liveRepository: const _FakeLiveRepository(
        detailsByChannelId: {
          'channel-b': LiveDetail(
            liveId: 2,
            title: 'Channel B live',
            status: 'OPEN',
            concurrentUserCount: 20,
            adult: false,
            chatChannelId: 'chat-b',
            livePlaybackJson:
                '{"media":[{"mediaId":"HLS","path":"https://example.com/channel-b.m3u8"}]}',
            channel: LiveChannel(
              channelId: 'channel-b',
              channelName: 'Channel B',
              verifiedMark: false,
            ),
          ),
        },
      ),
    );
    final videoPlatform =
        VideoPlayerPlatform.instance as _FakeVideoPlayerPlatform;

    await _pumpUntil(
      tester,
      until: () =>
          bloc.state.activeSlot.status == LivePlayerSlotStatus.playing &&
          bloc.state.activeSlot.playbackUri != null,
    );

    final primaryUri = bloc.state.activeSlot.playbackUri!.toString();
    final primaryPlayerId = videoPlatform.latestPlayerIdForUri(primaryUri);
    expect(primaryPlayerId, isNotNull);
    expect(
      videoPlatform.viewTypeForPlayer(primaryPlayerId!),
      VideoViewType.platformView,
    );

    bloc.add(
      const LivePlayerEvent.viewModeSelected(
        viewMode: LivePlayerViewMode.multiview,
      ),
    );
    await _pumpUntil(tester, until: () => bloc.state.isMultiview);
    bloc.add(
      const LivePlayerEvent.browseLiveSelected(
        live: Live(
          liveId: 2,
          title: 'Channel B',
          concurrentUserCount: 20,
          adult: false,
          channel: LiveChannel(
            channelId: 'channel-b',
            channelName: 'Channel B',
            verifiedMark: false,
          ),
        ),
      ),
    );
    await _pumpUntil(
      tester,
      until: () =>
          bloc.state.slotById('slot-1')?.status == LivePlayerSlotStatus.playing,
    );

    final pipUri = bloc.state.slotById('slot-1')!.playbackUri!.toString();
    final pbpPlayerId = videoPlatform.latestPlayerIdForUri(pipUri);
    expect(pbpPlayerId, isNotNull);
    expect(
      videoPlatform.viewTypeForPlayer(pbpPlayerId!),
      VideoViewType.platformView,
    );

    bloc.add(
      const LivePlayerEvent.multiviewLayoutModeSelected(
        layoutMode: LivePlayerMultiviewLayoutMode.pip,
      ),
    );
    await _pumpUntil(
      tester,
      until: () =>
          bloc.state.multiviewLayoutMode == LivePlayerMultiviewLayoutMode.pip,
    );

    final pipPlayerId = videoPlatform.latestPlayerIdForUri(pipUri);
    expect(pipPlayerId, isNot(pbpPlayerId));
    expect(
      videoPlatform.viewTypeForPlayer(pipPlayerId!),
      VideoViewType.textureView,
    );
    expect(
      find.ancestor(
        of: find.byKey(ValueKey('fake-video-view-$pipPlayerId')),
        matching: find.byType(ClipRRect),
      ),
      findsNothing,
    );
    expect(videoPlatform.latestPlayerIdForUri(primaryUri), primaryPlayerId);
    expect(
      videoPlatform.viewTypeForPlayer(primaryPlayerId),
      VideoViewType.platformView,
    );

    bloc.add(
      const LivePlayerEvent.multiviewLayoutModeSelected(
        layoutMode: LivePlayerMultiviewLayoutMode.focus,
      ),
    );
    await _pumpUntil(
      tester,
      until: () =>
          bloc.state.multiviewLayoutMode == LivePlayerMultiviewLayoutMode.focus,
    );
    await _pumpUntil(
      tester,
      until: () {
        final focusPlayerId = videoPlatform.latestPlayerIdForUri(pipUri);
        return focusPlayerId != null &&
            focusPlayerId != pipPlayerId &&
            videoPlatform.viewTypeForPlayer(focusPlayerId) ==
                VideoViewType.platformView;
      },
    );
    final focusPlayerId = videoPlatform.latestPlayerIdForUri(pipUri);
    expect(focusPlayerId, isNotNull);

    bloc.add(
      const LivePlayerEvent.multiviewLayoutModeSelected(
        layoutMode: LivePlayerMultiviewLayoutMode.pip,
      ),
    );
    await _pumpUntil(
      tester,
      until: () =>
          bloc.state.multiviewLayoutMode == LivePlayerMultiviewLayoutMode.pip,
    );
    await _pumpUntil(
      tester,
      until: () {
        final nextPipPlayerId = videoPlatform.latestPlayerIdForUri(pipUri);
        return nextPipPlayerId != null &&
            nextPipPlayerId != focusPlayerId &&
            videoPlatform.viewTypeForPlayer(nextPipPlayerId) ==
                VideoViewType.textureView;
      },
    );
    final nextPipPlayerId = videoPlatform.latestPlayerIdForUri(pipUri);
    expect(nextPipPlayerId, isNotNull);

    bloc.add(
      const LivePlayerEvent.multiviewLayoutModeSelected(
        layoutMode: LivePlayerMultiviewLayoutMode.pbp,
      ),
    );
    await _pumpUntil(
      tester,
      until: () =>
          bloc.state.multiviewLayoutMode == LivePlayerMultiviewLayoutMode.pbp,
    );
    await _pumpUntil(
      tester,
      until: () {
        final nextPbpPlayerId = videoPlatform.latestPlayerIdForUri(pipUri);
        return nextPbpPlayerId != null &&
            nextPbpPlayerId != nextPipPlayerId &&
            videoPlatform.viewTypeForPlayer(nextPbpPlayerId) ==
                VideoViewType.platformView;
      },
    );
  });

  testWidgets('multiview PIP stack fits inside the screen with reduced gaps', (
    tester,
  ) async {
    final bloc = await _pumpLivePlayer(
      tester,
      preferences: const SettingsPreferences(
        liveSettings: LiveSettings(
          multiviewMaxCount: 4,
          multiviewPipLayoutIndex: 1,
          multiviewPipPositionX: 100,
          multiviewPipPositionY: 100,
          multiviewPipSize: 33,
        ),
      ),
      liveRepository: _FakeLiveRepository(
        detailsByChannelId: {
          'channel-b': _liveDetailForChannel(
            liveId: 2,
            channelId: 'channel-b',
            channelName: 'Channel B',
          ),
          'channel-c': _liveDetailForChannel(
            liveId: 3,
            channelId: 'channel-c',
            channelName: 'Channel C',
          ),
          'channel-d': _liveDetailForChannel(
            liveId: 4,
            channelId: 'channel-d',
            channelName: 'Channel D',
          ),
        },
      ),
    );
    final videoPlatform =
        VideoPlayerPlatform.instance as _FakeVideoPlayerPlatform;

    await _pumpUntil(
      tester,
      until: () =>
          bloc.state.activeSlot.status == LivePlayerSlotStatus.playing &&
          bloc.state.activeSlot.playbackUri != null,
    );

    bloc.add(
      const LivePlayerEvent.viewModeSelected(
        viewMode: LivePlayerViewMode.multiview,
      ),
    );
    await _pumpUntil(tester, until: () => bloc.state.isMultiview);
    await _addMultiviewLive(
      tester,
      bloc,
      slotId: 'slot-1',
      live: _liveForChannel(
        liveId: 2,
        channelId: 'channel-b',
        channelName: 'Channel B',
      ),
    );
    await _addMultiviewLive(
      tester,
      bloc,
      slotId: 'slot-2',
      live: _liveForChannel(
        liveId: 3,
        channelId: 'channel-c',
        channelName: 'Channel C',
      ),
    );
    await _addMultiviewLive(
      tester,
      bloc,
      slotId: 'slot-3',
      live: _liveForChannel(
        liveId: 4,
        channelId: 'channel-d',
        channelName: 'Channel D',
      ),
    );

    bloc.add(
      const LivePlayerEvent.multiviewLayoutModeSelected(
        layoutMode: LivePlayerMultiviewLayoutMode.pip,
      ),
    );
    await _pumpUntil(
      tester,
      until: () =>
          bloc.state.multiviewLayoutMode == LivePlayerMultiviewLayoutMode.pip,
    );
    await tester.pump();

    final pipRects = [
      for (final slotId in ['slot-1', 'slot-2', 'slot-3'])
        _videoRectForSlot(tester, videoPlatform, bloc.state.slotById(slotId)!),
    ];

    for (final rect in pipRects) {
      expect(rect.left, greaterThanOrEqualTo(0));
      expect(rect.top, greaterThanOrEqualTo(0));
      expect(rect.right, lessThanOrEqualTo(960));
      expect(rect.bottom, lessThanOrEqualTo(540));
    }
    expect(
      pipRects[1].top - pipRects[0].bottom,
      moreOrLessEquals(
        LivePlayerScreenDesign.multiviewPipGap,
        epsilon: 0.01,
      ),
    );
    expect(
      pipRects[2].top - pipRects[1].bottom,
      moreOrLessEquals(
        LivePlayerScreenDesign.multiviewPipGap,
        epsilon: 0.01,
      ),
    );

    final firstPipPlayerId = videoPlatform.latestPlayerIdForUri(
      bloc.state.slotById('slot-1')!.playbackUri!.toString(),
    );
    expect(
      find.ancestor(
        of: find.byKey(ValueKey('fake-video-view-$firstPipPlayerId')),
        matching: find.byType(ClipRRect),
      ),
      findsNothing,
    );
  });
}

Future<LivePlayerBloc> _pumpLivePlayer(
  WidgetTester tester, {
  SettingsPreferences preferences = defaultSettingsPreferences,
  LiveRepository liveRepository = const _FakeLiveRepository(),
}) async {
  tester.view.physicalSize = const Size(960, 540);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
  final previousVideoPlayerPlatform = VideoPlayerPlatform.instance;
  final fakeVideoPlayerPlatform = _FakeVideoPlayerPlatform();
  VideoPlayerPlatform.instance = fakeVideoPlayerPlatform;
  addTearDown(() async {
    VideoPlayerPlatform.instance = previousVideoPlayerPlatform;
    await fakeVideoPlayerPlatform.disposeAll();
  });

  final settingsRepository = _FakeSettingsPreferencesRepository(preferences);
  final bloc = LivePlayerBloc(
    liveRepository: liveRepository,
    channelRepository: const _FakeChannelRepository(),
    followingRepository: const _FakeFollowingRepository(),
    categoryRepository: const _FakeCategoryRepository(),
    groupRepository: const _FakeGroupRepository(),
    loadLivePlaybackPlaylistText: _fakeLivePlaybackPlaylistTextLoader,
    settingsPreferencesRepository: settingsRepository,
  );
  addTearDown(bloc.close);

  await tester.pumpWidget(
    _Harness(
      bloc: bloc,
      settingsRepository: settingsRepository,
    ),
  );

  final loaded = bloc.stream.firstWhere(
    (state) => state.activeSlot.detail?.chatChannelId == 'chat-a',
  );
  bloc.add(
    const LivePlayerEvent.started(
      initialTarget: LivePlayerInitialTarget(channelId: 'channel-a'),
    ),
  );
  await loaded;
  await tester.pump();

  return bloc;
}

Future<LivePlayerBloc> _pumpRoutedLivePlayer(
  WidgetTester tester, {
  SettingsPreferences preferences = defaultSettingsPreferences,
  LiveRepository liveRepository = const _FakeLiveRepository(),
}) async {
  tester.view.physicalSize = const Size(960, 540);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
  final previousVideoPlayerPlatform = VideoPlayerPlatform.instance;
  final fakeVideoPlayerPlatform = _FakeVideoPlayerPlatform();
  VideoPlayerPlatform.instance = fakeVideoPlayerPlatform;
  addTearDown(() async {
    VideoPlayerPlatform.instance = previousVideoPlayerPlatform;
    await fakeVideoPlayerPlatform.disposeAll();
  });

  final settingsRepository = _FakeSettingsPreferencesRepository(preferences);
  final bloc = LivePlayerBloc(
    liveRepository: liveRepository,
    channelRepository: const _FakeChannelRepository(),
    followingRepository: const _FakeFollowingRepository(),
    categoryRepository: const _FakeCategoryRepository(),
    groupRepository: const _FakeGroupRepository(),
    loadLivePlaybackPlaylistText: _fakeLivePlaybackPlaylistTextLoader,
    settingsPreferencesRepository: settingsRepository,
  );
  addTearDown(bloc.close);

  final router = GoRouter(
    initialLocation: AppRoute.livePlayer.path,
    routes: [
      GoRoute(
        path: AppRoute.home.path,
        builder: (context, state) => const Scaffold(
          body: Text(_homeRouteLabel),
        ),
      ),
      GoRoute(
        path: AppRoute.livePlayer.path,
        builder: (context, state) => const LivePlayerView(),
      ),
    ],
  );
  addTearDown(router.dispose);

  await tester.pumpWidget(
    _RoutedHarness(
      bloc: bloc,
      router: router,
      settingsRepository: settingsRepository,
    ),
  );

  final loaded = bloc.stream.firstWhere(
    (state) => state.activeSlot.detail?.chatChannelId == 'chat-a',
  );
  bloc.add(
    const LivePlayerEvent.started(
      initialTarget: LivePlayerInitialTarget(channelId: 'channel-a'),
    ),
  );
  await loaded;
  await tester.pump();

  return bloc;
}

Future<void> _sendKeyAndWait(
  WidgetTester tester,
  LogicalKeyboardKey key, {
  required bool Function() until,
}) async {
  await tester.sendKeyEvent(key);
  await _pumpUntil(tester, until: until);
}

Future<void> _addMultiviewLive(
  WidgetTester tester,
  LivePlayerBloc bloc, {
  required String slotId,
  required Live live,
}) async {
  bloc.add(LivePlayerEvent.browseLiveSelected(live: live));
  await _pumpUntil(
    tester,
    until: () =>
        bloc.state.slotById(slotId)?.status == LivePlayerSlotStatus.playing,
  );
}

Future<void> _pumpUntil(
  WidgetTester tester, {
  required bool Function() until,
}) async {
  for (var attempts = 0; attempts < 20; attempts += 1) {
    await tester.pump(const Duration(milliseconds: 1));
    if (until()) {
      return;
    }
  }

  fail('Expected live player state to update.');
}

Rect _videoRectForSlot(
  WidgetTester tester,
  _FakeVideoPlayerPlatform videoPlatform,
  LivePlayerSlotState slot,
) {
  final playerId = videoPlatform.latestPlayerIdForUri(
    slot.playbackUri!.toString(),
  );

  return tester.getRect(find.byKey(ValueKey('fake-video-view-$playerId')));
}

Rect _playbackSlotRect(WidgetTester tester, String slotId) {
  return tester.getRect(
    find.byKey(ValueKey('live-player-playback-slot-$slotId')),
  );
}

Rect _chatLayerRect(
  WidgetTester tester, {
  required String channelId,
  required String chatChannelId,
}) {
  return tester.getRect(
    find.byKey(ValueKey('live-chat-layer-$channelId-$chatChannelId')),
  );
}

void _expectRect(Rect actual, Rect expected) {
  expect(actual.left, moreOrLessEquals(expected.left, epsilon: 0.01));
  expect(actual.top, moreOrLessEquals(expected.top, epsilon: 0.01));
  expect(actual.width, moreOrLessEquals(expected.width, epsilon: 0.01));
  expect(actual.height, moreOrLessEquals(expected.height, epsilon: 0.01));
}

LivePlayerState _multiviewChatPolicyState({
  required LivePlayerMultiviewLayoutMode mode,
  required int slotCount,
  required int chatWindowIndex,
}) {
  return LivePlayerState.initial().copyWith(
    viewMode: LivePlayerViewMode.multiview,
    multiviewLayoutMode: mode,
    activeSlotId: 'slot-0',
    primarySlotId: 'slot-0',
    slots: [
      for (var index = 0; index < slotCount; index += 1)
        LivePlayerSlotState(slotId: 'slot-$index'),
    ],
    settingsPreferences: SettingsPreferences(
      liveSettings: LiveSettings(multiviewChatWindowIndex: chatWindowIndex),
    ),
  );
}

class _Harness extends StatelessWidget {
  const _Harness({
    required this.bloc,
    required this.settingsRepository,
  });

  final LivePlayerBloc bloc;
  final SettingsPreferencesRepository settingsRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<ChatRepository>.value(
            value: const _FakeChatRepository(),
          ),
          RepositoryProvider<SettingsPreferencesRepository>.value(
            value: settingsRepository,
          ),
        ],
        child: BlocProvider<LivePlayerBloc>.value(
          value: bloc,
          child: const LivePlayerView(),
        ),
      ),
    );
  }
}

class _RoutedHarness extends StatelessWidget {
  const _RoutedHarness({
    required this.bloc,
    required this.router,
    required this.settingsRepository,
  });

  final LivePlayerBloc bloc;
  final GoRouter router;
  final SettingsPreferencesRepository settingsRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ChatRepository>.value(
          value: const _FakeChatRepository(),
        ),
        RepositoryProvider<SettingsPreferencesRepository>.value(
          value: settingsRepository,
        ),
      ],
      child: BlocProvider<LivePlayerBloc>.value(
        value: bloc,
        child: MaterialApp.router(
          routerConfig: router,
        ),
      ),
    );
  }
}

const _homeRouteLabel = 'Home route';

class _FakeLiveRepository implements LiveRepository {
  const _FakeLiveRepository({
    this.detailsByChannelId = const {},
  });

  final Map<String, LiveDetail> detailsByChannelId;

  @override
  Future<LiveDetail> getLiveDetail({required String channelId}) async {
    return detailsByChannelId[channelId] ?? _liveDetail();
  }

  @override
  Future<LivePage> getLives({
    int? size,
    LiveSort? sortType,
    LiveCursor? cursor,
  }) {
    return _unsupportedFakeOperation('_FakeLiveRepository.getLives');
  }

  @override
  Future<LiveStatus> getLiveStatus({
    required String channelId,
    bool? includePlayerRecommendContent,
  }) {
    return _unsupportedFakeOperation('_FakeLiveRepository.getLiveStatus');
  }

  @override
  Future<void> postLiveWatchEvent({
    required String channelId,
    required int liveId,
    required String watchEventType,
    required String sessionId,
    required int eventDurationSeconds,
    required int positionSeconds,
    required int? awtSeconds,
    List<String> liveTokens = const <String>[],
    bool autoPlay = false,
    bool radioMode = false,
  }) async {}
}

LiveDetail _liveDetail() {
  return const LiveDetail(
    liveId: 1,
    title: 'Live title',
    status: 'OPEN',
    concurrentUserCount: 10,
    adult: false,
    chatChannelId: 'chat-a',
    livePlaybackJson:
        '{"media":[{"mediaId":"HLS","path":"https://example.com/live.m3u8"}]}',
    channel: LiveChannel(
      channelId: 'channel-a',
      channelName: 'Channel A',
      verifiedMark: false,
    ),
  );
}

LiveDetail _liveDetailForChannel({
  required int liveId,
  required String channelId,
  required String channelName,
}) {
  return LiveDetail(
    liveId: liveId,
    title: '$channelName live',
    status: 'OPEN',
    concurrentUserCount: 20,
    adult: false,
    chatChannelId: 'chat-$channelId',
    livePlaybackJson:
        '{"media":[{"mediaId":"HLS","path":"https://example.com/$channelId.m3u8"}]}',
    channel: LiveChannel(
      channelId: channelId,
      channelName: channelName,
      verifiedMark: false,
    ),
  );
}

Live _liveForChannel({
  required int liveId,
  required String channelId,
  required String channelName,
}) {
  return Live(
    liveId: liveId,
    title: channelName,
    concurrentUserCount: 20,
    adult: false,
    channel: LiveChannel(
      channelId: channelId,
      channelName: channelName,
      verifiedMark: false,
    ),
  );
}

class _FakeChatRepository implements ChatRepository {
  const _FakeChatRepository();

  @override
  Future<ChatAccessToken> fetchAccessToken({
    required String channelId,
    String? chatType,
  }) {
    return _unsupportedFakeOperation('_FakeChatRepository.fetchAccessToken');
  }

  @override
  Future<VideoChatPage> fetchVideoChats({
    required int videoNo,
    required int playerMessageTime,
    int? previousVideoChatSize,
  }) {
    return _unsupportedFakeOperation('_FakeChatRepository.fetchVideoChats');
  }
}

class _FakeFollowingRepository implements FollowingRepository {
  const _FakeFollowingRepository();

  @override
  Future<FollowingChannelPage> fetchFollowingChannels({
    int? page,
    int? size,
    FollowingChannelSort? sortType,
  }) {
    return _unsupportedFakeOperation(
      '_FakeFollowingRepository.fetchFollowingChannels',
    );
  }

  @override
  Future<FollowingLivePage> fetchFollowingLives({
    FollowingLiveSort? sortType,
  }) {
    return _unsupportedFakeOperation(
      '_FakeFollowingRepository.fetchFollowingLives',
    );
  }
}

class _FakeCategoryRepository implements CategoryRepository {
  const _FakeCategoryRepository();

  @override
  Future<CategoryPage> fetchCategories({CategoryPageCursor? cursor}) {
    return _unsupportedFakeOperation('_FakeCategoryRepository.fetchCategories');
  }

  @override
  Future<CategoryInfo> fetchCategoryInfo({
    required String categoryType,
    required String categoryId,
  }) {
    return _unsupportedFakeOperation(
      '_FakeCategoryRepository.fetchCategoryInfo',
    );
  }

  @override
  Future<CategoryLivePage> fetchCategoryLives({
    required String categoryType,
    required String categoryId,
    CategoryLiveCursor? cursor,
  }) {
    return _unsupportedFakeOperation(
      '_FakeCategoryRepository.fetchCategoryLives',
    );
  }

  @override
  Future<List<CategoryItem>> fetchFollowingCategories() {
    return _unsupportedFakeOperation(
      '_FakeCategoryRepository.fetchFollowingCategories',
    );
  }

  @override
  Future<CategoryVideoPage> fetchCategoryVideos({
    required String categoryType,
    required String categoryId,
    CategoryVideoCursor? cursor,
  }) {
    return _unsupportedFakeOperation(
      '_FakeCategoryRepository.fetchCategoryVideos',
    );
  }

  @override
  Future<void> followCategory({
    required String categoryType,
    required String categoryId,
  }) {
    return _unsupportedFakeOperation('_FakeCategoryRepository.followCategory');
  }

  @override
  Future<void> unfollowCategory({
    required String categoryType,
    required String categoryId,
  }) {
    return _unsupportedFakeOperation(
      '_FakeCategoryRepository.unfollowCategory',
    );
  }
}

class _FakeChannelRepository implements ChannelRepository {
  const _FakeChannelRepository();

  @override
  Future<void> disableChannelNotification({required String channelId}) {
    return _unsupportedFakeOperation(
      '_FakeChannelRepository.disableChannelNotification',
    );
  }

  @override
  Future<void> enableChannelNotification({required String channelId}) {
    return _unsupportedFakeOperation(
      '_FakeChannelRepository.enableChannelNotification',
    );
  }

  @override
  Future<void> followChannel({required String channelId}) {
    return _unsupportedFakeOperation('_FakeChannelRepository.followChannel');
  }

  @override
  Future<ChannelDetail> getChannel({required String channelId}) {
    return _unsupportedFakeOperation('_FakeChannelRepository.getChannel');
  }

  @override
  Future<ChannelMyInfo> getMyInfo({required String channelId}) {
    return _unsupportedFakeOperation('_FakeChannelRepository.getMyInfo');
  }

  @override
  Future<ChannelVideoPage> getChannelVideos({
    required String channelId,
    VodSort? sortType,
    int? page,
    int? size,
    String? publishDateAt,
    String? videoType,
  }) {
    return _unsupportedFakeOperation(
      '_FakeChannelRepository.getChannelVideos',
    );
  }

  @override
  Future<void> unfollowChannel({required String channelId}) {
    return _unsupportedFakeOperation('_FakeChannelRepository.unfollowChannel');
  }
}

class _FakeGroupRepository implements GroupRepository {
  const _FakeGroupRepository();

  @override
  Future<GroupActivationResult> activateGroup({required String groupId}) {
    return _unsupportedFakeOperation('_FakeGroupRepository.activateGroup');
  }

  @override
  Future<GroupAddMemberResult> addMember({
    required String groupId,
    required String channelId,
  }) {
    return _unsupportedFakeOperation('_FakeGroupRepository.addMember');
  }

  @override
  Future<GroupCreateResult> createGroup({required String groupName}) {
    return _unsupportedFakeOperation('_FakeGroupRepository.createGroup');
  }

  @override
  Future<GroupMutationResult> deleteGroup({required String groupId}) {
    return _unsupportedFakeOperation('_FakeGroupRepository.deleteGroup');
  }

  @override
  Future<GroupCollection> read() async {
    return defaultGroupCollection;
  }

  @override
  Future<GroupMutationResult> removeMember({
    required String groupId,
    required String channelId,
  }) {
    return _unsupportedFakeOperation('_FakeGroupRepository.removeMember');
  }

  @override
  Future<void> save(GroupCollection collection) {
    return _unsupportedFakeOperation('_FakeGroupRepository.save');
  }
}

class _FakeSettingsPreferencesRepository
    implements SettingsPreferencesRepository {
  _FakeSettingsPreferencesRepository(this.preferences);

  SettingsPreferences preferences;

  @override
  Future<SettingsPreferences> read() async {
    return preferences;
  }

  @override
  Future<void> save(SettingsPreferences preferences) async {
    this.preferences = preferences;
  }
}

Future<String> _fakeLivePlaybackPlaylistTextLoader({
  required Uri playlistUri,
}) {
  return _unsupportedFakeOperation('_fakeLivePlaybackPlaylistTextLoader');
}

Never _unsupportedFakeOperation(String operation) {
  throw UnsupportedError(
    '$operation is not supported by this test fake. '
    'Provide a focused fake implementation before using it.',
  );
}

final class _FakeVideoPlayerPlatform extends VideoPlayerPlatform {
  final _streams = <int, StreamController<VideoEvent>>{};
  final _playerUriById = <int, String?>{};
  final _viewTypeByPlayerId = <int, VideoViewType?>{};
  final _pendingInitializationByUri = <String, Completer<void>>{};
  final mixWithOthersValues = <bool>[];
  final buildViewPlayerIds = <int>[];
  final playerCalls = <({int playerId, String method, double? volume})>[];
  var _nextPlayerId = 1;

  @override
  Future<int?> create(DataSource dataSource) async {
    return _createPlayer(dataSource.uri, null);
  }

  @override
  Future<int?> createWithOptions(VideoCreationOptions options) async {
    return _createPlayer(options.dataSource.uri, options.viewType);
  }

  @override
  Future<void> dispose(int playerId) async {
    playerCalls.add((playerId: playerId, method: 'dispose', volume: null));
    _playerUriById.remove(playerId);
    _viewTypeByPlayerId.remove(playerId);
    await _streams.remove(playerId)?.close();
  }

  @override
  Future<void> init() async {}

  @override
  Stream<VideoEvent> videoEventsFor(int playerId) {
    return _streams[playerId]!.stream;
  }

  @override
  Future<void> pause(int playerId) async {
    playerCalls.add((playerId: playerId, method: 'pause', volume: null));
  }

  @override
  Future<void> play(int playerId) async {
    playerCalls.add((playerId: playerId, method: 'play', volume: null));
  }

  @override
  Future<Duration> getPosition(int playerId) async {
    return Duration.zero;
  }

  @override
  Future<void> seekTo(int playerId, Duration position) async {}

  @override
  Future<void> setLooping(int playerId, bool looping) async {}

  @override
  Future<void> setVolume(int playerId, double volume) async {
    playerCalls.add((
      playerId: playerId,
      method: 'setVolume',
      volume: volume,
    ));
  }

  @override
  Future<void> setPlaybackSpeed(int playerId, double speed) async {}

  @override
  Future<void> setMixWithOthers(bool mixWithOthers) async {
    mixWithOthersValues.add(mixWithOthers);
  }

  @override
  Widget buildView(int playerId) {
    buildViewPlayerIds.add(playerId);
    return SizedBox.expand(
      key: ValueKey('fake-video-view-$playerId'),
    );
  }

  int? latestPlayerIdForUri(String uri) {
    for (final entry in _playerUriById.entries.toList().reversed) {
      if (entry.value == uri) {
        return entry.key;
      }
    }

    return null;
  }

  VideoViewType? viewTypeForPlayer(int playerId) {
    return _viewTypeByPlayerId[playerId];
  }

  void delayInitializationForUri(String uri) {
    _pendingInitializationByUri[uri] = Completer<void>();
  }

  void completeInitializationForUri(String uri) {
    final completer = _pendingInitializationByUri.remove(uri);
    if (completer == null || completer.isCompleted) {
      return;
    }

    completer.complete();
  }

  void emitBufferingStart(int playerId) {
    _emit(
      playerId,
      VideoEvent(eventType: VideoEventType.bufferingStart),
    );
  }

  void emitBufferingEnd(int playerId) {
    _emit(
      playerId,
      VideoEvent(eventType: VideoEventType.bufferingEnd),
    );
  }

  List<String> callsForPlayer(int playerId) {
    return [
      for (final call in playerCalls)
        if (call.playerId == playerId)
          call.method == 'setVolume'
              ? 'setVolume:${call.volume?.toStringAsFixed(1)}'
              : call.method,
    ];
  }

  Future<void> disposeAll() async {
    for (final stream in _streams.values) {
      await stream.close();
    }
    _streams.clear();
    _playerUriById.clear();
    _viewTypeByPlayerId.clear();
  }

  int _createPlayer(String? uri, VideoViewType? viewType) {
    final playerId = _nextPlayerId++;
    final stream = StreamController<VideoEvent>();
    _streams[playerId] = stream;
    _playerUriById[playerId] = uri;
    _viewTypeByPlayerId[playerId] = viewType;
    final pendingInitialization = uri == null
        ? null
        : _pendingInitializationByUri[uri];
    if (pendingInitialization != null) {
      unawaited(
        pendingInitialization.future.then((_) {
          if (_streams.containsKey(playerId)) {
            _emitInitialized(playerId);
          }
        }),
      );
      return playerId;
    }

    _emitInitialized(playerId);
    return playerId;
  }

  void _emitInitialized(int playerId) {
    _emit(
      playerId,
      VideoEvent(
        eventType: VideoEventType.initialized,
        size: const Size(16, 9),
        duration: const Duration(hours: 1),
      ),
    );
  }

  void _emit(int playerId, VideoEvent event) {
    final stream = _streams[playerId];
    if (stream == null) {
      return;
    }

    stream.add(event);
  }
}
