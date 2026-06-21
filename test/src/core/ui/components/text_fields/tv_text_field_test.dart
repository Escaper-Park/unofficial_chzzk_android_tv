import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/ui/ui.dart';

void main() {
  test('text field design matches documented values', () {
    final design = TvTextFieldDesign.standard();

    expect(design.fieldHeight, 48);
    expect(
      design.fieldPadding,
      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    );
    expect(design.gap, 6);
    expect(design.radius, TvRadius.md.borderRadius);
    expect(design.outlineWidth, 2);
    expect(design.focusedScale, TvFocusedScale.standard.value);
    expect(design.cursorWidth, 2);
    expect(design.cursorHeight, 20);
    expect(design.cursorGap, 2);
    expect(
      design.cursorBlinkInterval,
      const Duration(milliseconds: 530),
    );
  });

  test('text field design resolves documented colors', () {
    final colorScheme = _darkColorScheme();
    final design = TvTextFieldDesign.standard();

    expect(
      design.fieldBackgroundColor(
        colorScheme: colorScheme,
        focused: false,
        active: false,
      ),
      Colors.transparent,
    );
    expect(
      design.fieldBackgroundColor(
        colorScheme: colorScheme,
        focused: true,
        active: false,
      ),
      colorScheme.onInverseSurface,
    );
    expect(
      design.fieldBackgroundColor(
        colorScheme: colorScheme,
        focused: true,
        active: true,
      ),
      colorScheme.onInverseSurface,
    );
    expect(
      design.outlineColor(colorScheme: colorScheme, active: false),
      colorScheme.outline,
    );
    expect(
      design.outlineColor(colorScheme: colorScheme, active: true),
      colorScheme.primary,
    );
    expect(
      design.labelColor(colorScheme: colorScheme, active: false),
      colorScheme.onSurfaceVariant,
    );
    expect(
      design.labelColor(colorScheme: colorScheme, active: true),
      colorScheme.primary,
    );
    expect(
      design.supportingTextColor(colorScheme),
      colorScheme.onSurfaceVariant,
    );
    expect(
      design.inputTextColor(colorScheme: colorScheme, showingHint: false),
      colorScheme.onSurface,
    );
    expect(
      design.inputTextColor(colorScheme: colorScheme, showingHint: true),
      colorScheme.onSurface.withValues(alpha: 0.6),
    );
  });

  testWidgets('text field renders label value and supporting text', (
    tester,
  ) async {
    var pressed = 0;

    await tester.pumpWidget(
      _TextFieldHarness(
        child: TvTextField(
          label: 'ID',
          value: 'viewer',
          supportingText: 'Required',
          onPressed: () => pressed += 1,
        ),
      ),
    );

    await tester.tap(find.text('viewer'));

    expect(pressed, 1);
    expect(find.text('ID'), findsOneWidget);
    expect(find.text('viewer'), findsOneWidget);
    expect(find.text('Required'), findsOneWidget);
    expect(find.byType(InputDecorator), findsOneWidget);
    expect(find.byType(TextButton), findsNothing);
  });

  testWidgets('text field throttles rapid duplicate activation', (
    tester,
  ) async {
    var pressed = 0;

    await tester.pumpWidget(
      _TextFieldHarness(
        child: TvTextField(
          value: 'viewer',
          onPressed: () => pressed += 1,
        ),
      ),
    );

    await tester.tap(find.text('viewer'));
    await tester.tap(find.text('viewer'));

    expect(pressed, 1);
  });

  testWidgets('active text field hides hint and blinks trailing cursor', (
    tester,
  ) async {
    await tester.pumpWidget(
      _TextFieldHarness(
        child: TvTextField(
          value: '',
          hintText: 'Search',
          active: true,
          onPressed: () {},
        ),
      ),
    );

    final cursor = find.byKey(const Key('tv-text-field-cursor'));
    expect(find.text('Search'), findsNothing);
    expect(cursor, findsOneWidget);
    expect(
      tester.widget<Opacity>(
        find.ancestor(of: cursor, matching: find.byType(Opacity)),
      ),
      isA<Opacity>().having((opacity) => opacity.opacity, 'opacity', 1),
    );

    await tester.pump(TvTextFieldDesign.standard().cursorBlinkInterval);

    expect(
      tester.widget<Opacity>(
        find.ancestor(of: cursor, matching: find.byType(Opacity)),
      ),
      isA<Opacity>().having((opacity) => opacity.opacity, 'opacity', 0),
    );
  });

  testWidgets('empty text field shows hint only when configured', (
    tester,
  ) async {
    await tester.pumpWidget(
      _TextFieldHarness(
        child: TvTextField(
          value: '',
          hintText: 'Search',
          onPressed: () {},
        ),
      ),
    );

    expect(find.text('Search'), findsOneWidget);

    await tester.pumpWidget(
      _TextFieldHarness(
        child: TvTextField(
          value: '',
          hintText: 'Search',
          showHint: false,
          onPressed: () {},
        ),
      ),
    );

    expect(find.text('Search'), findsNothing);
  });

  testWidgets('text field can use an externally owned focus node', (
    tester,
  ) async {
    final focusNode = FocusNode();
    addTearDown(focusNode.dispose);

    await tester.pumpWidget(
      _TextFieldHarness(
        child: TvTextField(
          value: 'viewer',
          focusNode: focusNode,
          onPressed: () {},
        ),
      ),
    );

    focusNode.requestFocus();
    await tester.pump();

    expect(focusNode.hasFocus, isTrue);
  });
}

ColorScheme _darkColorScheme() {
  return ColorScheme.fromSeed(
    seedColor: AppColorTokens.brandColor,
    brightness: Brightness.dark,
  );
}

class _TextFieldHarness extends StatelessWidget {
  const _TextFieldHarness({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: _darkColorScheme(),
      ),
      home: Scaffold(
        body: Center(child: child),
      ),
    );
  }
}
