import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/ui/ui.dart';

void main() {
  testWidgets('content state view uses caller-provided size and action', (
    tester,
  ) async {
    await tester.pumpWidget(
      _LayoutHarness(
        child: ContentStateView.empty(
          message: 'No data',
          size: const Size(320, 180),
          action: TvButton.label(text: 'Browse', onPressed: () {}),
        ),
      ),
    );

    expect(find.text('No data'), findsOneWidget);
    expect(find.text('Browse'), findsOneWidget);
    expect(
      tester.getSize(find.byType(ContentStateView)),
      const Size(320, 180),
    );
  });

  testWidgets('grid content layout renders tabs action and content', (
    tester,
  ) async {
    await tester.pumpWidget(
      const _LayoutHarness(
        child: SizedBox(
          width: 800,
          height: 480,
          child: GridContentLayout(
            tabsRow: Text('Tabs'),
            action: Text('Action'),
            content: Text('Grid'),
          ),
        ),
      ),
    );

    expect(find.text('Tabs'), findsOneWidget);
    expect(find.text('Action'), findsOneWidget);
    expect(find.text('Grid'), findsOneWidget);
  });

  testWidgets('grid content layout can render a caller-owned header', (
    tester,
  ) async {
    await tester.pumpWidget(
      const _LayoutHarness(
        child: SizedBox(
          width: 800,
          height: 480,
          child: GridContentLayout(
            header: Text('Header'),
            content: Text('Grid'),
          ),
        ),
      ),
    );

    expect(find.text('Header'), findsOneWidget);
    expect(find.text('Grid'), findsOneWidget);
  });

  testWidgets('input content layout renders input and content slots', (
    tester,
  ) async {
    await tester.pumpWidget(
      const _LayoutHarness(
        child: SizedBox(
          width: 800,
          height: 480,
          child: InputContentLayout(
            input: Text('Input'),
            content: Text('Results'),
          ),
        ),
      ),
    );

    expect(find.text('Input'), findsOneWidget);
    expect(find.text('Results'), findsOneWidget);
  });

  testWidgets('split list layout renders leading and trailing slots', (
    tester,
  ) async {
    await tester.pumpWidget(
      const _LayoutHarness(
        child: SizedBox(
          width: 800,
          height: 480,
          child: SplitListLayout(
            leading: Text('Left'),
            trailing: Text('Right'),
          ),
        ),
      ),
    );

    expect(find.text('Left'), findsOneWidget);
    expect(find.text('Right'), findsOneWidget);
  });

  testWidgets('split list layout can use fixed pane widths', (
    tester,
  ) async {
    await tester.pumpWidget(
      const _LayoutHarness(
        child: SizedBox(
          width: 800,
          height: 480,
          child: SplitListLayout(
            gap: 20,
            leadingWidth: 268,
            trailingWidth: 512,
            leading: ColoredBox(
              key: Key('split-list-leading'),
              color: Colors.red,
            ),
            trailing: ColoredBox(
              key: Key('split-list-trailing'),
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );

    final leadingFinder = find.byKey(const Key('split-list-leading'));
    final trailingFinder = find.byKey(const Key('split-list-trailing'));
    final leadingSize = tester.getSize(leadingFinder);
    final trailingSize = tester.getSize(trailingFinder);
    final leadingRight = tester.getTopRight(leadingFinder);
    final trailingLeft = tester.getTopLeft(trailingFinder);

    expect(leadingSize.width, 268);
    expect(leadingSize.height, 480);
    expect(trailingSize.width, 512);
    expect(trailingSize.height, 480);
    expect(trailingLeft.dx - leadingRight.dx, 20);
  });

  testWidgets('debug layout renders guide when enabled', (tester) async {
    await tester.pumpWidget(
      const _LayoutHarness(
        child: DebugLayout(child: Text('Debug')),
      ),
    );

    expect(find.text('Debug'), findsOneWidget);
    expect(find.byKey(DebugLayout.guideKey), findsOneWidget);

    final stack = tester.widget<Stack>(
      find
          .descendant(
            of: find.byType(DebugLayout),
            matching: find.byType(Stack),
          )
          .first,
    );
    expect(stack.children.first, isA<Text>());
    expect(stack.children.last, isA<Positioned>());
  });

  testWidgets('debug layout can be disabled', (tester) async {
    await tester.pumpWidget(
      const _LayoutHarness(
        child: DebugLayout(
          enabled: false,
          child: Text('Debug'),
        ),
      ),
    );

    expect(find.text('Debug'), findsOneWidget);
    expect(find.byKey(DebugLayout.guideKey), findsNothing);
  });
}

class _LayoutHarness extends StatelessWidget {
  const _LayoutHarness({
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
