import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/ui/ui.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live_player/presentation/view/live_player_overlay_realtime_info_content.dart';
import 'package:unofficial_chzzk_android_tv/src/features/player_shared/presentation/overlay_controls/overlay_controls.dart';

void main() {
  test('overlay controls design separates band and content height', () {
    expect(TvPlayerOverlayControlsDesign.containerHeight, 108);
    expect(TvPlayerOverlayControlsDesign.bandHeight, 156);
    expect(TvPlayerOverlayControlsDesign.actionItemWidth, 52);
    expect(TvPlayerOverlayControlsDesign.liveInfoElapsedTextWidth, 56);
  });

  testWidgets('live realtime info keeps tags left and metrics right', (
    tester,
  ) async {
    await tester.pumpWidget(
      const _OverlayInfoHarness(
        child: SizedBox(
          width: 420,
          child: LiveOverlayRealtimeInfoContent(
            tags: ['Game'],
            viewerCountText: '1,234',
            elapsedText: '00:10:00',
          ),
        ),
      ),
    );

    expect(find.text('Game'), findsOneWidget);
    expect(find.text('1,234'), findsOneWidget);
    expect(find.text('00:10:00'), findsOneWidget);
    expect(find.byIcon(Icons.person_outline), findsOneWidget);
    expect(find.byIcon(Icons.schedule), findsOneWidget);

    final info = find.byType(LiveOverlayRealtimeInfoContent);
    final tagLeft = tester.getTopLeft(find.text('Game')).dx;
    final viewerLeft = tester.getTopLeft(find.text('1,234')).dx;
    final elapsedRight = tester.getTopRight(find.text('00:10:00')).dx;
    final infoRight = tester.getTopRight(info).dx;

    expect(tester.getSize(info).height, 20);
    expect(tagLeft, lessThan(viewerLeft));
    expect((infoRight - elapsedRight).abs(), lessThan(2));
    expect(
      find.ancestor(
        of: find.text('00:10:00'),
        matching: find.byWidgetPredicate(
          (widget) =>
              widget is SizedBox &&
              widget.width ==
                  TvPlayerOverlayControlsDesign.liveInfoElapsedTextWidth,
        ),
      ),
      findsOneWidget,
    );
  });
}

class _OverlayInfoHarness extends StatelessWidget {
  const _OverlayInfoHarness({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColorTokens.brandColor,
          brightness: Brightness.dark,
        ),
      ),
      home: Scaffold(body: Center(child: child)),
    );
  }
}
