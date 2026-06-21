import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/ui/ui.dart';

void main() {
  test('snackbar design matches documented values', () {
    final text = TvSnackbarDesign.resolve(hasIcon: false, maxLines: 1);
    final iconOneLine = TvSnackbarDesign.resolve(hasIcon: true, maxLines: 1);
    final iconTwoLines = TvSnackbarDesign.resolve(hasIcon: true, maxLines: 2);

    expect(TvSnackbarDesign.duration, const Duration(milliseconds: 2000));
    expect(
      TvSnackbarDesign.outsideSpacing,
      const EdgeInsets.symmetric(vertical: 24),
    );
    expect(text.width, 556);
    expect(text.height, 44);
    expect(
      text.padding,
      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    );
    expect(iconOneLine.height, 56);
    expect(iconTwoLines.height, 64);
    expect(iconOneLine.padding, const EdgeInsets.fromLTRB(16, 12, 24, 12));
    expect(iconOneLine.iconContainerSize, 32);
    expect(iconOneLine.iconPadding, const EdgeInsets.all(8));
    expect(
      iconOneLine.iconContainerRadius,
      const BorderRadius.all(Radius.circular(24)),
    );
    expect(iconOneLine.iconSize, 16);
    expect(iconOneLine.iconTextGap, 8);
    expect(iconTwoLines.maxLines, 2);
  });

  testWidgets('snackbar renders message without action', (tester) async {
    await tester.pumpWidget(
      const _SnackbarHarness(
        child: TvSnackbar(message: 'Saved', alignToBottom: false),
      ),
    );

    expect(find.text('Saved'), findsOneWidget);
    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.byType(TextButton), findsNothing);
  });

  testWidgets('snackbar renders icon variant', (tester) async {
    await tester.pumpWidget(
      const _SnackbarHarness(
        child: TvSnackbar(
          message: 'Two line message',
          icon: Icons.info,
          maxLines: 2,
          alignToBottom: false,
        ),
      ),
    );

    expect(find.byIcon(Icons.info), findsOneWidget);
    expect(tester.getSize(find.byType(TvSnackbar)), const Size(556, 64));
  });
}

class _SnackbarHarness extends StatelessWidget {
  const _SnackbarHarness({
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
      home: Scaffold(
        body: Center(child: child),
      ),
    );
  }
}
