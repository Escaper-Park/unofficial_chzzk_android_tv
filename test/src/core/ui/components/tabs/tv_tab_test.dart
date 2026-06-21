import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/ui/ui.dart';

void main() {
  test('tab design matches documented common values', () {
    final labelOnly = TvTabDesign.resolve(
      variant: TvTabVariant.primary,
      showLabel: true,
      showIcon: false,
    );
    final iconOnly = TvTabDesign.resolve(
      variant: TvTabVariant.primary,
      showLabel: false,
      showIcon: true,
    );
    final iconAndLabel = TvTabDesign.resolve(
      variant: TvTabVariant.secondary,
      showLabel: true,
      showIcon: true,
    );

    expect(labelOnly.height, 32);
    expect(
      labelOnly.padding,
      const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
    );
    expect(labelOnly.radius, TvRadius.xl.borderRadius);
    expect(labelOnly.iconSize, 18);
    expect(labelOnly.iconTextGap, 6);
    expect(labelOnly.focusedScale, TvFocusedScale.standard.value);
    expect(
      iconOnly.padding,
      const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
    );
    expect(iconAndLabel.padding, const EdgeInsets.fromLTRB(12, 6, 16, 6));
  });

  test('primary tab style resolves documented state colors', () {
    final colorScheme = _darkColorScheme();
    final style =
        TvTabDesign.resolve(
          variant: TvTabVariant.primary,
          showLabel: true,
          showIcon: false,
        ).style(
          colorScheme: colorScheme,
          selected: false,
          defaultTextStyle: const TextStyle(),
        );
    final selectedStyle =
        TvTabDesign.resolve(
          variant: TvTabVariant.primary,
          showLabel: true,
          showIcon: false,
        ).style(
          colorScheme: colorScheme,
          selected: true,
          defaultTextStyle: const TextStyle(),
        );

    expect(style.backgroundColor!.resolve(<WidgetState>{}), Colors.transparent);
    expect(
      style.backgroundColor!.resolve({WidgetState.focused}),
      colorScheme.inverseSurface,
    );
    expect(
      selectedStyle.backgroundColor!.resolve(<WidgetState>{}),
      colorScheme.secondaryContainer,
    );
    expect(
      style.foregroundColor!.resolve(<WidgetState>{}),
      colorScheme.onSurface,
    );
    expect(
      style.foregroundColor!.resolve({WidgetState.focused}),
      colorScheme.onInverseSurface,
    );
    expect(
      selectedStyle.foregroundColor!.resolve(<WidgetState>{}),
      colorScheme.onSecondaryContainer,
    );
    expect(
      style.foregroundColor!.resolve({WidgetState.disabled}),
      colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
    );
  });

  test('secondary tab style resolves underline values', () {
    final colorScheme = _darkColorScheme();
    final design = TvTabDesign.resolve(
      variant: TvTabVariant.secondary,
      showLabel: true,
      showIcon: false,
    );
    final style = design.style(
      colorScheme: colorScheme,
      selected: false,
      defaultTextStyle: const TextStyle(),
    );
    final selectedStyle = design.style(
      colorScheme: colorScheme,
      selected: true,
      defaultTextStyle: const TextStyle(),
    );

    expect(style.backgroundColor!.resolve(<WidgetState>{}), Colors.transparent);
    expect(
      style.foregroundColor!.resolve(<WidgetState>{}),
      colorScheme.onSurface,
    );
    expect(
      style.foregroundColor!.resolve({WidgetState.focused}),
      colorScheme.primary,
    );
    expect(
      selectedStyle.foregroundColor!.resolve(<WidgetState>{}),
      colorScheme.secondary,
    );
    expect(design.underlineHeight, 2);
    expect(
      design.underlineWidth(focused: true, selected: false),
      TvTabDesign.focusedUnderlineWidth,
    );
    expect(design.underlineWidth(focused: false, selected: true), 8);
    expect(design.underlineWidth(focused: false, selected: false), isNull);
  });

  testWidgets('secondary tab focused underline fills the tab width', (
    tester,
  ) async {
    final colorScheme = _darkColorScheme();

    await tester.pumpWidget(
      _TabHarness(
        child: TvTab(
          label: 'Live',
          variant: TvTabVariant.secondary,
          onPressed: () {},
        ),
      ),
    );

    tester
        .widget<TextButton>(find.byType(TextButton))
        .focusNode!
        .requestFocus();
    await tester.pump();

    final underline = find.descendant(
      of: find.byType(TextButton),
      matching: find.byWidgetPredicate((widget) {
        return widget is DecoratedBox &&
            widget.decoration is BoxDecoration &&
            (widget.decoration as BoxDecoration).color == colorScheme.primary;
      }),
    );
    final tabContent = find.descendant(
      of: find.byType(TextButton),
      matching: find.byType(Stack),
    );

    expect(underline, findsOneWidget);
    expect(tabContent, findsOneWidget);
    expect(
      tester.getSize(underline).width,
      tester.getSize(tabContent).width,
    );
  });

  testWidgets('tab renders configured content and calls action', (
    tester,
  ) async {
    var pressed = 0;

    await tester.pumpWidget(
      _TabHarness(
        child: TvTab(
          label: 'Home',
          icon: Icons.home,
          showIcon: true,
          onPressed: () => pressed += 1,
        ),
      ),
    );

    await tester.tap(find.text('Home'));

    expect(pressed, 1);
    expect(find.byIcon(Icons.home), findsOneWidget);
  });

  testWidgets('tab throttles rapid duplicate activation', (tester) async {
    var pressed = 0;

    await tester.pumpWidget(
      _TabHarness(
        child: TvTab(
          label: 'Home',
          onPressed: () => pressed += 1,
        ),
      ),
    );

    await tester.tap(find.text('Home'));
    await tester.tap(find.text('Home'));

    expect(pressed, 1);
  });

  testWidgets('disabled tab does not call action', (tester) async {
    var pressed = 0;

    await tester.pumpWidget(
      _TabHarness(
        child: TvTab(
          label: 'Disabled',
          enabled: false,
          onPressed: () => pressed += 1,
        ),
      ),
    );

    await tester.tap(find.text('Disabled'));

    expect(pressed, 0);
  });
}

ColorScheme _darkColorScheme() {
  return ColorScheme.fromSeed(
    seedColor: AppColorTokens.brandColor,
    brightness: Brightness.dark,
  );
}

class _TabHarness extends StatelessWidget {
  const _TabHarness({
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
