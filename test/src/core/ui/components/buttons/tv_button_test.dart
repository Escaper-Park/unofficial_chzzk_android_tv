import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/ui/ui.dart';

void main() {
  test('tokens expose agreed values', () {
    expect(TvRadius.round.value, 40);
    expect(TvFocusedScale.md.value, 1.05);
    expect(AppColorTokens.brandColor, const Color.fromRGBO(0, 255, 163, 1));
  });

  test('label button design matches documented size values', () {
    final filled = TvButtonDesign.resolve(
      type: TvButtonType.filled,
      iconButtonSize: null,
    );
    final outline = TvButtonDesign.resolve(
      type: TvButtonType.outline,
      iconButtonSize: null,
    );

    expect(filled.height, 40);
    expect(
      filled.padding,
      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    );
    expect(filled.radius, TvRadius.round.borderRadius);
    expect(filled.iconSize, 18);
    expect(filled.focusedScale, TvFocusedScale.md.value);
    expect(filled.outlineWidth, 0);
    expect(outline.focusedScale, TvFocusedScale.lg.value);
    expect(outline.outlineWidth, 1);
  });

  test('icon button design matches documented size values', () {
    final small = TvButtonDesign.resolve(
      type: TvButtonType.filled,
      iconButtonSize: TvIconButtonSize.small,
    );
    final medium = TvButtonDesign.resolve(
      type: TvButtonType.filled,
      iconButtonSize: TvIconButtonSize.medium,
    );
    final large = TvButtonDesign.resolve(
      type: TvButtonType.outline,
      iconButtonSize: TvIconButtonSize.large,
    );

    expect(small.height, 28);
    expect(small.width, 28);
    expect(small.padding, const EdgeInsets.all(6));
    expect(small.iconSize, 16);
    expect(medium.height, 40);
    expect(medium.width, 40);
    expect(medium.padding, const EdgeInsets.all(10));
    expect(medium.iconSize, 20);
    expect(large.height, 56);
    expect(large.width, 56);
    expect(large.padding, const EdgeInsets.all(14));
    expect(large.iconSize, 28);
    expect(large.focusedScale, TvFocusedScale.lg.value);
    expect(large.outlineWidth, 1);
  });

  test('filled button style resolves documented state colors', () {
    final colorScheme = _darkColorScheme();
    final style = TvButtonDesign.resolve(
      type: TvButtonType.filled,
      iconButtonSize: null,
    ).style(colorScheme: colorScheme, selected: false);
    final selectedStyle = TvButtonDesign.resolve(
      type: TvButtonType.filled,
      iconButtonSize: null,
    ).style(colorScheme: colorScheme, selected: true);

    expect(
      style.backgroundColor!.resolve(<WidgetState>{}),
      colorScheme.surfaceContainerHighest,
    );
    expect(
      style.backgroundColor!.resolve({WidgetState.focused}),
      colorScheme.inverseSurface,
    );
    expect(
      selectedStyle.backgroundColor!.resolve(<WidgetState>{}),
      colorScheme.inverseSurface,
    );
    expect(
      style.backgroundColor!.resolve({WidgetState.pressed}),
      colorScheme.inverseSurface,
    );
    expect(
      style.foregroundColor!.resolve(<WidgetState>{}),
      colorScheme.inverseSurface.withValues(alpha: 0.8),
    );
    expect(
      style.foregroundColor!.resolve({WidgetState.focused}),
      colorScheme.onInverseSurface,
    );
    expect(
      style.foregroundColor!.resolve({WidgetState.disabled}),
      colorScheme.inverseSurface.withValues(alpha: 0.4),
    );
  });

  test('outline button style resolves documented outline states', () {
    final colorScheme = _darkColorScheme();
    final style = TvButtonDesign.resolve(
      type: TvButtonType.outline,
      iconButtonSize: null,
    ).style(colorScheme: colorScheme, selected: false);
    final selectedStyle = TvButtonDesign.resolve(
      type: TvButtonType.outline,
      iconButtonSize: null,
    ).style(colorScheme: colorScheme, selected: true);

    expect(
      style.backgroundColor!.resolve(<WidgetState>{}),
      Colors.transparent,
    );
    expect(
      style.backgroundColor!.resolve({WidgetState.focused}),
      colorScheme.inverseSurface,
    );
    expect(
      style.side!.resolve(<WidgetState>{}),
      BorderSide(color: colorScheme.onSurfaceVariant),
    );
    expect(
      style.side!.resolve({WidgetState.focused}),
      BorderSide(color: colorScheme.outline),
    );
    expect(
      selectedStyle.side!.resolve(<WidgetState>{}),
      BorderSide(color: colorScheme.outline),
    );
    expect(
      style.side!.resolve({WidgetState.pressed}),
      BorderSide(color: colorScheme.outline),
    );
    expect(
      style.side!.resolve({WidgetState.disabled}),
      BorderSide(color: colorScheme.onSurfaceVariant),
    );
  });

  testWidgets('label button renders text and calls action', (tester) async {
    var pressed = 0;

    await tester.pumpWidget(
      _ButtonHarness(
        child: TvButton.label(
          text: 'Play',
          icon: Icons.play_arrow,
          onPressed: () => pressed += 1,
        ),
      ),
    );

    await tester.tap(find.text('Play'));

    expect(pressed, 1);
    expect(find.byIcon(Icons.play_arrow), findsOneWidget);
    expect(tester.getSize(find.byType(FilledButton)).height, 40);
  });

  testWidgets('label button throttles rapid duplicate activation', (
    tester,
  ) async {
    var pressed = 0;

    await tester.pumpWidget(
      _ButtonHarness(
        child: TvButton.label(
          text: 'Play',
          onPressed: () => pressed += 1,
        ),
      ),
    );

    await tester.tap(find.text('Play'));
    await tester.tap(find.text('Play'));

    expect(pressed, 1);
  });

  testWidgets('label button allows rapid activation when guard is disabled', (
    tester,
  ) async {
    var pressed = 0;

    await tester.pumpWidget(
      _ButtonHarness(
        child: TvButton.label(
          text: 'Play',
          onPressed: () => pressed += 1,
          guardActivations: false,
        ),
      ),
    );

    await tester.tap(find.text('Play'));
    await tester.tap(find.text('Play'));

    expect(pressed, 2);
  });

  testWidgets('icon button renders fixed size and calls action', (
    tester,
  ) async {
    var pressed = 0;

    await tester.pumpWidget(
      _ButtonHarness(
        child: TvButton.icon(
          icon: Icons.search,
          iconButtonSize: TvIconButtonSize.medium,
          onPressed: () => pressed += 1,
        ),
      ),
    );

    await tester.tap(find.byIcon(Icons.search));

    expect(pressed, 1);
    expect(tester.getSize(find.byType(IconButton)), const Size(40, 40));
  });

  testWidgets('button can skip focus scale animation', (tester) async {
    await tester.pumpWidget(
      _ButtonHarness(
        child: TvButton.icon(
          icon: Icons.search,
          onPressed: () {},
          animateFocus: false,
        ),
      ),
    );

    expect(find.byType(IconButton), findsOneWidget);
    expect(find.byType(AnimatedScale), findsNothing);
  });

  testWidgets('disabled button does not call action', (tester) async {
    var pressed = 0;

    await tester.pumpWidget(
      _ButtonHarness(
        child: TvButton.label(
          text: 'Disabled',
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

class _ButtonHarness extends StatelessWidget {
  const _ButtonHarness({
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
