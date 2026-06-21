import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/ui/ui.dart';

void main() {
  test('regular list item design matches documented values', () {
    final oneLine = TvListItemDesign.regular(lineCount: 1);
    final twoLines = TvListItemDesign.regular(lineCount: 2);
    final threeLines = TvListItemDesign.regular(lineCount: 3);

    expect(oneLine.height, 48);
    expect(twoLines.height, 64);
    expect(threeLines.height, 80);
    expect(
      oneLine.padding,
      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    );
    expect(oneLine.slotGap, 8);
    expect(oneLine.iconSize, 32);
    expect(oneLine.trailingSlotSize, 24);
    expect(oneLine.itemGap, 4);
    expect(twoLines.itemGap, 8);
    expect(threeLines.itemGap, 12);
    expect(oneLine.focusedScale, TvFocusedScale.md.value);
    expect(oneLine.radius, TvRadius.md.borderRadius);
  });

  test('dense list item design matches documented values', () {
    final oneLine = TvListItemDesign.dense(lineCount: 1);
    final twoLines = TvListItemDesign.dense(lineCount: 2);
    final threeLines = TvListItemDesign.dense(lineCount: 3);

    expect(oneLine.height, 40);
    expect(twoLines.height, 56);
    expect(threeLines.height, 72);
    expect(
      oneLine.padding,
      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    );
    expect(oneLine.slotGap, 6);
    expect(oneLine.iconSize, 18);
    expect(oneLine.trailingSlotSize, 18);
    expect(oneLine.itemGap, 0);
    expect(twoLines.itemGap, 4);
    expect(threeLines.itemGap, 8);
    expect(oneLine.focusedScale, TvFocusedScale.standard.value);
  });

  test('list item design resolves documented state colors', () {
    final colorScheme = _darkColorScheme();
    final design = TvListItemDesign.regular(lineCount: 3);
    final standard = design.palette(
      colorScheme: colorScheme,
      focused: false,
      selected: false,
      enabled: true,
    );
    final focused = design.palette(
      colorScheme: colorScheme,
      focused: true,
      selected: false,
      enabled: true,
    );
    final selected = design.palette(
      colorScheme: colorScheme,
      focused: false,
      selected: true,
      enabled: true,
    );
    final disabled = design.palette(
      colorScheme: colorScheme,
      focused: false,
      selected: false,
      enabled: false,
    );

    expect(
      design.backgroundColor(
        colorScheme: colorScheme,
        focused: false,
        selected: false,
        enabled: true,
      ),
      Colors.transparent,
    );
    expect(
      design.backgroundColor(
        colorScheme: colorScheme,
        focused: true,
        selected: false,
        enabled: true,
      ),
      colorScheme.inverseSurface,
    );
    expect(
      design.backgroundColor(
        colorScheme: colorScheme,
        focused: false,
        selected: true,
        enabled: true,
      ),
      colorScheme.secondaryContainer,
    );
    expect(standard.title, colorScheme.onSurface);
    expect(standard.subtitle, colorScheme.onSurface.withValues(alpha: 0.8));
    expect(standard.action, colorScheme.outline);
    expect(standard.trailing, colorScheme.secondary);
    expect(focused.title, colorScheme.surface);
    expect(focused.action, colorScheme.surfaceContainerHighest);
    expect(focused.trailing, colorScheme.inversePrimary);
    expect(selected.title, colorScheme.onSecondaryContainer);
    expect(selected.action, colorScheme.secondary);
    expect(disabled.title, colorScheme.onSurface.withValues(alpha: 0.4));
    expect(disabled.subtitle, colorScheme.onSurface.withValues(alpha: 0.24));
  });

  testWidgets('regular list item renders slots and calls action', (
    tester,
  ) async {
    var pressed = 0;

    await tester.pumpWidget(
      _ListHarness(
        child: TvListItem(
          overline: 'Overline',
          title: 'Title',
          subtitle: 'Subtitle',
          icon: Icons.home,
          action: '1080p',
          trailing: const Icon(Icons.chevron_right),
          onPressed: () => pressed += 1,
        ),
      ),
    );

    await tester.tap(find.text('Title'));

    expect(pressed, 1);
    expect(find.text('Overline'), findsOneWidget);
    expect(find.text('Subtitle'), findsOneWidget);
    expect(find.text('1080p'), findsOneWidget);
    expect(find.byIcon(Icons.home), findsOneWidget);
    expect(find.byIcon(Icons.chevron_right), findsOneWidget);
    expect(find.byType(GestureDetector), findsOneWidget);
    expect(find.byType(ListTile), findsNothing);
    expect(find.byType(TextButton), findsNothing);
  });

  testWidgets('regular list item renders custom leading slot', (tester) async {
    await tester.pumpWidget(
      _ListHarness(
        child: TvListItem(
          title: 'Title',
          leading: const SizedBox.square(
            key: ValueKey('custom-leading'),
            dimension: 12,
          ),
          onPressed: () {},
        ),
      ),
    );

    expect(find.byKey(const ValueKey('custom-leading')), findsOneWidget);
    expect(find.byIcon(Icons.home), findsNothing);
  });

  testWidgets('regular list item renders custom title builder', (
    tester,
  ) async {
    await tester.pumpWidget(
      _ListHarness(
        child: TvListItem(
          title: 'Semantic title',
          titleBuilder: (context, style) => Text(
            'Custom title',
            key: const ValueKey('custom-title'),
            style: style,
          ),
          onPressed: () {},
        ),
      ),
    );

    final customTitle = tester.widget<Text>(
      find.byKey(const ValueKey('custom-title')),
    );

    expect(find.text('Custom title'), findsOneWidget);
    expect(find.text('Semantic title'), findsNothing);
    expect(customTitle.style?.color, isNotNull);
  });

  testWidgets('dense list item renders trailing icon only slot', (
    tester,
  ) async {
    await tester.pumpWidget(
      _ListHarness(
        child: TvDenseListItem(
          title: 'Dense',
          trailingIcon: Icons.check,
          onPressed: () {},
        ),
      ),
    );

    expect(find.text('Dense'), findsOneWidget);
    expect(find.byIcon(Icons.check), findsOneWidget);
    expect(
      (tester.getCenter(find.text('Dense')).dy -
              tester.getCenter(find.byType(TvDenseListItem)).dy)
          .abs(),
      lessThan(1),
    );
  });

  testWidgets('focused list item activates from select key', (tester) async {
    var pressed = 0;

    await tester.pumpWidget(
      _ListHarness(
        child: TvListItem(
          title: 'Selectable',
          autofocus: true,
          onPressed: () => pressed += 1,
        ),
      ),
    );
    await tester.pump();

    await tester.sendKeyEvent(LogicalKeyboardKey.select);

    expect(pressed, 1);
  });

  testWidgets('focused list item throttles rapid duplicate select keys', (
    tester,
  ) async {
    var pressed = 0;

    await tester.pumpWidget(
      _ListHarness(
        child: TvListItem(
          title: 'Selectable',
          autofocus: true,
          onPressed: () => pressed += 1,
        ),
      ),
    );
    await tester.pump();

    await tester.sendKeyEvent(LogicalKeyboardKey.select);
    await tester.sendKeyEvent(LogicalKeyboardKey.select);

    expect(pressed, 1);
  });

  testWidgets('list container and separators render documented surfaces', (
    tester,
  ) async {
    await tester.pumpWidget(
      const _ListHarness(
        child: TvListContainer(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TvListHeader(text: 'Header'),
              TvListSectionHeader(text: 'Section'),
              TvListDivider(),
            ],
          ),
        ),
      ),
    );

    expect(find.text('Header'), findsOneWidget);
    expect(find.text('Section'), findsOneWidget);
    expect(find.byType(Divider), findsOneWidget);
  });

  testWidgets('list header uses title typography unless dense', (
    tester,
  ) async {
    await tester.pumpWidget(
      const _ListHarness(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TvListHeader(text: 'Header'),
            TvListHeader(text: 'Dense header', dense: true),
          ],
        ),
      ),
    );

    final textTheme = Theme.of(
      tester.element(find.text('Header')),
    ).textTheme;
    final header = tester.widget<Text>(find.text('Header'));
    final denseHeader = tester.widget<Text>(find.text('Dense header'));

    expect(header.style?.fontSize, textTheme.titleLarge?.fontSize);
    expect(denseHeader.style?.fontSize, textTheme.labelMedium?.fontSize);
  });
}

ColorScheme _darkColorScheme() {
  return ColorScheme.fromSeed(
    seedColor: AppColorTokens.brandColor,
    brightness: Brightness.dark,
  );
}

class _ListHarness extends StatelessWidget {
  const _ListHarness({
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
