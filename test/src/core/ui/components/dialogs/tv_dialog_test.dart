import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/ui/ui.dart';

void main() {
  test('dialog design matches documented values', () {
    expect(TvDialogDesign.standardWidth, 412);
    expect(
      TvDialogDesign.standardPadding,
      const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
    );
    expect(
      TvDialogDesign.standardTitlePadding,
      const EdgeInsets.fromLTRB(32, 24, 32, 0),
    );
    expect(
      TvDialogDesign.standardContentPadding,
      const EdgeInsets.fromLTRB(32, 24, 32, 0),
    );
    expect(
      TvDialogDesign.standardActionsPadding,
      const EdgeInsets.fromLTRB(32, 24, 32, 24),
    );
    expect(TvDialogDesign.standardGap, 24);
    expect(TvDialogDesign.standardActionHeight, 40);
    expect(TvDialogDesign.standardActionSize, const Size(168, 40));
    expect(TvDialogDesign.standardActionFullWidth, 348);
    expect(TvDialogDesign.standardElevation, 4);
    expect(TvDialogDesign.standardRadius, TvRadius.md.borderRadius);
    expect(TvDialogDesign.actionRadius, TvRadius.sm.borderRadius);
    expect(TvDialogDesign.focusedActionScale, TvFocusedScale.sm.value);
    expect(TvDialogDesign.fullScreenWidth, 480);
    expect(TvDialogDesign.iconContainerSize, 48);
    expect(TvDialogDesign.iconSize, 24);
    expect(TvDialogDesign.iconTitleGap, 32);
    expect(TvDialogDesign.titleContentGap, 16);
    expect(TvDialogDesign.contentActionGap, 48);
    expect(TvDialogDesign.actionsGap, 12);
    expect(
      TvDialogDesign.iconRadius,
      const BorderRadius.all(Radius.circular(24)),
    );
  });

  testWidgets('standard alert renders two actions and calls primary', (
    tester,
  ) async {
    var primaryPressed = 0;

    await tester.pumpWidget(
      _DialogHarness(
        child: TvDialog(
          type: TvDialogType.alert,
          title: 'Delete',
          content: 'Delete this group?',
          primaryLabel: 'Delete',
          onPrimaryPressed: () => primaryPressed += 1,
          secondaryLabel: 'Cancel',
          onSecondaryPressed: () {},
          showScrim: false,
        ),
      ),
    );

    await tester.tap(find.text('Delete').last);
    await tester.tap(find.text('Delete').last);

    expect(primaryPressed, 1);
    expect(find.text('Cancel'), findsOneWidget);
    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.byType(FilledButton), findsNWidgets(2));
    expect(find.byType(TextButton), findsNothing);
    expect(
      tester.getSize(find.byType(TvDialog)).width,
      TvDialogDesign.standardWidth,
    );
  });

  testWidgets('confirm renders one action', (tester) async {
    await tester.pumpWidget(
      _DialogHarness(
        child: TvDialog(
          type: TvDialogType.confirm,
          title: 'Blocked',
          content: 'Cannot play this video.',
          primaryLabel: 'OK',
          onPrimaryPressed: () {},
          showScrim: false,
        ),
      ),
    );

    expect(find.text('OK'), findsOneWidget);
    expect(find.text('Cancel'), findsNothing);
    expect(
      tester.getSize(find.byType(FilledButton)),
      const Size(
        TvDialogDesign.standardActionFullWidth,
        TvDialogDesign.standardActionHeight,
      ),
    );
  });

  testWidgets('full screen dialog renders icon and filled actions', (
    tester,
  ) async {
    await tester.pumpWidget(
      _DialogHarness(
        child: TvDialog(
          type: TvDialogType.alert,
          backgroundType: TvDialogBackgroundType.fullScreen,
          icon: Icons.logout,
          title: 'Sign out',
          content: 'Do you want to sign out?',
          primaryLabel: 'Sign out',
          onPrimaryPressed: () {},
          secondaryLabel: 'Cancel',
          onSecondaryPressed: () {},
          showScrim: false,
        ),
      ),
    );

    expect(find.byIcon(Icons.logout), findsOneWidget);
    expect(find.byType(FilledButton), findsNWidgets(2));
  });

  testWidgets('full screen dialog uses the app background', (
    tester,
  ) async {
    await tester.pumpWidget(
      _DialogHarness(
        child: TvDialog(
          type: TvDialogType.confirm,
          backgroundType: TvDialogBackgroundType.fullScreen,
          title: 'Signed out',
          content: 'You have signed out.',
          primaryLabel: 'OK',
          onPrimaryPressed: () {},
        ),
      ),
    );

    final scaffoldBackgroundColor = Theme.of(
      tester.element(find.byType(TvDialog)),
    ).scaffoldBackgroundColor;

    expect(find.byType(TvScrim), findsNothing);
    expect(tester.getSize(find.byType(FilledButton)).width, 480);
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is ColoredBox && widget.color == scaffoldBackgroundColor,
      ),
      findsOneWidget,
    );
  });

  testWidgets('showTvDialog returns the selected action result', (
    tester,
  ) async {
    TvDialogResult? result;

    await tester.pumpWidget(
      _DialogHarness(
        child: Builder(
          builder: (context) {
            return FilledButton(
              onPressed: () async {
                result = await showTvDialog(
                  context: context,
                  type: TvDialogType.alert,
                  title: 'Sign out',
                  content: 'Do you want to sign out?',
                  primaryLabel: 'Sign out',
                  secondaryLabel: 'Cancel',
                );
              },
              child: const Text('Open dialog'),
            );
          },
        ),
      ),
    );

    await tester.tap(find.text('Open dialog'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 200));

    expect(find.byType(TvDialog), findsOneWidget);

    await tester.tap(find.text('Sign out').last);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 200));

    expect(result, TvDialogResult.primary);
    expect(find.byType(TvDialog), findsNothing);
  });

  testWidgets('showTvDialog closes from system back', (tester) async {
    TvDialogResult? result;

    await tester.pumpWidget(
      _DialogHarness(
        child: Builder(
          builder: (context) {
            return FilledButton(
              onPressed: () async {
                result = await showTvDialog(
                  context: context,
                  type: TvDialogType.confirm,
                  title: 'Blocked',
                  content: 'Cannot play this video.',
                  primaryLabel: 'OK',
                );
              },
              child: const Text('Open dialog'),
            );
          },
        ),
      ),
    );

    await tester.tap(find.text('Open dialog'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 200));

    expect(find.byType(TvDialog), findsOneWidget);

    await tester.binding.handlePopRoute();
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 200));

    expect(result, isNull);
    expect(find.byType(TvDialog), findsNothing);
  });
}

class _DialogHarness extends StatelessWidget {
  const _DialogHarness({
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
        scaffoldBackgroundColor: AppColorTokens.screenBackgroundColor,
      ),
      home: Scaffold(
        body: Center(child: child),
      ),
    );
  }
}
