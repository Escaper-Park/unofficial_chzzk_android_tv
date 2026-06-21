import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/app/shell/shell.dart';
import 'package:unofficial_chzzk_android_tv/src/core/tv/keyboard/keyboard.dart';
import 'package:unofficial_chzzk_android_tv/src/core/ui/ui.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search/domain/entities/search_suggestions.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search/domain/repositories/search_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search/presentation/bloc/search_bloc.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search/presentation/search_screen.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search/presentation/search_screen_design.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search/presentation/search_screen_string.dart';

void main() {
  testWidgets('opens keyboard when the screen enters', (tester) async {
    final harness = _SearchScreenHarness();
    addTearDown(harness.dispose);

    await _pumpSearchScreen(tester, harness: harness);
    await tester.pump();

    final input = tester.widget<TvTextField>(find.byType(TvTextField));
    final keyboard = tester.widget<TvKeyboard>(find.byType(TvKeyboard));

    expect(input.active, isTrue);
    expect(
      keyboard.initialFocusIndex,
      SearchScreenDesign.keyboardInitialFocusIndex,
    );
  });

  testWidgets('clears input when selected tab changes', (tester) async {
    final harness = _SearchScreenHarness();
    addTearDown(harness.dispose);

    await _pumpSearchScreen(tester, harness: harness);
    await tester.pump();

    final keyboard = tester.widget<TvKeyboard>(find.byType(TvKeyboard));
    keyboard.cubit.inputCharacter('g');
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 250));

    expect(
      tester.widget<TvTextField>(find.byType(TvTextField)).value,
      isNotEmpty,
    );

    await tester.tap(find.text(SearchScreenString.tabLabel(SearchTab.tag)));
    await tester.pump();

    expect(tester.widget<TvTextField>(find.byType(TvTextField)).value, isEmpty);
    expect(
      tester.widget<TvKeyboard>(find.byType(TvKeyboard)).cubit.state.value,
      isEmpty,
    );
  });

  testWidgets('moves focus to tabs before shell on Back', (tester) async {
    final harness = _SearchScreenHarness();
    addTearDown(harness.dispose);

    await _pumpSearchScreen(tester, harness: harness);
    await tester.pump();

    await tester.binding.handlePopRoute();
    await tester.pump();

    expect(harness.shellFocusNode.hasFocus, isFalse);

    await tester.binding.handlePopRoute();
    await tester.pump();

    expect(harness.shellFocusNode.hasFocus, isFalse);

    await tester.binding.handlePopRoute();
    await tester.pump();

    expect(harness.shellFocusNode.hasFocus, isTrue);
  });
}

Future<void> _pumpSearchScreen(
  WidgetTester tester, {
  required _SearchScreenHarness harness,
}) async {
  tester.view.physicalSize = const Size(960, 540);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);

  await tester.pumpWidget(
    MaterialApp(
      home: AppShellFocusScope(
        navigationNode: harness.navigationNode,
        contentNode: harness.contentNode,
        homeRefreshListenable: harness.homeRefreshListenable,
        child: Scaffold(
          body: Column(
            children: [
              FocusScope(
                node: harness.navigationNode,
                child: TextButton(
                  focusNode: harness.shellFocusNode,
                  onPressed: () {},
                  child: const Text('Shell navigation'),
                ),
              ),
              Expanded(
                child: FocusScope(
                  node: harness.contentNode,
                  child: RepositoryProvider<SearchRepository>.value(
                    value: const _FakeSearchRepository(),
                    child: const SearchScreen(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

final class _SearchScreenHarness {
  final navigationNode = FocusScopeNode(debugLabel: 'test shell navigation');
  final contentNode = FocusScopeNode(debugLabel: 'test shell content');
  final shellFocusNode = FocusNode(debugLabel: 'test shell navigation item');
  final homeRefreshListenable = ValueNotifier<int>(0);

  void dispose() {
    navigationNode.dispose();
    contentNode.dispose();
    shellFocusNode.dispose();
    homeRefreshListenable.dispose();
  }
}

final class _FakeSearchRepository implements SearchRepository {
  const _FakeSearchRepository();

  @override
  Future<SearchSuggestions> fetchChannelAutoComplete({
    required String keyword,
  }) async {
    return const SearchSuggestions();
  }

  @override
  Future<SearchSuggestions> fetchCategoryAutoComplete({
    required String keyword,
  }) async {
    return const SearchSuggestions();
  }

  @override
  Future<SearchTagSuggestions> fetchTagAutoComplete({
    required String keyword,
  }) async {
    return const SearchTagSuggestions();
  }
}
