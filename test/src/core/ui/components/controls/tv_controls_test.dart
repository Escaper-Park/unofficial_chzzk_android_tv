import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/ui/ui.dart';

void main() {
  test('control design exposes documented sizes', () {
    expect(TvControlDesign.containerSize(TvControlSize.standard), 24);
    expect(TvControlDesign.containerSize(TvControlSize.large), 32);
    expect(
      TvControlDesign.switchSize(TvControlSize.standard),
      const Size(30, 18),
    );
    expect(TvControlDesign.switchSize(TvControlSize.large), const Size(40, 24));
    expect(
      TvControlDesign.materialSwitchTrackSize,
      const Size(52, 32),
    );
  });

  test('selection controls resolve documented colors', () {
    final colorScheme = _darkColorScheme();

    expect(
      TvControlDesign.selectionColor(
        colorScheme: colorScheme,
        focused: true,
        selected: false,
      ),
      colorScheme.surfaceContainerHighest,
    );
    expect(
      TvControlDesign.selectionColor(
        colorScheme: colorScheme,
        focused: true,
        selected: true,
      ),
      colorScheme.inversePrimary,
    );
    expect(
      TvControlDesign.selectionColor(
        colorScheme: colorScheme,
        focused: false,
        selected: false,
      ),
      colorScheme.outline,
    );
    expect(
      TvControlDesign.selectionColor(
        colorScheme: colorScheme,
        focused: false,
        selected: true,
      ),
      colorScheme.secondary,
    );
  });

  test('switch and checkmark resolve documented colors', () {
    final colorScheme = _darkColorScheme();
    final focusedSelected = TvControlDesign.switchPalette(
      colorScheme: colorScheme,
      focused: true,
      selected: true,
    );
    final selected = TvControlDesign.switchPalette(
      colorScheme: colorScheme,
      focused: false,
      selected: true,
    );

    expect(focusedSelected.track, colorScheme.inversePrimary);
    expect(focusedSelected.handle, colorScheme.onPrimaryContainer);
    expect(focusedSelected.stroke, Colors.transparent);
    expect(selected.track, colorScheme.primary);
    expect(selected.handle, colorScheme.primaryContainer);
    expect(selected.stroke, Colors.transparent);
    expect(
      TvControlDesign.checkmarkColor(
        colorScheme: colorScheme,
        focused: true,
      ),
      colorScheme.inversePrimary,
    );
    expect(
      TvControlDesign.checkmarkColor(
        colorScheme: colorScheme,
        focused: false,
      ),
      colorScheme.secondary,
    );
  });

  testWidgets('controls render documented sizes', (tester) async {
    await tester.pumpWidget(
      const _ControlsHarness(
        child: Row(
          children: [
            TvCheckbox(selected: true),
            TvRadioButton(selected: true, size: TvControlSize.large),
            TvSwitch(selected: true),
            TvSwitch(selected: false, size: TvControlSize.large),
            TvCheckmark(),
          ],
        ),
      ),
    );

    expect(tester.getSize(find.byType(TvCheckbox)), const Size(24, 24));
    expect(tester.getSize(find.byType(TvRadioButton)), const Size(32, 32));
    expect(tester.getSize(find.byType(TvSwitch).first), const Size(30, 18));
    expect(tester.getSize(find.byType(TvSwitch).last), const Size(40, 24));
    expect(tester.getSize(find.byType(TvCheckmark)), const Size(24, 24));

    expect(find.byType(Checkbox), findsOneWidget);
    expect(find.byType(Radio<int>), findsOneWidget);
    expect(find.byType(Switch), findsNWidgets(2));
  });

  testWidgets('rounded checkbox uses a 20 radius', (tester) async {
    await tester.pumpWidget(
      const _ControlsHarness(
        child: TvCheckbox(
          selected: true,
          shape: TvCheckboxShape.rounded,
        ),
      ),
    );

    final checkbox = tester.widget<Checkbox>(find.byType(Checkbox));
    final shape = checkbox.shape;

    expect(shape, isA<RoundedRectangleBorder>());
    expect(
      (shape! as RoundedRectangleBorder).borderRadius,
      BorderRadius.circular(20),
    );
  });

  testWidgets('slider renders as material slider', (tester) async {
    await tester.pumpWidget(
      _ControlsHarness(
        child: TvSlider(
          value: 2,
          min: 0,
          max: 1,
          onChanged: (_) {},
        ),
      ),
    );

    expect(find.byType(Slider), findsOneWidget);
  });

  testWidgets('slider changes value with left and right keys', (tester) async {
    var value = 0.5;

    await tester.pumpWidget(
      _ControlsHarness(
        child: StatefulBuilder(
          builder: (context, setState) {
            return TvSlider(
              value: value,
              divisions: 10,
              autofocus: true,
              onChanged: (next) => setState(() => value = next),
            );
          },
        ),
      ),
    );

    await tester.pump();
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
    await tester.pump();

    expect(value, closeTo(0.6, 0.001));

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
    await tester.pump();

    expect(value, closeTo(0.5, 0.001));
  });

  testWidgets('slider can wrap keyboard changes when enabled', (tester) async {
    var value = 2.0;

    await tester.pumpWidget(
      _ControlsHarness(
        child: StatefulBuilder(
          builder: (context, setState) {
            return TvSlider(
              value: value,
              min: 0,
              max: 2,
              divisions: 2,
              step: 1,
              wraps: true,
              autofocus: true,
              onChanged: (next) => setState(() => value = next),
            );
          },
        ),
      ),
    );

    await tester.pump();
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
    await tester.pump();

    expect(value, 0);

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
    await tester.pump();

    expect(value, 2);
  });

  testWidgets('slider calls change end on key up', (tester) async {
    var value = 0.5;
    double? endedValue;

    await tester.pumpWidget(
      _ControlsHarness(
        child: StatefulBuilder(
          builder: (context, setState) {
            return TvSlider(
              value: value,
              divisions: 10,
              autofocus: true,
              onChanged: (next) => setState(() => value = next),
              onChangeEnd: (next) => endedValue = next,
            );
          },
        ),
      ),
    );

    await tester.pump();
    await tester.sendKeyDownEvent(LogicalKeyboardKey.arrowRight);
    await tester.pump();

    expect(value, closeTo(0.6, 0.001));
    expect(endedValue, isNull);

    await tester.sendKeyUpEvent(LogicalKeyboardKey.arrowRight);
    await tester.pump();

    expect(endedValue, closeTo(0.6, 0.001));
  });
}

ColorScheme _darkColorScheme() {
  return ColorScheme.fromSeed(
    seedColor: AppColorTokens.brandColor,
    brightness: Brightness.dark,
  );
}

class _ControlsHarness extends StatelessWidget {
  const _ControlsHarness({
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
