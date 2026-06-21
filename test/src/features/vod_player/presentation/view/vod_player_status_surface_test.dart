import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/player_shared/presentation/player_content/player_content.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod_player/presentation/view/vod_player_status_surface.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod_player/presentation/vod_player_screen_string.dart';

void main() {
  testWidgets(
    'loading surface shows CHZZK animation without loading text',
    (
      tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: VodPlayerStatusSurface.loading(),
          ),
        ),
      );

      expect(find.text(VodPlayerScreenString.loading), findsNothing);
      expect(find.byType(VodPlayerLoadingIndicator), findsOneWidget);
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
    },
  );
}
