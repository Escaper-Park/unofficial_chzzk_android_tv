import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search/domain/entities/search_suggestions.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search/domain/repositories/search_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search/presentation/bloc/search_bloc.dart';

void main() {
  test('query change loads channel and category suggestions', () async {
    final repository = _FakeSearchRepository(
      channelSuggestions: const SearchSuggestions(
        items: ['channel', 'shared', 'channel', ''],
      ),
      categorySuggestions: const SearchSuggestions(
        items: ['shared', 'category'],
      ),
    );
    final bloc = _searchBloc(repository)
      ..add(const SearchEvent.keyboardValueChanged('game'));
    await pumpEventQueue();

    expect(bloc.state.query, 'game');
    expect(
      bloc.state.channelCategoryStatus,
      SearchSuggestionStatus.ready,
    );
    expect(bloc.state.channelSuggestions, ['channel', 'shared']);
    expect(bloc.state.categorySuggestions, ['category']);
    expect(repository.channelKeywords, ['game']);
    expect(repository.categoryKeywords, ['game']);

    await bloc.close();
  });

  test(
    'channel and category autocomplete failure is exposed as failure',
    () async {
      final bloc = _searchBloc(
        _FakeSearchRepository(throwOnCategory: true),
      )..add(const SearchEvent.keyboardValueChanged('game'));
      await pumpEventQueue();

      expect(bloc.state.channelCategoryStatus, SearchSuggestionStatus.failure);
      expect(bloc.state.channelSuggestions, isEmpty);
      expect(bloc.state.categorySuggestions, isEmpty);

      await bloc.close();
    },
  );

  test('tab change clears query and autocomplete state', () async {
    final repository = _FakeSearchRepository(
      channelSuggestions: const SearchSuggestions(items: ['channel']),
      categorySuggestions: const SearchSuggestions(items: ['category']),
      tagSuggestions: const SearchTagSuggestions(keywords: ['tag']),
    );
    final bloc = _searchBloc(repository)
      ..add(const SearchEvent.keyboardValueChanged('tag'));
    await pumpEventQueue();
    bloc.add(const SearchEvent.tabSelected(SearchTab.tag));
    await pumpEventQueue();

    expect(bloc.state.selectedTab, SearchTab.tag);
    expect(bloc.state.query, isEmpty);
    expect(
      bloc.state.channelCategoryStatus,
      SearchSuggestionStatus.initial,
    );
    expect(bloc.state.channelSuggestions, isEmpty);
    expect(bloc.state.categorySuggestions, isEmpty);
    expect(bloc.state.tagStatus, SearchSuggestionStatus.initial);
    expect(bloc.state.tagSuggestions, isEmpty);
    expect(repository.tagKeywords, isEmpty);

    await bloc.close();
  });

  test('empty query clears selected tab suggestions', () async {
    final bloc = _searchBloc(_FakeSearchRepository())
      ..add(const SearchEvent.keyboardValueChanged(''));
    await pumpEventQueue();

    expect(bloc.state.channelCategoryStatus, SearchSuggestionStatus.initial);
    expect(bloc.state.channelSuggestions, isEmpty);
    expect(bloc.state.categorySuggestions, isEmpty);

    await bloc.close();
  });

  test('submit emits navigation request for selected target', () async {
    final bloc = _searchBloc(_FakeSearchRepository())
      ..add(const SearchEvent.tabSelected(SearchTab.tag));
    await pumpEventQueue();
    bloc.add(const SearchEvent.keyboardSubmitted('flutter'));
    await pumpEventQueue();

    expect(bloc.state.isKeyboardOpen, false);
    expect(
      bloc.state.navigationRequest?.target,
      SearchNavigationTarget.searchTagResults,
    );
    expect(bloc.state.navigationRequest?.query, 'flutter');
    expect(bloc.state.navigationSerial, 1);

    await bloc.close();
  });

  test('tag autocomplete failure is exposed as failure', () async {
    final bloc = _searchBloc(
      _FakeSearchRepository(throwOnTag: true),
    )..add(const SearchEvent.tabSelected(SearchTab.tag));
    await pumpEventQueue();
    bloc.add(const SearchEvent.keyboardValueChanged('tag'));
    await pumpEventQueue();

    expect(bloc.state.tagStatus, SearchSuggestionStatus.failure);
    expect(bloc.state.tagSuggestions, isEmpty);

    await bloc.close();
  });

  test(
    'debounces rapid query changes and loads only latest autocomplete',
    () async {
      final repository = _FakeSearchRepository(
        channelSuggestions: const SearchSuggestions(items: ['latest-channel']),
        categorySuggestions: const SearchSuggestions(
          items: ['latest-category'],
        ),
      );
      final bloc = _searchBloc(
        repository,
        autocompleteDebounce: const Duration(milliseconds: 20),
      );

      for (final query in const ['g', 'ga', 'game']) {
        bloc.add(SearchEvent.keyboardValueChanged(query));
      }

      await Future<void>.delayed(const Duration(milliseconds: 10));
      final channelKeywordsBeforeDebounce = repository.channelKeywords;
      final categoryKeywordsBeforeDebounce = repository.categoryKeywords;
      expect(channelKeywordsBeforeDebounce, isEmpty);
      expect(categoryKeywordsBeforeDebounce, isEmpty);

      await Future<void>.delayed(const Duration(milliseconds: 30));
      await pumpEventQueue();

      expect(bloc.state.query, 'game');
      expect(bloc.state.channelCategoryStatus, SearchSuggestionStatus.ready);
      final channelKeywordsAfterDebounce = repository.channelKeywords;
      final categoryKeywordsAfterDebounce = repository.categoryKeywords;
      expect(channelKeywordsAfterDebounce, ['game']);
      expect(categoryKeywordsAfterDebounce, ['game']);

      await bloc.close();
    },
  );
}

SearchBloc _searchBloc(
  SearchRepository searchRepository, {
  Duration autocompleteDebounce = Duration.zero,
}) {
  return SearchBloc(
    searchRepository: searchRepository,
    autocompleteDebounce: autocompleteDebounce,
  );
}

final class _FakeSearchRepository implements SearchRepository {
  _FakeSearchRepository({
    this.channelSuggestions = const SearchSuggestions(),
    this.categorySuggestions = const SearchSuggestions(),
    this.tagSuggestions = const SearchTagSuggestions(),
    this.throwOnCategory = false,
    this.throwOnTag = false,
  });

  final SearchSuggestions channelSuggestions;
  final SearchSuggestions categorySuggestions;
  final SearchTagSuggestions tagSuggestions;
  final bool throwOnCategory;
  final bool throwOnTag;
  final channelKeywords = <String>[];
  final categoryKeywords = <String>[];
  final tagKeywords = <String>[];

  @override
  Future<SearchSuggestions> fetchChannelAutoComplete({
    required String keyword,
  }) async {
    channelKeywords.add(keyword);
    return channelSuggestions;
  }

  @override
  Future<SearchSuggestions> fetchCategoryAutoComplete({
    required String keyword,
  }) async {
    categoryKeywords.add(keyword);
    if (throwOnCategory) {
      throw Exception('category failure');
    }

    return categorySuggestions;
  }

  @override
  Future<SearchTagSuggestions> fetchTagAutoComplete({
    required String keyword,
  }) async {
    tagKeywords.add(keyword);
    if (throwOnTag) {
      throw Exception('tag failure');
    }

    return tagSuggestions;
  }
}
