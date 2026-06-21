import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/ui/ui.dart';

void main() {
  test('modal panel design matches documented values', () {
    expect(TvModalPanelDesign.standardWidth, 216);
    expect(TvModalPanelDesign.standardMaxHeight, 320);
    expect(
      TvModalPanelDesign.standardOuterSpacing,
      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    );
    expect(TvModalPanelDesign.standardHeaderSize, const Size(216, 36));
    expect(
      TvModalPanelDesign.standardHeaderPadding,
      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    );
    expect(
      TvModalPanelDesign.standardListPadding,
      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    );
    expect(TvModalPanelDesign.standardDividerWeight, 1);
    expect(TvModalPanelDesign.largeWidth, 400);
    expect(
      TvModalPanelDesign.largePadding,
      const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
    );
    expect(TvModalPanelDesign.largeHeaderItemGap, 24);
    expect(TvModalPanelDesign.largeItemGap, 4);
    expect(TvModalPanelDesign.itemFocusedScale, TvFocusedScale.standard.value);
    expect(TvModalPanelDesign.radius, TvRadius.xl.borderRadius);
    expect(TvModalPanelDesign.largeRadius, BorderRadius.zero);
  });

  testWidgets('standard modal panel renders dense list content', (
    tester,
  ) async {
    await tester.pumpWidget(
      const _ModalPanelHarness(
        child: TvModalPanel(
          type: TvModalPanelType.standard,
          header: 'Sort',
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TvDenseListItem(title: 'Popular', onPressed: _noop),
              TvDenseListItem(title: 'Latest', onPressed: _noop),
            ],
          ),
        ),
      ),
    );

    expect(find.text('Sort'), findsOneWidget);
    expect(find.text('Popular'), findsOneWidget);
  });

  testWidgets('large modal panel renders full-height surface', (tester) async {
    await tester.pumpWidget(
      const _ModalPanelHarness(
        child: TvModalPanel(
          type: TvModalPanelType.large,
          header: 'Settings',
          child: TvListItem(title: 'Quality', onPressed: _noop),
        ),
      ),
    );

    expect(find.text('Settings'), findsOneWidget);
    expect(find.text('Quality'), findsOneWidget);

    final surface = find
        .ancestor(
          of: find.text('Settings'),
          matching: find.byType(DecoratedBox),
        )
        .first;
    final decoration =
        tester.widget<DecoratedBox>(surface).decoration as BoxDecoration;
    final screenSize = tester.getSize(find.byType(Scaffold));

    expect(tester.getSize(surface).width, TvModalPanelDesign.largeWidth);
    expect(tester.getSize(surface).height, screenSize.height);
    expect(tester.getTopLeft(surface).dx, screenSize.width - 400);
    expect(tester.getTopLeft(surface).dy, 0);
    expect(decoration.borderRadius, BorderRadius.zero);
  });

  testWidgets('modal panel can follow an anchor link', (tester) async {
    final link = LayerLink();

    await tester.pumpWidget(
      _ModalPanelHarness(
        child: Stack(
          children: [
            CompositedTransformTarget(
              link: link,
              child: const SizedBox(width: 120, height: 80),
            ),
            TvModalPanel(
              type: TvModalPanelType.standard,
              header: 'Actions',
              showScrim: true,
              anchorLink: link,
              anchorOffset: const Offset(20, 0),
              child: const TvDenseListItem(
                title: 'Open',
                onPressed: _noop,
              ),
            ),
          ],
        ),
      ),
    );

    final follower = tester.widget<CompositedTransformFollower>(
      find.byType(CompositedTransformFollower),
    );

    expect(follower.link, link);
    expect(follower.offset, const Offset(20, 0));
    expect(find.text('Actions'), findsOneWidget);
  });

  testWidgets('standard modal panel keeps list item focus scale at 1.00', (
    tester,
  ) async {
    final focusNode = FocusNode();
    addTearDown(focusNode.dispose);

    await tester.pumpWidget(
      _ModalPanelHarness(
        child: TvModalPanel(
          type: TvModalPanelType.standard,
          header: 'Sort',
          child: TvListItem(
            title: 'Popular',
            focusNode: focusNode,
            onPressed: _noop,
          ),
        ),
      ),
    );

    focusNode.requestFocus();
    await tester.pump();

    expect(_scaleForText(tester, 'Popular'), 1);
  });

  testWidgets('large modal panel keeps list item focus scale at 1.00', (
    tester,
  ) async {
    final focusNode = FocusNode();
    addTearDown(focusNode.dispose);

    await tester.pumpWidget(
      _ModalPanelHarness(
        child: TvModalPanel(
          type: TvModalPanelType.large,
          header: 'Settings',
          child: TvListItem(
            title: 'Quality',
            focusNode: focusNode,
            onPressed: _noop,
          ),
        ),
      ),
    );

    focusNode.requestFocus();
    await tester.pump();

    expect(_scaleForText(tester, 'Quality'), 1);
  });

  testWidgets('back dismisses modal panel when callback is provided', (
    tester,
  ) async {
    var dismissed = 0;

    await tester.pumpWidget(
      _ModalPanelHarness(
        child: TvModalPanel(
          type: TvModalPanelType.standard,
          header: 'Sort',
          onDismiss: () => dismissed += 1,
          child: TvDenseListItem(title: 'Popular', onPressed: () {}),
        ),
      ),
    );

    await tester.binding.handlePopRoute();
    await tester.pump();

    expect(dismissed, 1);
  });

  testWidgets('back dismiss ignores an unmounted opener focus node', (
    tester,
  ) async {
    final openerNode = FocusNode(debugLabel: 'unmounted opener');
    addTearDown(openerNode.dispose);

    var dismissed = 0;

    await tester.pumpWidget(
      _ModalPanelHarness(
        child: TvModalPanel(
          type: TvModalPanelType.standard,
          header: 'Sort',
          openerFocusNode: openerNode,
          onDismiss: () => dismissed += 1,
          child: TvDenseListItem(title: 'Popular', onPressed: () {}),
        ),
      ),
    );

    await tester.binding.handlePopRoute();
    await tester.pump();

    expect(dismissed, 1);
    expect(openerNode.hasFocus, isFalse);
  });
}

void _noop() {}

double _scaleForText(WidgetTester tester, String text) {
  return tester
      .widget<AnimatedScale>(
        find
            .ancestor(
              of: find.text(text),
              matching: find.byType(AnimatedScale),
            )
            .first,
      )
      .scale;
}

class _ModalPanelHarness extends StatelessWidget {
  const _ModalPanelHarness({
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
      home: Scaffold(body: child),
    );
  }
}
