import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/assets/app_asset_paths.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live_player/presentation/live_player_screen_string.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live_player/presentation/view/live_player_status_surface.dart';
import 'package:unofficial_chzzk_android_tv/src/features/player_shared/presentation/player_content/player_content.dart';

void main() {
  testWidgets('loading surface shows CHZZK animation without loading text', (
    tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: LivePlayerStatusSurface.loading(),
        ),
      ),
    );

    expect(find.text(LivePlayerScreenString.loading), findsNothing);
    expect(find.byType(TvPlayerLoadingIndicator), findsOneWidget);
    expect(find.byType(Image), findsNothing);

    final indicatorPaint = find.descendant(
      of: find.byType(TvPlayerLoadingIndicator),
      matching: find.byType(CustomPaint),
    );
    final indicatorSize = tester.getSize(indicatorPaint);

    expect(
      indicatorSize,
      const Size.square(TvPlayerLoadingIndicatorDesign.size),
    );

    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('failure surface shows select retry hint without a button', (
    tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: LivePlayerStatusSurface(
            message: LivePlayerScreenString.playbackFailed,
            showRetryHint: true,
          ),
        ),
      ),
    );

    expect(find.text(LivePlayerScreenString.playbackFailed), findsOneWidget);
    expect(find.text(LivePlayerScreenString.retrySelectHint), findsOneWidget);
    expect(find.text(LivePlayerScreenString.retry), findsNothing);

    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('inactive failure surface shows the dark CHZZK icon only', (
    tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: LivePlayerStatusSurface.inactiveFailure(),
        ),
      ),
    );

    expect(find.text(LivePlayerScreenString.playbackFailed), findsNothing);
    expect(find.text(LivePlayerScreenString.retrySelectHint), findsNothing);
    expect(
      find.image(const AssetImage(AppAssetPaths.iconChzzkDark)),
      findsOneWidget,
    );

    await tester.pumpWidget(const SizedBox.shrink());
  });
}
