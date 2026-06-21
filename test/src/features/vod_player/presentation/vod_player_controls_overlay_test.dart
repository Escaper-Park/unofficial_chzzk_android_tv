import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/ui/ui.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/entities/channel_detail.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/entities/channel_my_info.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/domain/entities/settings_preferences.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/presentation/settings_screen_string.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_detail.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_playback.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod_player/presentation/bloc/vod_player_bloc.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod_player/presentation/view/vod_player_controls_overlay.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod_player/presentation/view/vod_player_playback_snapshot.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod_player/presentation/view/vod_player_seek_feedback_overlay.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod_player/presentation/vod_player_screen_string.dart';

void main() {
  testWidgets('seek feedback shows position and directional display icon', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(960, 540);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final theme = ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.green,
        brightness: Brightness.dark,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 64),
      ),
    );
    final displayLargeSize = theme.textTheme.displayLarge?.fontSize;

    await tester.pumpWidget(
      _OverlayHarness(
        theme: theme,
        child: const SizedBox(
          width: 960,
          height: 540,
          child: VodPlayerSeekFeedbackOverlay(
            feedback: VodPlayerSeekFeedback(
              forward: false,
              position: Duration(hours: 1, minutes: 2, seconds: 3),
            ),
          ),
        ),
      ),
    );

    final rewindText = find.text('01:02:03');
    expect(rewindText, findsOneWidget);
    expect(find.byIcon(Icons.fast_rewind_rounded), findsOneWidget);
    expect(find.byIcon(Icons.fast_forward_rounded), findsNothing);
    expect(
      tester.getCenter(find.byIcon(Icons.fast_rewind_rounded)).dx,
      lessThan(tester.getCenter(rewindText).dx),
    );
    expect(tester.widget<Text>(rewindText).style?.fontSize, displayLargeSize);
    expect(
      tester.widget<Icon>(find.byIcon(Icons.fast_rewind_rounded)).size,
      displayLargeSize,
    );

    await tester.pumpWidget(
      _OverlayHarness(
        theme: theme,
        child: const SizedBox(
          width: 960,
          height: 540,
          child: VodPlayerSeekFeedbackOverlay(
            feedback: VodPlayerSeekFeedback(
              forward: true,
              position: Duration(minutes: 3, seconds: 20),
            ),
          ),
        ),
      ),
    );

    final forwardText = find.text('00:03:20');
    expect(forwardText, findsOneWidget);
    expect(find.byIcon(Icons.fast_rewind_rounded), findsNothing);
    expect(find.byIcon(Icons.fast_forward_rounded), findsOneWidget);
    expect(
      tester.getCenter(find.byIcon(Icons.fast_forward_rounded)).dx,
      greaterThan(tester.getCenter(forwardText).dx),
    );
    expect(tester.widget<Text>(forwardText).style?.fontSize, displayLargeSize);
    expect(
      tester.widget<Icon>(find.byIcon(Icons.fast_forward_rounded)).size,
      displayLargeSize,
    );

    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('favorite action opens modal and disables follow signed out', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(960, 540);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final controlsNode = FocusScopeNode();
    addTearDown(controlsNode.dispose);
    var modalOpen = false;

    await tester.pumpWidget(
      _OverlayHarness(
        child: SizedBox(
          width: 960,
          height: 540,
          child: VodPlayerControlsOverlay(
            state: _playingStateSignedOut(),
            controlsNode: controlsNode,
            playbackPaused: false,
            muted: false,
            onPlaybackPausedChanged: (_) {},
            onMutedChanged: (_) {},
            onSeek: (_) {},
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

    expect(find.text(VodPlayerScreenString.follow), findsOneWidget);
    expect(
      tester
          .widget<TvListItem>(
            find.widgetWithText(TvListItem, VodPlayerScreenString.follow),
          )
          .enabled,
      isFalse,
    );
    expect(find.text(VodPlayerScreenString.addToGroup), findsOneWidget);
    expect(find.byType(TvRadioButton), findsNothing);
    expect(modalOpen, isTrue);

    await tester.tap(
      find.widgetWithText(TvListItem, VodPlayerScreenString.addToGroup),
    );
    await tester.pump();

    expect(find.text(VodPlayerScreenString.noGroup), findsOneWidget);

    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('following command asks before unfollowing', (tester) async {
    tester.view.physicalSize = const Size(960, 540);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final controlsNode = FocusScopeNode();
    addTearDown(controlsNode.dispose);
    final state = _playingStateSignedOut();

    await tester.pumpWidget(
      _OverlayHarness(
        child: SizedBox(
          width: 960,
          height: 540,
          child: VodPlayerControlsOverlay(
            state: state.copyWith(
              slots: [
                state.activeSlot.copyWith(
                  channelMyInfo: _channelMyInfo(following: true),
                ),
              ],
            ),
            controlsNode: controlsNode,
            playbackPaused: false,
            muted: false,
            onPlaybackPausedChanged: (_) {},
            onMutedChanged: (_) {},
            onSeek: (_) {},
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
    await tester.tap(
      find.widgetWithText(TvListItem, VodPlayerScreenString.following),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 200));

    expect(find.byType(TvDialog), findsOneWidget);
    expect(
      find.text(VodPlayerScreenString.unfollowDialogTitle),
      findsOneWidget,
    );
    expect(
      find.text(VodPlayerScreenString.unfollowDialogContent),
      findsOneWidget,
    );

    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('resolution modal shows only available values', (tester) async {
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
          child: VodPlayerControlsOverlay(
            state: _playingStateSignedOut().copyWith(
              settingsPreferences: const SettingsPreferences(
                vodSettings: VodSettings(resolutionIndex: 1),
              ),
              slots: [
                _playingStateSignedOut().activeSlot.copyWith(
                  availableResolutionIndexes: const [0, 2, 4],
                ),
              ],
            ),
            controlsNode: controlsNode,
            playbackPaused: false,
            muted: false,
            onPlaybackPausedChanged: (_) {},
            onMutedChanged: (_) {},
            onSeek: (_) {},
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
    await tester.tap(find.byIcon(Icons.high_quality));
    await tester.pump();

    expect(find.text(SettingsScreenString.resolutionLabel(0)), findsOneWidget);
    expect(find.text(SettingsScreenString.resolutionLabel(1)), findsNothing);
    expect(find.text(SettingsScreenString.resolutionLabel(2)), findsOneWidget);
    expect(find.text(SettingsScreenString.resolutionLabel(3)), findsNothing);
    expect(find.text(SettingsScreenString.resolutionLabel(4)), findsOneWidget);
    expect(
      tester
          .widget<TvListItem>(
            find.widgetWithText(
              TvListItem,
              SettingsScreenString.resolutionLabel(2),
            ),
          )
          .selected,
      isTrue,
    );

    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('renders vod time and chapter time as HH:MM:SS', (tester) async {
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
          child: VodPlayerControlsOverlay(
            state: _playingStateWithChapter(),
            controlsNode: controlsNode,
            playbackPaused: false,
            muted: false,
            onPlaybackPausedChanged: (_) {},
            onMutedChanged: (_) {},
            onSeek: (_) {},
            onInteraction: () {},
            modalDismissSerial: 0,
            onModalVisibilityChanged: (_) {},
          ),
        ),
      ),
    );
    await tester.pump();

    expect(find.text('00:01:05 / 00:10:00'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.format_list_bulleted));
    await tester.pump();

    const chapterTitle = 'Opening chapter title';
    final chapterTitleFinder = find.text(chapterTitle);
    expect(chapterTitleFinder, findsOneWidget);
    expect(tester.widget<Text>(chapterTitleFinder).maxLines, 2);
    expect(find.text('00:01:05'), findsOneWidget);

    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('playback snapshot updates time without repumping overlay', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(960, 540);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final controlsNode = FocusScopeNode();
    final playbackSnapshot = ValueNotifier(
      const VodPlayerPlaybackSnapshot(
        position: Duration(seconds: 65),
        duration: Duration(minutes: 10),
      ),
    );
    addTearDown(controlsNode.dispose);
    addTearDown(playbackSnapshot.dispose);

    await tester.pumpWidget(
      _OverlayHarness(
        child: SizedBox(
          width: 960,
          height: 540,
          child: VodPlayerControlsOverlay(
            state: _playingStateSignedOut(),
            controlsNode: controlsNode,
            playbackPaused: false,
            muted: false,
            playbackSnapshot: playbackSnapshot,
            onPlaybackPausedChanged: (_) {},
            onMutedChanged: (_) {},
            onSeek: (_) {},
            onInteraction: () {},
            modalDismissSerial: 0,
            onModalVisibilityChanged: (_) {},
          ),
        ),
      ),
    );
    await tester.pump();

    expect(find.text('00:01:05 / 00:10:00'), findsOneWidget);

    playbackSnapshot.value = const VodPlayerPlaybackSnapshot(
      position: Duration(seconds: 95),
      duration: Duration(minutes: 10),
    );
    await tester.pump();

    expect(find.text('00:01:35 / 00:10:00'), findsOneWidget);
    expect(find.text('00:01:05 / 00:10:00'), findsNothing);

    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets(
    'seekbar moves focus from actions and seeks with horizontal keys',
    (
      tester,
    ) async {
      tester.view.physicalSize = const Size(960, 540);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final controlsNode = FocusScopeNode();
      addTearDown(controlsNode.dispose);
      final seekPositions = <Duration>[];
      final seekFeedbacks = <({bool forward, Duration position})>[];
      var pausedValue = false;

      await tester.pumpWidget(
        _OverlayHarness(
          child: SizedBox(
            width: 960,
            height: 540,
            child: VodPlayerControlsOverlay(
              state: _playingStateSignedOut().copyWith(
                slots: [
                  _playingStateSignedOut().activeSlot.copyWith(
                    position: const Duration(seconds: 65),
                  ),
                ],
              ),
              controlsNode: controlsNode,
              playbackPaused: false,
              muted: false,
              onPlaybackPausedChanged: (value) => pausedValue = value,
              onMutedChanged: (_) {},
              onSeek: seekPositions.add,
              onSeekFeedback:
                  ({
                    required forward,
                    required position,
                  }) {
                    seekFeedbacks.add((forward: forward, position: position));
                  },
              onInteraction: () {},
              modalDismissSerial: 0,
              onModalVisibilityChanged: (_) {},
            ),
          ),
        ),
      );
      await tester.pump();

      await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
      await tester.pump();
      await tester.sendKeyDownEvent(LogicalKeyboardKey.arrowRight);
      await tester.pump();
      await tester.sendKeyRepeatEvent(LogicalKeyboardKey.arrowRight);
      await tester.pump();
      await tester.sendKeyRepeatEvent(LogicalKeyboardKey.arrowRight);
      await tester.pump();
      await tester.sendKeyRepeatEvent(LogicalKeyboardKey.arrowRight);
      await tester.pump();

      expect(seekPositions, [
        const Duration(seconds: 75),
        const Duration(seconds: 85),
        const Duration(seconds: 95),
        const Duration(seconds: 115),
      ]);
      expect(seekFeedbacks, [
        (forward: true, position: const Duration(seconds: 75)),
        (forward: true, position: const Duration(seconds: 85)),
        (forward: true, position: const Duration(seconds: 95)),
        (forward: true, position: const Duration(seconds: 115)),
      ]);

      await tester.sendKeyUpEvent(LogicalKeyboardKey.arrowRight);
      await tester.pump();
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
      await tester.pump();
      await tester.sendKeyEvent(LogicalKeyboardKey.select);
      await tester.pump();

      expect(pausedValue, isTrue);

      await tester.pumpWidget(const SizedBox.shrink());
    },
  );

  testWidgets('seekbar renders chapter segments and scrub preview', (
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
          child: VodPlayerControlsOverlay(
            state: _playingStateWithSeekChapters(),
            controlsNode: controlsNode,
            playbackPaused: false,
            muted: false,
            onPlaybackPausedChanged: (_) {},
            onMutedChanged: (_) {},
            onSeek: (_) {},
            onInteraction: () {},
            modalDismissSerial: 0,
            onModalVisibilityChanged: (_) {},
          ),
        ),
      ),
    );
    await tester.pump();

    expect(
      find.byKey(const ValueKey('vod-overlay-seek-preview')),
      findsNothing,
    );
    expect(
      find.byKey(const ValueKey('vod-overlay-seek-segment-0')),
      findsOneWidget,
    );
    expect(
      find.byKey(const ValueKey('vod-overlay-seek-segment-1')),
      findsOneWidget,
    );
    expect(
      find.byKey(const ValueKey('vod-overlay-seek-segment-2')),
      findsOneWidget,
    );

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
    await tester.pump();

    expect(
      find.byKey(const ValueKey('vod-overlay-seek-preview')),
      findsNothing,
    );

    await tester.sendKeyDownEvent(LogicalKeyboardKey.arrowRight);
    await tester.pump();

    expect(
      find.byKey(const ValueKey('vod-overlay-seek-preview')),
      findsOneWidget,
    );
    expect(find.text('Middle chapter title'), findsOneWidget);
    expect(find.text('00:01:15'), findsOneWidget);
    expect(
      tester.widget<Text>(find.text('Middle chapter title')).textAlign,
      TextAlign.center,
    );
    expect(
      tester.widget<Text>(find.text('00:01:15')).textAlign,
      TextAlign.center,
    );
    expect(
      tester.getSize(
        find.byKey(const ValueKey('vod-overlay-seek-preview-thumbnail')),
      ),
      const Size(124, 69.75),
    );
    expect(
      tester.getTopLeft(find.byKey(const ValueKey('vod-overlay-seek-bar'))).dy -
          tester
              .getBottomLeft(
                find.byKey(const ValueKey('vod-overlay-seek-preview')),
              )
              .dy,
      8,
    );
    expect(
      tester
              .getTopLeft(
                find.byKey(
                  const ValueKey('vod-overlay-seek-preview-title-background'),
                ),
              )
              .dy -
          tester
              .getBottomLeft(
                find.byKey(
                  const ValueKey('vod-overlay-seek-preview-thumbnail'),
                ),
              )
              .dy,
      4,
    );
    expect(
      tester
              .getTopLeft(
                find.byKey(
                  const ValueKey('vod-overlay-seek-preview-time-background'),
                ),
              )
              .dy -
          tester
              .getBottomLeft(
                find.byKey(
                  const ValueKey('vod-overlay-seek-preview-title-background'),
                ),
              )
              .dy,
      4,
    );
    final timeBackgroundDecoration = tester.widget<DecoratedBox>(
      find.byKey(const ValueKey('vod-overlay-seek-preview-time-background')),
    );
    final timeBackgroundBoxDecoration =
        timeBackgroundDecoration.decoration as BoxDecoration;
    expect(
      timeBackgroundBoxDecoration.color,
      const Color.fromRGBO(0, 0, 0, 0.42),
    );
    final thumbnailDecoration = tester.widget<DecoratedBox>(
      find.byKey(const ValueKey('vod-overlay-seek-preview-thumbnail')),
    );
    final thumbnailBoxDecoration =
        thumbnailDecoration.decoration as BoxDecoration;
    expect(thumbnailBoxDecoration.border?.top.width, 1);
    expect(
      thumbnailBoxDecoration.border?.top.color,
      const Color.fromRGBO(255, 255, 255, 0.62),
    );
    expect(
      find.byKey(const ValueKey('vod-overlay-seek-preview-thumbnail-sprite')),
      findsOneWidget,
    );
    final thumbnailImage = find.byKey(
      const ValueKey('vod-overlay-seek-preview-thumbnail-image'),
    );
    expect(tester.widget<OptimizedImage>(thumbnailImage).fit, BoxFit.fill);
    expect(
      tester.getSize(
        thumbnailImage,
      ),
      const Size(1240, 697.5),
    );
    expect(
      _networkImageUrl(tester, thumbnailImage),
      'https://example.com/sprite_0.jpg',
    );

    await tester.sendKeyUpEvent(LogicalKeyboardKey.arrowRight);
    await tester.pump();

    expect(
      find.byKey(const ValueKey('vod-overlay-seek-preview')),
      findsOneWidget,
    );

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
    await tester.pump();

    expect(
      find.byKey(const ValueKey('vod-overlay-seek-preview')),
      findsNothing,
    );

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
    await tester.pump();
    await tester.sendKeyDownEvent(LogicalKeyboardKey.arrowRight);
    await tester.pump();
    await tester.sendKeyUpEvent(LogicalKeyboardKey.arrowRight);
    await tester.pump();

    expect(
      find.byKey(const ValueKey('vod-overlay-seek-preview')),
      findsOneWidget,
    );

    await tester.pump(const Duration(milliseconds: 4900));

    expect(
      find.byKey(const ValueKey('vod-overlay-seek-preview')),
      findsOneWidget,
    );

    await tester.pump(const Duration(milliseconds: 200));

    expect(
      find.byKey(const ValueKey('vod-overlay-seek-preview')),
      findsNothing,
    );

    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('seekbar scrub preview uses live rewind sprite index', (
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
          child: VodPlayerControlsOverlay(
            state: _playingStateWithLiveRewindSeekThumbnail(),
            controlsNode: controlsNode,
            playbackPaused: false,
            muted: false,
            onPlaybackPausedChanged: (_) {},
            onMutedChanged: (_) {},
            onSeek: (_) {},
            onInteraction: () {},
            modalDismissSerial: 0,
            onModalVisibilityChanged: (_) {},
          ),
        ),
      ),
    );
    await tester.pump();

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
    await tester.pump();
    await tester.sendKeyDownEvent(LogicalKeyboardKey.arrowRight);
    await tester.pump();

    expect(find.text('00:00:10'), findsOneWidget);
    expect(
      find.byKey(const ValueKey('vod-overlay-seek-preview-title-background')),
      findsNothing,
    );
    expect(
      find.byKey(const ValueKey('vod-overlay-seek-preview-time-background')),
      findsOneWidget,
    );

    final thumbnailImage = find.byKey(
      const ValueKey('vod-overlay-seek-preview-thumbnail-image'),
    );
    final expectedIndex =
        (_liveRewindBaseMilliseconds +
            const Duration(seconds: 10).inMilliseconds +
            20000) ~/
        (20000 * 4 * 3);
    expect(
      _networkImageUrl(tester, thumbnailImage),
      'https://example.com/image_4x3x20000_19458271_$expectedIndex.jpg',
    );

    await tester.sendKeyUpEvent(LogicalKeyboardKey.arrowRight);
    await tester.pump();

    expect(
      find.byKey(const ValueKey('vod-overlay-seek-preview')),
      findsOneWidget,
    );

    await tester.pump(const Duration(seconds: 5));

    expect(
      find.byKey(const ValueKey('vod-overlay-seek-preview')),
      findsNothing,
    );

    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('seekbar scrub preview uses column count for ratio sprite grid', (
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
          child: VodPlayerControlsOverlay(
            state: _playingStateWithWideRatioSeekThumbnail(),
            controlsNode: controlsNode,
            playbackPaused: false,
            muted: false,
            onPlaybackPausedChanged: (_) {},
            onMutedChanged: (_) {},
            onSeek: (_) {},
            onInteraction: () {},
            modalDismissSerial: 0,
            onModalVisibilityChanged: (_) {},
          ),
        ),
      ),
    );
    await tester.pump();

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
    await tester.pump();
    await tester.sendKeyDownEvent(LogicalKeyboardKey.arrowRight);
    await tester.pump();

    expect(find.text('00:04:10'), findsOneWidget);

    final sprite = tester.widget<Positioned>(
      find.byKey(const ValueKey('vod-overlay-seek-preview-thumbnail-sprite')),
    );
    expect(sprite.left, moreOrLessEquals(0));
    expect(sprite.top, moreOrLessEquals(-69.75));

    await tester.sendKeyUpEvent(LogicalKeyboardKey.arrowRight);
    await tester.pump();
    await tester.pumpWidget(const SizedBox.shrink());
  });
}

String _networkImageUrl(WidgetTester tester, Finder optimizedImage) {
  final image = tester.widget<Image>(
    find.descendant(of: optimizedImage, matching: find.byType(Image)),
  );
  final imageProvider = image.image as ResizeImage;
  return (imageProvider.imageProvider as NetworkImage).url;
}

VodPlayerState _playingStateSignedOut() {
  return VodPlayerState.initial().copyWith(
    slots: [
      const VodPlayerSlotState(
        slotId: 'primary',
        status: VodPlayerSlotStatus.playing,
        videoNo: 1,
        fallbackTitle: 'VOD title',
        fallbackChannelId: 'channel-a',
        fallbackChannelName: 'Channel A',
        duration: Duration(minutes: 10),
        channelMyInfo: ChannelMyInfo(
          channelId: 'channel-a',
          cheatKey: false,
          naverMembership: false,
        ),
      ),
    ],
  );
}

ChannelMyInfo _channelMyInfo({
  required bool following,
}) {
  return ChannelMyInfo(
    channelId: 'channel-a',
    following: ChannelPersonalFollowing(
      following: following,
      notification: false,
    ),
    cheatKey: false,
    naverMembership: false,
  );
}

VodPlayerState _playingStateWithChapter() {
  return _playingStateSignedOut().copyWith(
    slots: [
      _playingStateSignedOut().activeSlot.copyWith(
        position: const Duration(seconds: 65),
        seekThumbnail: const VodSeekThumbnail(
          source: 'https://example.com/sprite_#.jpg',
          totalPage: 1,
          rowCount: 10,
          columnCount: 10,
          intervalMilliseconds: 2000,
          thumbnailWidth: 320,
          thumbnailHeight: 180,
          allThumbnailCount: 77,
        ),
        detail: const VodDetail(
          videoNo: 1,
          videoId: 'video-id',
          title: 'VOD title',
          videoType: 'REPLAY',
          publishDate: '2026-06-15 20:00:00',
          duration: 600,
          readCount: 1,
          publishDateAt: 1,
          adult: false,
          livePv: 0,
          chapterActive: true,
          chapters: [
            VodChapter(
              title: 'Opening chapter title',
              startTime: 65000,
              endTime: 120000,
            ),
          ],
          videoChatEnabled: false,
        ),
      ),
    ],
  );
}

VodPlayerState _playingStateWithSeekChapters() {
  return _playingStateSignedOut().copyWith(
    slots: [
      _playingStateSignedOut().activeSlot.copyWith(
        position: const Duration(seconds: 65),
        seekThumbnail: const VodSeekThumbnail(
          source: 'https://example.com/sprite_#.jpg',
          totalPage: 1,
          rowCount: 10,
          columnCount: 10,
          intervalMilliseconds: 2000,
          thumbnailWidth: 320,
          thumbnailHeight: 180,
          allThumbnailCount: 77,
        ),
        detail: const VodDetail(
          videoNo: 1,
          videoId: 'video-id',
          title: 'VOD title',
          videoType: 'REPLAY',
          publishDate: '2026-06-15 20:00:00',
          duration: 600,
          readCount: 1,
          publishDateAt: 1,
          adult: false,
          livePv: 0,
          chapterActive: true,
          chapters: [
            VodChapter(
              title: 'Opening chapter title',
              startTime: 0,
              endTime: 60000,
            ),
            VodChapter(
              title: 'Middle chapter title',
              startTime: 60000,
              endTime: 120000,
            ),
            VodChapter(
              title: 'Ending chapter title',
              startTime: 120000,
              endTime: 600000,
            ),
          ],
          videoChatEnabled: false,
        ),
      ),
    ],
  );
}

VodPlayerState _playingStateWithWideRatioSeekThumbnail() {
  return _playingStateSignedOut().copyWith(
    slots: [
      _playingStateSignedOut().activeSlot.copyWith(
        position: const Duration(seconds: 240),
        seekThumbnail: const VodSeekThumbnail(
          source: 'https://example.com/wide_sprite_#.jpg',
          totalPage: 1,
          rowCount: 3,
          columnCount: 4,
          intervalMilliseconds: 2000,
          thumbnailWidth: 160,
          thumbnailHeight: 90,
          allThumbnailCount: 12,
        ),
      ),
    ],
  );
}

VodPlayerState _playingStateWithLiveRewindSeekThumbnail() {
  return _playingStateSignedOut().copyWith(
    slots: [
      _playingStateSignedOut().activeSlot.copyWith(
        position: Duration.zero,
        seekThumbnail: const VodSeekThumbnail(
          source:
              'https://example.com/image_4x3x20000_19458271_{spriteIndex}.jpg',
          indexPlaceholder: '{spriteIndex}',
          indexMode: VodSeekThumbnailIndexMode.absoluteTimestamp,
          rowCount: 3,
          columnCount: 4,
          intervalMilliseconds: 20000,
          thumbnailWidth: 160,
          thumbnailHeight: 90,
          baseTimeMilliseconds: _liveRewindBaseMilliseconds,
        ),
      ),
    ],
  );
}

const _liveRewindBaseMilliseconds = 1781512958000;

class _OverlayHarness extends StatelessWidget {
  const _OverlayHarness({
    required this.child,
    this.theme,
  });

  final Widget child;
  final ThemeData? theme;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          theme ??
          ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.green,
              brightness: Brightness.dark,
            ),
          ),
      home: Scaffold(body: child),
    );
  }
}
