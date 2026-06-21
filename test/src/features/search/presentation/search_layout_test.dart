import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/tv/focus/focus.dart';
import 'package:unofficial_chzzk_android_tv/src/core/ui/ui.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search/presentation/bloc/search_bloc.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search/presentation/search_screen_design.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search/presentation/search_screen_string.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search/presentation/view/layout/search_layout.dart';

void main() {
  testWidgets('renders tabs, input field, and suggestion rails', (
    tester,
  ) async {
    final nodes = _SearchLayoutNodes();
    addTearDown(nodes.dispose);

    await _pumpLayout(
      tester,
      nodes: nodes,
      state: SearchState.initial().copyWith(
        query: 'game',
        channelCategoryStatus: SearchSuggestionStatus.ready,
        channelSuggestions: const ['channel'],
        categorySuggestions: const ['category'],
      ),
    );

    final layout = tester.widget<GridContentLayout>(
      find.byType(GridContentLayout),
    );
    final channelTitle = tester.widget<Text>(
      find.text(SearchScreenString.channelRailTitle),
    );
    final channelTitleContext = tester.element(
      find.text(SearchScreenString.channelRailTitle),
    );

    expect(layout.headerContentGap, SearchScreenDesign.headerContentGap);
    expect(
      SearchScreenDesign.railTitlePadding,
      TvLayoutDesign.horizontalScreenPadding,
    );
    expect(SearchScreenDesign.railTitleGap, 14);
    expect(SearchScreenDesign.railSectionGap, 36);
    expect(
      channelTitle.style,
      Theme.of(channelTitleContext).textTheme.titleLarge,
    );
    expect(find.byType(InputContentLayout), findsOneWidget);
    expect(
      find.text(SearchScreenString.tabLabel(SearchTab.channelCategory)),
      findsOneWidget,
    );
    expect(find.text('채널 & 카테고리'), findsNothing);
    expect(
      find.text(SearchScreenString.tabLabel(SearchTab.tag)),
      findsOneWidget,
    );
    expect(find.text('검색어'), findsNothing);
    expect(find.text('game'), findsOneWidget);
    expect(find.byIcon(Icons.search_rounded), findsNothing);
    expect(find.text(SearchScreenString.channelRailTitle), findsOneWidget);
    expect(find.text(SearchScreenString.categoryRailTitle), findsOneWidget);
    expect(find.text('channel'), findsOneWidget);
    expect(find.text('category'), findsOneWidget);

    final field = tester.widget<TvTextField>(find.byType(TvTextField));

    expect(field.label, isNull);
    expect(field.design?.radius, const BorderRadius.all(Radius.circular(999)));
  });

  testWidgets('uses TvRail with six-width suggestion cards', (
    tester,
  ) async {
    final nodes = _SearchLayoutNodes();
    addTearDown(nodes.dispose);

    await _pumpLayout(
      tester,
      nodes: nodes,
      state: SearchState.initial().copyWith(
        query: 'game',
        channelCategoryStatus: SearchSuggestionStatus.ready,
        channelSuggestions: const [
          'channel 1',
          'channel 2',
          'channel 3',
          'channel 4',
          'channel 5',
          'channel 6',
          'channel 7',
        ],
      ),
    );

    final rail = tester.widget<TvRail>(find.byType(TvRail));
    final firstSuggestion = tester.widget<TvCard>(find.byType(TvCard).first);
    final firstText = tester.widget<Text>(find.text('channel 1'));
    final firstCardRect = tester.getRect(find.byType(TvCard).first);
    final firstIconRect = tester.getRect(
      find.byIcon(Icons.person_search_rounded).first,
    );
    final firstTextRect = tester.getRect(find.text('channel 1'));
    final contentCenterY =
        (math.min(firstIconRect.top, firstTextRect.top) +
            math.max(firstIconRect.bottom, firstTextRect.bottom)) /
        2;

    expect(rail.itemCount, 7);
    expect(rail.itemExtent, SearchScreenDesign.suggestionCardWidth.value);
    expect(rail.upEnsureVisibleScope, isTrue);
    expect(rail.downEnsureVisibleScope, isTrue);
    final inputExit = tester
        .widgetList<TvFocusExit>(find.byType(TvFocusExit))
        .singleWhere((exit) => exit.down == nodes.channelSuggestionsNode);
    expect(inputExit.downEnsureVisibleScope, isTrue);
    expect(firstSuggestion.width, SearchScreenDesign.suggestionCardWidth);
    expect(firstSuggestion.autofocus, isFalse);
    expect(firstSuggestion.design?.focusedScale, 1);
    expect(
      firstSuggestion.design?.focusOutlineColor,
      AppColorTokens.brandColor,
    );
    expect(firstSuggestion.design?.focusOutlineWidth, 2);
    expect(firstText.maxLines, 2);
    expect(find.byIcon(Icons.person_search_rounded), findsWidgets);
    expect(firstIconRect.right, lessThan(firstTextRect.left));
    expect(
      (contentCenterY - firstCardRect.center.dy).abs(),
      lessThanOrEqualTo(4),
    );
  });

  testWidgets('renders tab-specific input hints', (tester) async {
    final nodes = _SearchLayoutNodes();
    addTearDown(nodes.dispose);

    await _pumpLayout(
      tester,
      nodes: nodes,
      state: SearchState.initial(),
    );

    expect(
      find.text(SearchScreenString.inputHint(SearchTab.channelCategory)),
      findsOneWidget,
    );

    await _pumpLayout(
      tester,
      nodes: nodes,
      state: SearchState.initial().copyWith(selectedTab: SearchTab.tag),
    );

    expect(
      find.text(SearchScreenString.inputHint(SearchTab.tag)),
      findsOneWidget,
    );
  });

  testWidgets('renders tag suggestions for Tag tab', (tester) async {
    final nodes = _SearchLayoutNodes();
    addTearDown(nodes.dispose);

    await _pumpLayout(
      tester,
      nodes: nodes,
      state: SearchState.initial().copyWith(
        selectedTab: SearchTab.tag,
        query: 'tag',
        tagStatus: SearchSuggestionStatus.ready,
        tagSuggestions: const ['tag'],
      ),
    );

    expect(find.text(SearchScreenString.tagRailTitle), findsWidgets);
    expect(find.text('tag'), findsWidgets);
  });

  testWidgets('hides autocomplete area for empty suggestions', (tester) async {
    final nodes = _SearchLayoutNodes();
    addTearDown(nodes.dispose);

    await _pumpLayout(
      tester,
      nodes: nodes,
      state: SearchState.initial().copyWith(
        query: 'game',
        channelCategoryStatus: SearchSuggestionStatus.empty,
      ),
    );

    expect(find.text(SearchScreenString.channelRailTitle), findsNothing);
    expect(find.text(SearchScreenString.categoryRailTitle), findsNothing);
    expect(find.byType(TvRail), findsNothing);
  });

  testWidgets('renders error surface for autocomplete failure', (tester) async {
    final nodes = _SearchLayoutNodes();
    addTearDown(nodes.dispose);
    var retryPressed = false;

    await _pumpLayout(
      tester,
      nodes: nodes,
      state: SearchState.initial().copyWith(
        query: 'game',
        channelCategoryStatus: SearchSuggestionStatus.failure,
      ),
      onRetry: () {
        retryPressed = true;
      },
    );

    expect(find.text(SearchScreenString.suggestionError), findsOneWidget);
    expect(find.text(SearchScreenString.retry), findsOneWidget);

    final retryButton = tester.widget<TvButton>(
      find.widgetWithText(TvButton, SearchScreenString.retry),
    );

    expect(retryButton.autofocus, isFalse);

    await tester.tap(find.text(SearchScreenString.retry));

    expect(retryPressed, isTrue);
  });
}

Future<void> _pumpLayout(
  WidgetTester tester, {
  required _SearchLayoutNodes nodes,
  required SearchState state,
  VoidCallback? onRetry,
}) async {
  tester.view.physicalSize = const Size(960, 540);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);

  await tester.pumpWidget(
    MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColorTokens.brandColor,
          brightness: Brightness.dark,
        ),
      ),
      home: Scaffold(
        body: SizedBox(
          width: 960,
          height: 540,
          child: SearchLayout(
            state: state,
            tabsNode: nodes.tabsNode,
            inputNode: nodes.inputNode,
            channelSuggestionsNode: nodes.channelSuggestionsNode,
            categorySuggestionsNode: nodes.categorySuggestionsNode,
            tagSuggestionsNode: nodes.tagSuggestionsNode,
            statusNode: nodes.statusNode,
            keyboardNode: nodes.keyboardNode,
            onTabSelected: (_) {},
            onInputPressed: () {},
            onSuggestionPressed: (_) {},
            onRetry: onRetry ?? () {},
          ),
        ),
      ),
    ),
  );
}

final class _SearchLayoutNodes {
  final tabsNode = FocusScopeNode(debugLabel: 'test search tabs');
  final inputNode = FocusScopeNode(debugLabel: 'test search input');
  final channelSuggestionsNode = FocusScopeNode(
    debugLabel: 'test search channel suggestions',
  );
  final categorySuggestionsNode = FocusScopeNode(
    debugLabel: 'test search category suggestions',
  );
  final tagSuggestionsNode = FocusScopeNode(
    debugLabel: 'test search tag suggestions',
  );
  final statusNode = FocusScopeNode(debugLabel: 'test search status');
  final keyboardNode = FocusScopeNode(debugLabel: 'test search keyboard');

  void dispose() {
    tabsNode.dispose();
    inputNode.dispose();
    channelSuggestionsNode.dispose();
    categorySuggestionsNode.dispose();
    tagSuggestionsNode.dispose();
    statusNode.dispose();
    keyboardNode.dispose();
  }
}
