import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/ui/ui.dart';

void main() {
  testWidgets('tab action bar renders tabs and optional actions', (
    tester,
  ) async {
    var selected = 'live';

    await tester.pumpWidget(
      _Harness(
        child: TvTabActionBar<String>(
          tabs: const [
            TvTabItem(value: 'live', label: 'Live'),
            TvTabItem(value: 'vod', label: 'VOD'),
          ],
          selectedValue: selected,
          onTabSelected: (value) => selected = value,
          actions: [
            TvTabActionButton(
              text: 'Popular',
              icon: Icons.sort_rounded,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );

    final action = tester.widget<TvButton>(find.byType(TvButton));

    expect(find.text('Live'), findsOneWidget);
    expect(find.text('VOD'), findsOneWidget);
    expect(find.text('Popular'), findsOneWidget);
    expect(action.design?.height, TvTabbedLayoutDesign.tabHeight);

    await tester.tap(find.text('VOD'));

    expect(selected, 'vod');
  });

  testWidgets('tabbed content layout wires header spacing and content', (
    tester,
  ) async {
    final tabsNode = FocusScopeNode(debugLabel: 'test tabs');
    final contentNode = FocusScopeNode(debugLabel: 'test content');
    addTearDown(tabsNode.dispose);
    addTearDown(contentNode.dispose);

    await tester.pumpWidget(
      _Harness(
        child: TvTabbedContentLayout<String>(
          tabsNode: tabsNode,
          contentNode: contentNode,
          tabs: const [
            TvTabItem(value: 'live', label: 'Live'),
            TvTabItem(value: 'vod', label: 'VOD'),
          ],
          selectedValue: 'live',
          onTabSelected: (_) {},
          content: const Text('Content area'),
        ),
      ),
    );

    final layout = tester.widget<GridContentLayout>(
      find.byType(GridContentLayout),
    );
    final padding = layout.headerRowPadding as EdgeInsets?;

    expect(find.text('Content area'), findsOneWidget);
    expect(padding!.top, 24);
    expect(padding.bottom, 24);
    expect(layout.headerContentGap, 0);
  });

  testWidgets('tabbed grid layout owns the feed grid contract', (
    tester,
  ) async {
    final tabsNode = FocusScopeNode(debugLabel: 'test tabs');
    final gridNode = FocusScopeNode(debugLabel: 'test grid');
    var receivedAutofocus = false;
    var receivedScale = TvFocusedScale.standard;
    addTearDown(tabsNode.dispose);
    addTearDown(gridNode.dispose);

    await tester.pumpWidget(
      _Harness(
        child: TvTabbedGridLayout<String>(
          tabsNode: tabsNode,
          gridNode: gridNode,
          tabs: const [
            TvTabItem(value: 'live', label: 'Live'),
            TvTabItem(value: 'vod', label: 'VOD'),
          ],
          selectedValue: 'live',
          onTabSelected: (_) {},
          itemCount: 1,
          itemBuilder:
              (context, index, {required autofocus, required focusedScale}) {
                receivedAutofocus = autofocus;
                receivedScale = focusedScale;
                return const Text('Grid item');
              },
        ),
      ),
    );

    final grid = tester.widget<TvGrid>(find.byType(TvGrid));
    final gridView = tester.widget<GridView>(find.byType(GridView));
    final delegate =
        gridView.gridDelegate as SliverGridDelegateWithFixedCrossAxisCount;
    final padding = grid.padding as EdgeInsets?;

    expect(find.text('Grid item'), findsOneWidget);
    expect(grid.variant, TvGridVariant.feedCard);
    expect(delegate.crossAxisCount, 3);
    expect(padding!.top, 16);
    expect(receivedAutofocus, true);
    expect(receivedScale, TvFocusedScale.md);
  });

  testWidgets('tabbed input layout places a TV text field below tabs', (
    tester,
  ) async {
    final tabsNode = FocusScopeNode(debugLabel: 'test tabs');
    final inputNode = FocusScopeNode(debugLabel: 'test input');
    addTearDown(tabsNode.dispose);
    addTearDown(inputNode.dispose);

    await tester.pumpWidget(
      _Harness(
        child: TvTabbedInputLayout<String>(
          tabsNode: tabsNode,
          inputNode: inputNode,
          tabs: const [
            TvTabItem(value: 'query', label: 'Query'),
            TvTabItem(value: 'tag', label: 'Tag'),
          ],
          selectedValue: 'query',
          onTabSelected: (_) {},
          value: '',
          hintText: 'Search',
          onInputPressed: () {},
        ),
      ),
    );

    expect(find.byType(TvTextField), findsOneWidget);
    expect(find.text('Search'), findsOneWidget);
  });
}

class _Harness extends StatelessWidget {
  const _Harness({
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
