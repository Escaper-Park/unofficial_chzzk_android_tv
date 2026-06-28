import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/ui/ui.dart';
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
import 'package:unofficial_chzzk_android_tv/src/features/live_player/domain/use_cases/resolve_live_playback_uri.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live_player/presentation/bloc/live_player_bloc.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live_player/presentation/live_player_screen_string.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live_player/presentation/view/live_player_controls_overlay.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live_player/presentation/view/live_player_controls_overlay_design.dart';
import 'package:unofficial_chzzk_android_tv/src/features/player_shared/presentation/overlay_controls/overlay_controls.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/domain/entities/settings_preferences.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/domain/repositories/settings_preferences_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/presentation/settings_screen_design.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_sort.dart';

void main() {
  testWidgets('live player controls overlay renders live actions and info', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(960, 540);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final controlsNode = FocusScopeNode();
    addTearDown(controlsNode.dispose);
    var interactionCount = 0;
    var modalOpen = false;

    final state = LivePlayerState.initial().copyWith(
      slots: [
        LivePlayerSlotState(
          slotId: 'primary',
          status: LivePlayerSlotStatus.playing,
          channelId: 'channel-a',
          detail: _liveDetail(),
          liveStatus: const LiveStatus(
            title: 'Refreshed live',
            status: 'OPEN',
            concurrentUserCount: 1234,
            adult: false,
            tags: ['tag-a'],
            openDate: '2026-06-15T10:00:00Z',
          ),
        ),
      ],
    );

    await tester.pumpWidget(
      _OverlayHarness(
        child: SizedBox(
          width: 960,
          height: 540,
          child: LivePlayerControlsOverlay(
            state: state,
            controlsNode: controlsNode,
            playbackPaused: false,
            muted: false,
            onPlaybackPausedChanged: (_) {},
            onMutedChanged: (_) {},
            onInteraction: () => interactionCount += 1,
            modalDismissSerial: 0,
            onModalVisibilityChanged: (visible) => modalOpen = visible,
          ),
        ),
      ),
    );
    await tester.pump();

    expect(find.text('Channel A'), findsOneWidget);
    expect(find.text('Refreshed live'), findsOneWidget);
    expect(find.text('tag-a'), findsOneWidget);
    expect(find.text('1,234'), findsOneWidget);
    expect(find.text('일시정지'), findsOneWidget);
    expect(find.text('채팅창 모드'), findsOneWidget);
    expect(find.text('뷰 모드'), findsOneWidget);
    expect(find.text('즐겨찾기'), findsOneWidget);
    expect(find.text('설정'), findsOneWidget);
    expect(_labelOpacity(tester, '일시정지'), 1);
    expect(_labelOpacity(tester, '채팅창 모드'), 0);
    expect(_labelOpacity(tester, '뷰 모드'), 0);
    expect(_labelOpacity(tester, '즐겨찾기'), 0);
    expect(_labelOpacity(tester, '설정'), 0);
    expect(find.byIcon(Icons.pause), findsOneWidget);
    expect(find.byIcon(Icons.chat_bubble_outline), findsOneWidget);
    expect(find.byIcon(Icons.view_quilt_outlined), findsOneWidget);
    expect(find.byIcon(Icons.bookmark_border), findsOneWidget);
    expect(find.byIcon(Icons.settings), findsOneWidget);
    expect(find.byType(IconButton), findsNWidgets(5));
    expect(
      tester
          .widgetList<TvPlayerOverlayAction>(
            find.byType(TvPlayerOverlayAction),
          )
          .map((action) => action.key),
      const [
        ValueKey('live-player-overlay-play-action'),
        ValueKey('live-player-overlay-chat-mode-action'),
        ValueKey('live-player-overlay-favorite-action'),
        ValueKey('live-player-overlay-settings-action'),
        ValueKey('live-player-overlay-view-mode-action'),
      ],
    );
    expect(controlsNode.hasFocus, isTrue);

    final playLabelTop = _actionLabelTop(tester, '일시정지');
    await tester.tap(find.byIcon(Icons.pause));
    expect(interactionCount, 1);
    await tester.pump();
    expect(find.text('재생'), findsOneWidget);
    expect(find.text('일시정지'), findsWidgets);
    expect(find.text('실시간'), findsOneWidget);
    expect(find.byType(TvRadioButton), findsNothing);
    expect(modalOpen, isTrue);
    expect(
      playLabelTop - _standardModalRect(tester).bottom,
      moreOrLessEquals(8),
    );

    await tester.tap(find.text('실시간'));
    await tester.pump();
    expect(find.text('실시간'), findsNothing);
    expect(modalOpen, isFalse);

    await tester.tap(find.byIcon(Icons.settings));
    await tester.pump();
    _expectOverlayActionLabelsUseLabelSmall(tester);
    expect(find.text('채팅 설정'), findsOneWidget);
    expect(find.text('화질 설정'), findsOneWidget);
    expect(find.text('소리 설정'), findsOneWidget);
    expect(find.text('그룹 설정'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.chat_bubble_outline));
    await tester.pump();
    _expectOverlayActionLabelsUseLabelSmall(tester);
    expect(find.text('오버레이 채팅 가로 위치'), findsOneWidget);
    expect(find.text('배지 모음 표시'), findsOneWidget);
    expect(find.byIcon(Icons.open_with), findsWidgets);
    expect(find.byIcon(Icons.height), findsWidgets);
    expect(find.byIcon(Icons.swap_horiz), findsOneWidget);
    expect(find.byIcon(Icons.view_sidebar_outlined), findsOneWidget);
    expect(find.byIcon(Icons.format_size), findsOneWidget);
    expect(find.byIcon(Icons.opacity), findsWidgets);
    expect(find.byIcon(Icons.rounded_corner), findsOneWidget);
    expect(find.byIcon(Icons.align_horizontal_center), findsOneWidget);
    expect(find.byIcon(Icons.align_vertical_center), findsOneWidget);
    expect(find.byIcon(Icons.format_line_spacing), findsOneWidget);
    expect(find.byIcon(Icons.schedule), findsOneWidget);
    expect(find.byIcon(Icons.badge_outlined), findsOneWidget);
    expect(find.byIcon(Icons.volunteer_activism_outlined), findsOneWidget);
    expect(find.byIcon(Icons.workspace_premium_outlined), findsOneWidget);
    expect(find.byIcon(Icons.collections_bookmark_outlined), findsOneWidget);
    expect(find.byIcon(Icons.tune), findsNothing);
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is IconButton &&
            widget.icon is Icon &&
            (widget.icon as Icon).size == 16,
      ),
      findsWidgets,
    );

    await tester.tap(find.byIcon(Icons.open_with).first);
    await tester.pump();

    expect(find.text('오버레이 채팅 가로 위치'), findsWidgets);
    expect(find.byType(Slider), findsOneWidget);
    expect(
      find.descendant(
        of: find.byType(TvModalPanel),
        matching: find.byWidgetPredicate(
          (widget) =>
              widget is Padding &&
              widget.padding == SettingsScreenDesign.modalSliderPadding,
        ),
      ),
      findsOneWidget,
    );

    await tester.tap(find.byIcon(Icons.rounded_corner));
    await tester.pump();

    expect(find.text('채팅 컨테이너'), findsWidgets);
    expect(find.text('끄기'), findsOneWidget);
    final toggleItem = tester.widget<TvListItem>(
      find.widgetWithText(TvListItem, '끄기'),
    );
    expect(toggleItem.icon, isNull);
    expect(toggleItem.leading, isNull);

    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('realtime menu resumes playback and requests reload', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(960, 540);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final controlsNode = FocusScopeNode();
    addTearDown(controlsNode.dispose);
    final pausedValues = <bool>[];
    var realtimePressCount = 0;
    var modalOpen = false;

    await tester.pumpWidget(
      _OverlayHarness(
        child: SizedBox(
          width: 960,
          height: 540,
          child: LivePlayerControlsOverlay(
            state: _playingState(),
            controlsNode: controlsNode,
            playbackPaused: true,
            muted: false,
            onPlaybackPausedChanged: pausedValues.add,
            onRealtimePressed: () => realtimePressCount += 1,
            onMutedChanged: (_) {},
            onInteraction: () {},
            modalDismissSerial: 0,
            onModalVisibilityChanged: (visible) => modalOpen = visible,
          ),
        ),
      ),
    );
    await tester.pump();

    await tester.tap(find.byIcon(Icons.play_arrow));
    await tester.pump();
    expect(find.text(LivePlayerScreenString.overlayRealtime), findsOneWidget);
    expect(modalOpen, isTrue);

    await tester.tap(find.text(LivePlayerScreenString.overlayRealtime));
    await tester.pump();

    expect(pausedValues, [false]);
    expect(realtimePressCount, 1);
    expect(find.text(LivePlayerScreenString.overlayRealtime), findsNothing);
    expect(modalOpen, isFalse);

    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('live elapsed info ticks from a localized timer', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(960, 540);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final controlsNode = FocusScopeNode();
    addTearDown(controlsNode.dispose);
    final openDate = DateTime.now()
        .subtract(const Duration(seconds: 10))
        .toUtc()
        .toIso8601String();

    await tester.pumpWidget(
      _OverlayHarness(
        child: SizedBox(
          width: 960,
          height: 540,
          child: LivePlayerControlsOverlay(
            state: LivePlayerState.initial().copyWith(
              slots: [
                LivePlayerSlotState(
                  slotId: 'primary',
                  status: LivePlayerSlotStatus.playing,
                  channelId: 'channel-a',
                  detail: _liveDetail(openDate: openDate),
                ),
              ],
            ),
            controlsNode: controlsNode,
            playbackPaused: false,
            muted: false,
            onPlaybackPausedChanged: (_) {},
            onMutedChanged: (_) {},
            onInteraction: () {},
            modalDismissSerial: 0,
            onModalVisibilityChanged: (_) {},
          ),
        ),
      ),
    );
    await tester.pump();

    final initialElapsed = _elapsedDuration(_singleElapsedText(tester));

    await tester.runAsync(() async {
      await Future<void>.delayed(const Duration(milliseconds: 1100));
    });
    await tester.pump(const Duration(milliseconds: 1100));

    expect(
      _elapsedDuration(_singleElapsedText(tester)),
      greaterThan(initialElapsed),
    );

    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('settings action focus moves to the first settings item', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(960, 540);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final controlsNode = FocusScopeNode();
    addTearDown(controlsNode.dispose);

    final state = LivePlayerState.initial().copyWith(
      slots: [
        LivePlayerSlotState(
          slotId: 'primary',
          status: LivePlayerSlotStatus.playing,
          channelId: 'channel-a',
          detail: _liveDetail(),
        ),
      ],
    );

    await tester.pumpWidget(
      _OverlayHarness(
        child: SizedBox(
          width: 960,
          height: 540,
          child: LivePlayerControlsOverlay(
            state: state,
            controlsNode: controlsNode,
            playbackPaused: false,
            muted: false,
            onPlaybackPausedChanged: (_) {},
            onMutedChanged: (_) {},
            onInteraction: () {},
            modalDismissSerial: 0,
            onModalVisibilityChanged: (_) {},
          ),
        ),
      ),
    );
    await tester.pump();

    for (var index = 0; index < 3; index += 1) {
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
      await tester.pump();
    }

    expect(_labelOpacity(tester, '설정'), 1);

    await tester.tap(find.byIcon(Icons.settings));
    await tester.pump();

    expect(find.text('채팅 설정'), findsOneWidget);
    expect(find.text('화질 설정'), findsOneWidget);
    expect(_labelOpacity(tester, '채팅 설정'), 1);
    expect(_labelOpacity(tester, '화질 설정'), 0);
    expect(
      _iconButtonBackgroundColor(tester, Icons.chat_bubble_outline),
      Theme.of(
        tester.element(find.byIcon(Icons.chat_bubble_outline)),
      ).colorScheme.inverseSurface,
    );

    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('multiview overlay renders multiview actions and settings', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(960, 540);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final controlsNode = FocusScopeNode();
    addTearDown(controlsNode.dispose);

    await tester.pumpWidget(
      _OverlayHarness(
        child: SizedBox(
          width: 960,
          height: 540,
          child: LivePlayerControlsOverlay(
            state: _playingState().copyWith(
              viewMode: LivePlayerViewMode.multiview,
            ),
            controlsNode: controlsNode,
            playbackPaused: false,
            muted: false,
            onPlaybackPausedChanged: (_) {},
            onMutedChanged: (_) {},
            onInteraction: () {},
            modalDismissSerial: 0,
            onModalVisibilityChanged: (_) {},
          ),
        ),
      ),
    );
    await tester.pump();

    expect(
      tester
          .widgetList<TvPlayerOverlayAction>(
            find.byType(TvPlayerOverlayAction),
          )
          .map((action) => action.key),
      const [
        ValueKey('live-player-overlay-multiview-settings-action'),
        ValueKey('live-player-overlay-chat-mode-action'),
        ValueKey('live-player-overlay-screen-mode-action'),
        ValueKey('live-player-overlay-settings-action'),
        ValueKey('live-player-overlay-view-mode-action'),
      ],
    );
    expect(find.text('멀티뷰 설정'), findsOneWidget);
    expect(find.text('멀티뷰 채팅 모드'), findsOneWidget);
    expect(find.text('화면 모드'), findsOneWidget);
    expect(find.text('설정'), findsOneWidget);
    expect(find.text('뷰 모드'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.dashboard_customize_outlined));
    await tester.pump();

    expect(find.text('멀티뷰 기본 설정'), findsOneWidget);
    expect(find.text('방송 종료'), findsOneWidget);
    expect(find.text('멀티뷰 화질 설정'), findsOneWidget);
    expect(find.text('멀티뷰 소리 설정'), findsOneWidget);
    expect(find.text('멀티뷰 방송 정보'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.live_tv_outlined));
    await tester.pump();

    final modalPanel = find.byType(TvModalPanel);
    expect(
      find.descendant(of: modalPanel, matching: find.text('Channel A')),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: modalPanel,
        matching: find.byIcon(Icons.live_tv_outlined),
      ),
      findsNothing,
    );

    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('multiview default settings expose position and size sliders', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(960, 540);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final controlsNode = FocusScopeNode();
    addTearDown(controlsNode.dispose);

    await tester.pumpWidget(
      _OverlayHarness(
        child: SizedBox(
          width: 960,
          height: 540,
          child: LivePlayerControlsOverlay(
            state: _playingState().copyWith(
              viewMode: LivePlayerViewMode.multiview,
            ),
            controlsNode: controlsNode,
            playbackPaused: false,
            muted: false,
            onPlaybackPausedChanged: (_) {},
            onMutedChanged: (_) {},
            onInteraction: () {},
            modalDismissSerial: 0,
            onModalVisibilityChanged: (_) {},
          ),
        ),
      ),
    );
    await tester.pump();

    await tester.tap(find.byIcon(Icons.dashboard_customize_outlined));
    await tester.pump();
    await tester.tap(find.byIcon(Icons.tune));
    await tester.pump();

    expect(find.text('멀티뷰 채팅 가로 위치'), findsOneWidget);
    expect(find.text('멀티뷰 채팅 세로 위치'), findsOneWidget);
    expect(find.text('멀티뷰 PIP 가로 위치'), findsOneWidget);
    expect(find.text('멀티뷰 PIP 세로 위치'), findsOneWidget);
    expect(find.text('멀티뷰 PIP 크기'), findsOneWidget);

    expect(find.byIcon(Icons.open_with), findsNWidgets(4));
    expect(find.byIcon(Icons.swap_horiz), findsNothing);
    expect(find.byIcon(Icons.height), findsNothing);

    await tester.tap(find.byIcon(Icons.aspect_ratio));
    await tester.pump();

    expect(find.text('멀티뷰 PIP 크기'), findsWidgets);
    expect(find.byType(Slider), findsOneWidget);
    expect(
      find.descendant(
        of: find.byType(TvModalPanel),
        matching: find.byWidgetPredicate(
          (widget) =>
              widget is Padding &&
              widget.padding == SettingsScreenDesign.modalSliderPadding,
        ),
      ),
      findsOneWidget,
    );

    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('multiview resolution menu selects a channel before resolution', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(960, 540);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final controlsNode = FocusScopeNode();
    addTearDown(controlsNode.dispose);
    final preferencesRepository = _OverlaySettingsPreferencesRepository();
    final bloc = _overlayBloc(
      settingsPreferencesRepository: preferencesRepository,
    );
    addTearDown(bloc.close);
    var modalOpen = false;
    final state = _playingState().copyWith(
      viewMode: LivePlayerViewMode.multiview,
      slots: [
        LivePlayerSlotState(
          slotId: 'primary',
          status: LivePlayerSlotStatus.playing,
          channelId: 'channel-a',
          detail: _liveDetail(channelName: 'Channel A'),
          availableResolutionIndexes: const [0, 2, 4],
        ),
        LivePlayerSlotState(
          slotId: 'slot-1',
          status: LivePlayerSlotStatus.playing,
          channelId: 'channel-b',
          detail: _liveDetail(
            liveId: 2,
            channelId: 'channel-b',
            channelName: 'Channel B',
          ),
          availableResolutionIndexes: const [1, 2],
        ),
      ],
    );

    await tester.pumpWidget(
      _OverlayHarness(
        child: BlocProvider<LivePlayerBloc>.value(
          value: bloc,
          child: SizedBox(
            width: 960,
            height: 540,
            child: LivePlayerControlsOverlay(
              state: state,
              controlsNode: controlsNode,
              playbackPaused: false,
              muted: false,
              onPlaybackPausedChanged: (_) {},
              onMutedChanged: (_) {},
              onInteraction: () {},
              modalDismissSerial: 0,
              onModalVisibilityChanged: (visible) => modalOpen = visible,
            ),
          ),
        ),
      ),
    );
    await tester.pump();

    await tester.tap(find.byIcon(Icons.dashboard_customize_outlined));
    await tester.pump();
    await tester.tap(find.byIcon(Icons.high_quality));
    await tester.pump();

    final modalPanel = find.byType(TvModalPanel);
    expect(
      find.descendant(of: modalPanel, matching: find.text('Channel A')),
      findsOneWidget,
    );
    expect(
      find.descendant(of: modalPanel, matching: find.text('Channel B')),
      findsWidgets,
    );
    expect(
      find.descendant(of: modalPanel, matching: find.text('720p')),
      findsNothing,
    );
    expect(
      find.descendant(
        of: modalPanel,
        matching: find.byIcon(Icons.live_tv_outlined),
      ),
      findsNothing,
    );
    expect(
      find.descendant(of: modalPanel, matching: find.byType(TvRadioButton)),
      findsNothing,
    );
    expect(modalOpen, isTrue);

    await tester.tap(find.widgetWithText(TvListItem, 'Channel B'));
    await tester.pump();

    expect(
      find.descendant(of: modalPanel, matching: find.text('Channel A')),
      findsNothing,
    );
    expect(
      find.descendant(of: modalPanel, matching: find.text('480p')),
      findsOneWidget,
    );
    expect(
      find.descendant(of: modalPanel, matching: find.text('720p')),
      findsOneWidget,
    );
    expect(
      find.descendant(of: modalPanel, matching: find.text('360p')),
      findsNothing,
    );
    expect(
      find.descendant(of: modalPanel, matching: find.byType(TvRadioButton)),
      findsNothing,
    );

    await tester.tap(find.widgetWithText(TvListItem, '720p'));
    await tester.pump();

    expect(modalOpen, isFalse);
    expect(
      bloc.state.settingsPreferences.liveSettings.multiviewResolutionIndex,
      0,
    );
    expect(preferencesRepository.saved, isNull);

    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('multiview sound menu opens channel volume sliders', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(960, 540);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final controlsNode = FocusScopeNode();
    addTearDown(controlsNode.dispose);
    final bloc = _overlayBloc();
    addTearDown(bloc.close);
    final state = _playingState().copyWith(
      viewMode: LivePlayerViewMode.multiview,
      slots: [
        LivePlayerSlotState(
          slotId: 'primary',
          status: LivePlayerSlotStatus.playing,
          channelId: 'channel-a',
          detail: _liveDetail(channelName: 'Channel A'),
        ),
        LivePlayerSlotState(
          slotId: 'slot-1',
          status: LivePlayerSlotStatus.playing,
          channelId: 'channel-b',
          detail: _liveDetail(
            liveId: 2,
            channelId: 'channel-b',
            channelName: 'Channel B',
          ),
        ),
      ],
      audibleSlotIds: {'primary'},
      slotVolumeById: {'slot-1': 0.7},
    );

    await tester.pumpWidget(
      _OverlayHarness(
        child: BlocProvider<LivePlayerBloc>.value(
          value: bloc,
          child: SizedBox(
            width: 960,
            height: 540,
            child: LivePlayerControlsOverlay(
              state: state,
              controlsNode: controlsNode,
              playbackPaused: false,
              muted: false,
              onPlaybackPausedChanged: (_) {},
              onMutedChanged: (_) {},
              onInteraction: () {},
              modalDismissSerial: 0,
              onModalVisibilityChanged: (_) {},
            ),
          ),
        ),
      ),
    );
    await tester.pump();

    await tester.tap(find.byIcon(Icons.dashboard_customize_outlined));
    await tester.pump();
    await tester.tap(find.byIcon(Icons.volume_up_outlined).first);
    await tester.pump();

    final modalPanel = find.byType(TvModalPanel);
    expect(
      find.descendant(of: modalPanel, matching: find.text('Channel A')),
      findsOneWidget,
    );
    expect(
      find.descendant(of: modalPanel, matching: find.text('Channel B')),
      findsOneWidget,
    );
    expect(
      find.descendant(of: modalPanel, matching: find.byType(TvSwitch)),
      findsNothing,
    );

    await tester.tap(find.widgetWithText(TvListItem, 'Channel B'));
    await tester.pump();

    expect(
      find.descendant(of: modalPanel, matching: find.text('Channel A')),
      findsNothing,
    );
    expect(
      find.descendant(of: modalPanel, matching: find.text('Channel B')),
      findsWidgets,
    );
    expect(
      find.descendant(of: modalPanel, matching: find.text('70%')),
      findsOneWidget,
    );
    expect(
      find.descendant(of: modalPanel, matching: find.byType(Slider)),
      findsOneWidget,
    );
    expect(
      find.descendant(of: modalPanel, matching: find.byType(TvSwitch)),
      findsNothing,
    );

    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('multiview info action renders status grid panel', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(960, 540);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final controlsNode = FocusScopeNode();
    addTearDown(controlsNode.dispose);
    final longElapsedOpenDate = DateTime.now()
        .subtract(const Duration(hours: 1000, minutes: 1, seconds: 1))
        .toUtc()
        .toIso8601String();
    final state = _playingState().copyWith(
      viewMode: LivePlayerViewMode.multiview,
      activeSlotId: 'slot-2',
      slots: [
        LivePlayerSlotState(
          slotId: 'primary',
          status: LivePlayerSlotStatus.playing,
          channelId: 'channel-a',
          detail: _liveDetail(
            title: 'Live A',
            channelId: 'channel-a',
            channelName: 'Channel A',
            concurrentUserCount: 1234567,
            openDate: longElapsedOpenDate,
          ),
        ),
        LivePlayerSlotState(
          slotId: 'slot-1',
          status: LivePlayerSlotStatus.playing,
          channelId: 'channel-b',
          detail: _liveDetail(
            liveId: 2,
            title: 'Live B',
            channelId: 'channel-b',
            channelName: 'Channel B',
            concurrentUserCount: 2345,
          ),
        ),
        LivePlayerSlotState(
          slotId: 'slot-2',
          status: LivePlayerSlotStatus.playing,
          channelId: 'channel-c',
          detail: _liveDetail(
            liveId: 3,
            title: 'Live C',
            channelId: 'channel-c',
            channelName: 'Channel C',
            concurrentUserCount: 3456,
          ),
        ),
        LivePlayerSlotState(
          slotId: 'slot-3',
          status: LivePlayerSlotStatus.playing,
          channelId: 'channel-d',
          detail: _liveDetail(
            liveId: 4,
            title: 'Live D',
            channelId: 'channel-d',
            channelName: 'Channel D',
            concurrentUserCount: 4567,
          ),
        ),
      ],
    );

    await tester.pumpWidget(
      _OverlayHarness(
        child: SizedBox(
          width: 960,
          height: 540,
          child: LivePlayerControlsOverlay(
            state: state,
            controlsNode: controlsNode,
            playbackPaused: false,
            muted: false,
            onPlaybackPausedChanged: (_) {},
            onMutedChanged: (_) {},
            onInteraction: () {},
            modalDismissSerial: 0,
            onModalVisibilityChanged: (_) {},
          ),
        ),
      ),
    );
    await tester.pump();

    await tester.tap(find.byIcon(Icons.dashboard_customize_outlined));
    await tester.pump();
    await tester.tap(find.byIcon(Icons.info_outline));
    await tester.pump();

    final panel = find.byKey(
      const ValueKey('live-player-overlay-multiview-info-panel'),
    );
    expect(panel, findsOneWidget);
    expect(find.byType(TvModalPanel), findsNothing);
    expect(
      find.descendant(of: panel, matching: find.byType(ProfileCircleAvatar)),
      findsNWidgets(4),
    );

    for (final text in [
      'Channel A',
      'Channel B',
      'Channel C',
      'Channel D',
      'Live A',
      'Live B',
      'Live C',
      'Live D',
      '1,234,567',
      '2,345',
      '3,456',
      '4,567',
    ]) {
      expect(
        find.descendant(of: panel, matching: find.text(text)),
        findsOneWidget,
      );
    }

    final expectedFontSize = Theme.of(
      tester.element(panel),
    ).textTheme.labelMedium?.fontSize;
    for (final text in tester.widgetList<Text>(
      find.descendant(of: panel, matching: find.byType(Text)),
    )) {
      expect(text.style?.fontSize, expectedFontSize);
    }

    final longElapsedFinder = find.descendant(
      of: panel,
      matching: find.byWidgetPredicate(
        (widget) =>
            widget is Text &&
            RegExp(r'^\d{4}:\d{2}:\d{2}$').hasMatch(widget.data ?? ''),
      ),
    );
    expect(longElapsedFinder, findsOneWidget);
    expect(
      tester.getSize(longElapsedFinder).width,
      LivePlayerControlsOverlayDesign.multiviewInfoMetricTextWidth,
    );
    expect(
      tester.getSize(find.text('1,234,567')).width,
      LivePlayerControlsOverlayDesign.multiviewInfoMetricTextWidth,
    );

    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('multiview screen mode selection updates bloc', (tester) async {
    tester.view.physicalSize = const Size(960, 540);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final controlsNode = FocusScopeNode();
    addTearDown(controlsNode.dispose);
    final bloc = _overlayBloc();
    addTearDown(bloc.close);

    await tester.pumpWidget(
      _OverlayHarness(
        child: BlocProvider<LivePlayerBloc>.value(
          value: bloc,
          child: SizedBox(
            width: 960,
            height: 540,
            child: LivePlayerControlsOverlay(
              state: _playingState().copyWith(
                viewMode: LivePlayerViewMode.multiview,
              ),
              controlsNode: controlsNode,
              playbackPaused: false,
              muted: false,
              onPlaybackPausedChanged: (_) {},
              onMutedChanged: (_) {},
              onInteraction: () {},
              modalDismissSerial: 0,
              onModalVisibilityChanged: (_) {},
            ),
          ),
        ),
      ),
    );
    await tester.pump();

    await tester.tap(find.byIcon(Icons.splitscreen_outlined));
    await tester.pump();

    expect(find.text('PBP'), findsOneWidget);
    expect(find.text('PIP'), findsOneWidget);
    expect(find.text('포커스'), findsOneWidget);

    await tester.tap(find.text('PIP'));
    await tester.pump();

    expect(bloc.state.multiviewLayoutMode, LivePlayerMultiviewLayoutMode.pip);
    expect(find.text('PIP'), findsNothing);

    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('chat mode selection applies the value and closes the modal', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(960, 540);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final controlsNode = FocusScopeNode();
    addTearDown(controlsNode.dispose);
    final preferencesRepository = _OverlaySettingsPreferencesRepository();
    final bloc = _overlayBloc(
      settingsPreferencesRepository: preferencesRepository,
    );
    addTearDown(bloc.close);
    var modalOpen = false;

    await tester.pumpWidget(
      _OverlayHarness(
        child: BlocProvider<LivePlayerBloc>.value(
          value: bloc,
          child: SizedBox(
            width: 960,
            height: 540,
            child: LivePlayerControlsOverlay(
              state: _playingState(),
              controlsNode: controlsNode,
              playbackPaused: false,
              muted: false,
              onPlaybackPausedChanged: (_) {},
              onMutedChanged: (_) {},
              onInteraction: () {},
              modalDismissSerial: 0,
              onModalVisibilityChanged: (visible) => modalOpen = visible,
            ),
          ),
        ),
      ),
    );
    await tester.pump();

    await tester.tap(find.byIcon(Icons.chat_bubble_outline));
    await tester.pump();
    expect(find.text('오버레이'), findsOneWidget);
    expect(modalOpen, isTrue);

    await tester.tap(find.text('오버레이'));
    await tester.pump();

    expect(find.text('오버레이'), findsNothing);
    expect(modalOpen, isFalse);
    expect(bloc.state.settingsPreferences.liveSettings.chatWindowIndex, 1);
    expect(preferencesRepository.saved?.liveSettings.chatWindowIndex, 1);

    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('multiview chat mode menu uses multiview setting options', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(960, 540);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final controlsNode = FocusScopeNode();
    addTearDown(controlsNode.dispose);
    final preferencesRepository = _OverlaySettingsPreferencesRepository();
    final bloc = _overlayBloc(
      settingsPreferencesRepository: preferencesRepository,
    );
    addTearDown(bloc.close);
    var modalOpen = false;

    await tester.pumpWidget(
      _OverlayHarness(
        child: BlocProvider<LivePlayerBloc>.value(
          value: bloc,
          child: SizedBox(
            width: 960,
            height: 540,
            child: LivePlayerControlsOverlay(
              state: _playingState().copyWith(
                viewMode: LivePlayerViewMode.multiview,
              ),
              controlsNode: controlsNode,
              playbackPaused: false,
              muted: false,
              onPlaybackPausedChanged: (_) {},
              onMutedChanged: (_) {},
              onInteraction: () {},
              modalDismissSerial: 0,
              onModalVisibilityChanged: (visible) => modalOpen = visible,
            ),
          ),
        ),
      ),
    );
    await tester.pump();

    await tester.tap(find.byIcon(Icons.chat_bubble_outline));
    await tester.pump();

    expect(find.text('멀티뷰 채팅 모드'), findsWidgets);
    expect(find.text('끄기'), findsOneWidget);
    expect(find.text('오버레이'), findsOneWidget);
    expect(find.text('사이드'), findsOneWidget);
    expect(find.text('켜기'), findsNothing);
    expect(modalOpen, isTrue);

    await tester.tap(find.text('사이드'));
    await tester.pump();

    expect(find.text('사이드'), findsNothing);
    expect(modalOpen, isFalse);
    expect(
      bloc.state.settingsPreferences.liveSettings.multiviewChatWindowIndex,
      2,
    );
    expect(
      preferencesRepository.saved?.liveSettings.multiviewChatWindowIndex,
      2,
    );

    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('view mode selection applies the value and closes the modal', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(960, 540);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final controlsNode = FocusScopeNode();
    addTearDown(controlsNode.dispose);
    final bloc = _overlayBloc();
    addTearDown(bloc.close);
    var modalOpen = false;

    await tester.pumpWidget(
      _OverlayHarness(
        child: BlocProvider<LivePlayerBloc>.value(
          value: bloc,
          child: SizedBox(
            width: 960,
            height: 540,
            child: LivePlayerControlsOverlay(
              state: _playingState(),
              controlsNode: controlsNode,
              playbackPaused: false,
              muted: false,
              onPlaybackPausedChanged: (_) {},
              onMutedChanged: (_) {},
              onInteraction: () {},
              modalDismissSerial: 0,
              onModalVisibilityChanged: (visible) => modalOpen = visible,
            ),
          ),
        ),
      ),
    );
    await tester.pump();

    await tester.tap(find.byIcon(Icons.view_quilt_outlined));
    await tester.pump();
    expect(find.text('멀티뷰'), findsOneWidget);
    expect(modalOpen, isTrue);

    await tester.tap(find.text('멀티뷰'));
    await tester.pump();

    expect(find.text('멀티뷰'), findsNothing);
    expect(modalOpen, isFalse);
    expect(bloc.state.viewMode, LivePlayerViewMode.multiview);

    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('resolution selection applies without saving and closes modal', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(960, 540);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final controlsNode = FocusScopeNode();
    addTearDown(controlsNode.dispose);
    final preferencesRepository = _OverlaySettingsPreferencesRepository();
    final bloc = _overlayBloc(
      settingsPreferencesRepository: preferencesRepository,
    );
    addTearDown(bloc.close);
    var modalOpen = false;

    await tester.pumpWidget(
      _OverlayHarness(
        child: BlocProvider<LivePlayerBloc>.value(
          value: bloc,
          child: SizedBox(
            width: 960,
            height: 540,
            child: LivePlayerControlsOverlay(
              state: _playingState(
                availableResolutionIndexes: const [0, 2, 4],
              ),
              controlsNode: controlsNode,
              playbackPaused: false,
              muted: false,
              onPlaybackPausedChanged: (_) {},
              onMutedChanged: (_) {},
              onInteraction: () {},
              modalDismissSerial: 0,
              onModalVisibilityChanged: (visible) => modalOpen = visible,
            ),
          ),
        ),
      ),
    );
    await tester.pump();

    await tester.tap(find.byIcon(Icons.settings));
    await tester.pump();
    await tester.tap(find.byIcon(Icons.high_quality));
    await tester.pump();
    expect(find.text('360p'), findsOneWidget);
    expect(find.text('720p'), findsOneWidget);
    expect(find.text('1080p'), findsNothing);
    expect(modalOpen, isTrue);

    await tester.tap(find.text('720p'));
    await tester.pump();

    expect(find.text('720p'), findsNothing);
    expect(modalOpen, isFalse);
    expect(bloc.state.settingsPreferences.liveSettings.resolutionIndex, 2);
    expect(preferencesRepository.saved, isNull);

    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('favorite command modal disables follow when signed out', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(960, 540);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final controlsNode = FocusScopeNode();
    addTearDown(controlsNode.dispose);
    var modalOpen = false;

    final state = LivePlayerState.initial().copyWith(
      channelMyInfo: const ChannelMyInfo(
        channelId: 'channel-a',
        cheatKey: false,
        naverMembership: false,
      ),
      slots: [
        LivePlayerSlotState(
          slotId: 'primary',
          status: LivePlayerSlotStatus.playing,
          channelId: 'channel-a',
          detail: _liveDetail(),
        ),
      ],
    );

    await tester.pumpWidget(
      _OverlayHarness(
        child: SizedBox(
          width: 960,
          height: 540,
          child: LivePlayerControlsOverlay(
            state: state,
            controlsNode: controlsNode,
            playbackPaused: false,
            muted: false,
            onPlaybackPausedChanged: (_) {},
            onMutedChanged: (_) {},
            onInteraction: () {},
            modalDismissSerial: 0,
            onModalVisibilityChanged: (visible) => modalOpen = visible,
          ),
        ),
      ),
    );
    await tester.pump();

    await tester.tap(find.byIcon(Icons.bookmark_border));
    await tester.pump();
    expect(find.text('팔로우'), findsOneWidget);
    expect(find.text('팔로잉'), findsNothing);
    expect(
      tester.widget<TvListItem>(find.widgetWithText(TvListItem, '팔로우')).enabled,
      isFalse,
    );
    expect(find.text('그룹에 추가'), findsOneWidget);
    expect(find.byType(TvRadioButton), findsNothing);
    expect(modalOpen, isTrue);

    await tester.tap(find.text('그룹에 추가'));
    await tester.pump();
    expect(find.text('그룹 없음'), findsOneWidget);
    expect(find.byType(TvRadioButton), findsNothing);

    await tester.tap(find.text('그룹 없음'));
    await tester.pump();
    expect(find.text('그룹 없음'), findsNothing);
    expect(modalOpen, isFalse);

    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('following command asks before unfollowing', (tester) async {
    tester.view.physicalSize = const Size(960, 540);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final controlsNode = FocusScopeNode();
    addTearDown(controlsNode.dispose);

    await tester.pumpWidget(
      _OverlayHarness(
        child: SizedBox(
          width: 960,
          height: 540,
          child: LivePlayerControlsOverlay(
            state: _playingState().copyWith(
              channelMyInfo: _myInfoWithFollowing(
                channelId: 'channel-a',
                following: true,
              ),
            ),
            controlsNode: controlsNode,
            playbackPaused: false,
            muted: false,
            onPlaybackPausedChanged: (_) {},
            onMutedChanged: (_) {},
            onInteraction: () {},
            modalDismissSerial: 0,
            onModalVisibilityChanged: (_) {},
          ),
        ),
      ),
    );
    await tester.pump();

    await tester.tap(find.byIcon(Icons.bookmark_border));
    await tester.pump();
    await tester.tap(find.widgetWithText(TvListItem, '팔로잉'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 200));

    expect(find.byType(TvDialog), findsOneWidget);
    expect(
      find.text(LivePlayerScreenString.unfollowDialogTitle),
      findsOneWidget,
    );
    expect(
      find.text(LivePlayerScreenString.unfollowDialogContent),
      findsOneWidget,
    );

    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('group settings modal stays inside the 960 wide viewport', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(960, 540);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final controlsNode = FocusScopeNode();
    addTearDown(controlsNode.dispose);

    final state = LivePlayerState.initial().copyWith(
      slots: [
        LivePlayerSlotState(
          slotId: 'primary',
          status: LivePlayerSlotStatus.playing,
          channelId: 'channel-a',
          detail: _liveDetail(),
        ),
      ],
    );

    await tester.pumpWidget(
      _OverlayHarness(
        child: SizedBox(
          width: 960,
          height: 540,
          child: LivePlayerControlsOverlay(
            state: state,
            controlsNode: controlsNode,
            playbackPaused: false,
            muted: false,
            onPlaybackPausedChanged: (_) {},
            onMutedChanged: (_) {},
            onInteraction: () {},
            modalDismissSerial: 0,
            onModalVisibilityChanged: (_) {},
          ),
        ),
      ),
    );
    await tester.pump();

    await tester.tap(find.byIcon(Icons.settings));
    await tester.pump();
    await tester.tap(find.byIcon(Icons.folder_outlined));
    await tester.pump();

    final modalRect = _standardModalRect(tester);
    expect(modalRect.left, greaterThanOrEqualTo(0));
    expect(modalRect.right, lessThanOrEqualTo(960));

    await tester.pumpWidget(const SizedBox.shrink());
  });
}

double _labelOpacity(WidgetTester tester, String label) {
  return tester
      .widget<Opacity>(
        find.ancestor(
          of: find.text(label),
          matching: find.byType(Opacity),
        ),
      )
      .opacity;
}

String _singleElapsedText(WidgetTester tester) {
  final elapsedTexts = tester
      .widgetList<Text>(
        find.byWidgetPredicate(
          (widget) =>
              widget is Text &&
              RegExp(r'^\d{2}:\d{2}:\d{2}$').hasMatch(widget.data ?? ''),
        ),
      )
      .map((text) => text.data!)
      .toList();

  expect(elapsedTexts, hasLength(1));
  return elapsedTexts.single;
}

Duration _elapsedDuration(String value) {
  final parts = value.split(':').map(int.parse).toList();

  return Duration(
    hours: parts[0],
    minutes: parts[1],
    seconds: parts[2],
  );
}

Color? _iconButtonBackgroundColor(WidgetTester tester, IconData icon) {
  final button = tester.widget<IconButton>(
    find.ancestor(
      of: find.byIcon(icon),
      matching: find.byType(IconButton),
    ),
  );

  return button.style?.backgroundColor?.resolve(<WidgetState>{});
}

void _expectOverlayActionLabelsUseLabelSmall(WidgetTester tester) {
  final actions = find.byType(TvPlayerOverlayAction);
  final actionLabels = find.descendant(
    of: actions,
    matching: find.byType(Text),
  );
  final expectedStyle = TvPlayerOverlayControlsDesign.actionLabelTextStyle(
    tester.element(actions.first),
  );

  expect(
    find.descendant(
      of: actions,
      matching: find.byType(FittedBox),
    ),
    findsNothing,
  );
  for (final label in tester.widgetList<Text>(actionLabels)) {
    expect(label.style?.fontSize, expectedStyle?.fontSize);
    expect(label.style?.height, expectedStyle?.height);
    expect(label.style?.fontWeight, expectedStyle?.fontWeight);
    expect(label.softWrap, isFalse);
    expect(label.overflow, TextOverflow.visible);
  }
}

Rect _standardModalRect(WidgetTester tester) {
  return tester.getRect(
    find.byWidgetPredicate(
      (widget) =>
          widget is SizedBox &&
          widget.width == TvModalPanelDesign.standardWidth,
    ),
  );
}

double _actionLabelTop(WidgetTester tester, String label) {
  return tester
      .getTopLeft(
        find.ancestor(
          of: find.ancestor(
            of: find.text(label).first,
            matching: find.byType(Opacity),
          ),
          matching: find.byWidgetPredicate(
            (widget) =>
                widget is SizedBox &&
                widget.height ==
                    TvPlayerOverlayControlsDesign.actionLabelHeight,
          ),
        ),
      )
      .dy;
}

LivePlayerBloc _overlayBloc({
  SettingsPreferencesRepository? settingsPreferencesRepository,
}) {
  return LivePlayerBloc(
    liveRepository: _OverlayLiveRepository(),
    channelRepository: _OverlayChannelRepository(),
    followingRepository: _OverlayFollowingRepository(),
    categoryRepository: _OverlayCategoryRepository(),
    groupRepository: _OverlayGroupRepository(),
    loadLivePlaybackPlaylistText: ({required playlistUri}) async => '',
    settingsPreferencesRepository:
        settingsPreferencesRepository ??
        _OverlaySettingsPreferencesRepository(),
  );
}

LivePlayerState _playingState({
  List<int> availableResolutionIndexes =
      LivePlaybackResolutionOptions.allIndexes,
}) {
  return LivePlayerState.initial().copyWith(
    slots: [
      LivePlayerSlotState(
        slotId: 'primary',
        status: LivePlayerSlotStatus.playing,
        channelId: 'channel-a',
        detail: _liveDetail(),
        availableResolutionIndexes: availableResolutionIndexes,
      ),
    ],
  );
}

LiveDetail _liveDetail({
  int liveId = 1,
  String title = 'Initial live',
  String channelId = 'channel-a',
  String channelName = 'Channel A',
  int concurrentUserCount = 10,
  String? openDate,
}) {
  return LiveDetail(
    liveId: liveId,
    title: title,
    status: 'OPEN',
    concurrentUserCount: concurrentUserCount,
    openDate: openDate,
    adult: false,
    channel: LiveChannel(
      channelId: channelId,
      channelName: channelName,
      verifiedMark: true,
    ),
  );
}

ChannelMyInfo _myInfoWithFollowing({
  required String channelId,
  required bool following,
}) {
  return ChannelMyInfo(
    channelId: channelId,
    cheatKey: false,
    naverMembership: false,
    following: ChannelPersonalFollowing(
      following: following,
      notification: false,
    ),
  );
}

class _OverlayLiveRepository implements LiveRepository {
  @override
  Future<LiveDetail> getLiveDetail({required String channelId}) {
    return _unsupportedFakeOperation('LiveRepository.getLiveDetail');
  }

  @override
  Future<LivePage> getLives({
    int? size,
    LiveSort? sortType,
    LiveCursor? cursor,
  }) {
    return _unsupportedFakeOperation('LiveRepository.getLives');
  }

  @override
  Future<LiveStatus> getLiveStatus({
    required String channelId,
    bool? includePlayerRecommendContent,
  }) {
    return _unsupportedFakeOperation('LiveRepository.getLiveStatus');
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
  }) {
    return _unsupportedFakeOperation('LiveRepository.postLiveWatchEvent');
  }
}

class _OverlayChannelRepository implements ChannelRepository {
  @override
  Future<void> disableChannelNotification({required String channelId}) {
    return _unsupportedFakeOperation(
      'ChannelRepository.disableChannelNotification',
    );
  }

  @override
  Future<void> enableChannelNotification({required String channelId}) {
    return _unsupportedFakeOperation(
      'ChannelRepository.enableChannelNotification',
    );
  }

  @override
  Future<void> followChannel({required String channelId}) {
    return _unsupportedFakeOperation('ChannelRepository.followChannel');
  }

  @override
  Future<ChannelDetail> getChannel({required String channelId}) {
    return _unsupportedFakeOperation('ChannelRepository.getChannel');
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
    return _unsupportedFakeOperation('ChannelRepository.getChannelVideos');
  }

  @override
  Future<ChannelMyInfo> getMyInfo({required String channelId}) {
    return _unsupportedFakeOperation('ChannelRepository.getMyInfo');
  }

  @override
  Future<void> unfollowChannel({required String channelId}) {
    return _unsupportedFakeOperation('ChannelRepository.unfollowChannel');
  }
}

class _OverlayFollowingRepository implements FollowingRepository {
  @override
  Future<FollowingChannelPage> fetchFollowingChannels({
    int? page,
    int? size,
    FollowingChannelSort? sortType,
  }) {
    return _unsupportedFakeOperation(
      'FollowingRepository.fetchFollowingChannels',
    );
  }

  @override
  Future<FollowingLivePage> fetchFollowingLives({
    FollowingLiveSort? sortType,
  }) {
    return _unsupportedFakeOperation('FollowingRepository.fetchFollowingLives');
  }
}

class _OverlayCategoryRepository implements CategoryRepository {
  @override
  Future<CategoryPage> fetchCategories({
    CategoryPageCursor? cursor,
  }) {
    return _unsupportedFakeOperation('CategoryRepository.fetchCategories');
  }

  @override
  Future<CategoryInfo> fetchCategoryInfo({
    required String categoryType,
    required String categoryId,
  }) {
    return _unsupportedFakeOperation('CategoryRepository.fetchCategoryInfo');
  }

  @override
  Future<CategoryLivePage> fetchCategoryLives({
    required String categoryType,
    required String categoryId,
    CategoryLiveCursor? cursor,
  }) {
    return _unsupportedFakeOperation('CategoryRepository.fetchCategoryLives');
  }

  @override
  Future<List<CategoryItem>> fetchFollowingCategories() {
    return _unsupportedFakeOperation(
      'CategoryRepository.fetchFollowingCategories',
    );
  }

  @override
  Future<CategoryVideoPage> fetchCategoryVideos({
    required String categoryType,
    required String categoryId,
    CategoryVideoCursor? cursor,
  }) {
    return _unsupportedFakeOperation('CategoryRepository.fetchCategoryVideos');
  }

  @override
  Future<void> followCategory({
    required String categoryType,
    required String categoryId,
  }) {
    return _unsupportedFakeOperation('CategoryRepository.followCategory');
  }

  @override
  Future<void> unfollowCategory({
    required String categoryType,
    required String categoryId,
  }) {
    return _unsupportedFakeOperation('CategoryRepository.unfollowCategory');
  }
}

class _OverlayGroupRepository implements GroupRepository {
  @override
  Future<GroupActivationResult> activateGroup({required String groupId}) {
    return _unsupportedFakeOperation('GroupRepository.activateGroup');
  }

  @override
  Future<GroupAddMemberResult> addMember({
    required String groupId,
    required String channelId,
  }) {
    return _unsupportedFakeOperation('GroupRepository.addMember');
  }

  @override
  Future<GroupCreateResult> createGroup({required String groupName}) {
    return _unsupportedFakeOperation('GroupRepository.createGroup');
  }

  @override
  Future<GroupMutationResult> deleteGroup({required String groupId}) {
    return _unsupportedFakeOperation('GroupRepository.deleteGroup');
  }

  @override
  Future<GroupCollection> read() {
    return _unsupportedFakeOperation('GroupRepository.read');
  }

  @override
  Future<GroupMutationResult> removeMember({
    required String groupId,
    required String channelId,
  }) {
    return _unsupportedFakeOperation('GroupRepository.removeMember');
  }

  @override
  Future<void> save(GroupCollection collection) {
    return _unsupportedFakeOperation('GroupRepository.save');
  }
}

Never _unsupportedFakeOperation(String operation) {
  throw UnsupportedError(
    'Unsupported fake operation: $operation. Provide a focused fake '
    'implementation for this test.',
  );
}

class _OverlaySettingsPreferencesRepository
    implements SettingsPreferencesRepository {
  SettingsPreferences? saved;

  @override
  Future<SettingsPreferences> read() async {
    return saved ?? defaultSettingsPreferences;
  }

  @override
  Future<void> save(SettingsPreferences preferences) async {
    saved = preferences;
  }
}

class _OverlayHarness extends StatelessWidget {
  const _OverlayHarness({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.dark,
        ),
      ),
      home: Scaffold(body: child),
    );
  }
}
