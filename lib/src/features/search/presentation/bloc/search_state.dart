part of 'search_bloc.dart';

enum SearchTab {
  channelCategory,
  tag,
}

enum SearchSuggestionStatus {
  initial,
  loading,
  ready,
  empty,
  failure,
}

enum SearchNavigationTarget {
  searchResults,
  searchTagResults,
}

@freezed
abstract class SearchNavigationRequest with _$SearchNavigationRequest {
  const factory SearchNavigationRequest({
    required SearchNavigationTarget target,
    required String query,
    required int serial,
  }) = _SearchNavigationRequest;
}

@freezed
abstract class SearchState with _$SearchState {
  const SearchState._();

  const factory SearchState({
    required SearchTab selectedTab,
    required String query,
    required bool isKeyboardOpen,
    required SearchSuggestionStatus channelCategoryStatus,
    required List<String> channelSuggestions,
    required List<String> categorySuggestions,
    required SearchSuggestionStatus tagStatus,
    required List<String> tagSuggestions,
    SearchNavigationRequest? navigationRequest,
    @Default(0) int navigationSerial,
  }) = _SearchState;

  factory SearchState.initial() {
    return const SearchState(
      selectedTab: SearchTab.channelCategory,
      query: '',
      isKeyboardOpen: false,
      channelCategoryStatus: SearchSuggestionStatus.initial,
      channelSuggestions: <String>[],
      categorySuggestions: <String>[],
      tagStatus: SearchSuggestionStatus.initial,
      tagSuggestions: <String>[],
    );
  }

  bool get canSubmit => query.trim().isNotEmpty;

  SearchSuggestionStatus get selectedSuggestionStatus {
    return switch (selectedTab) {
      SearchTab.channelCategory => channelCategoryStatus,
      SearchTab.tag => tagStatus,
    };
  }

  bool get hasSelectedSuggestionItems {
    return switch (selectedTab) {
      SearchTab.channelCategory =>
        channelSuggestions.isNotEmpty || categorySuggestions.isNotEmpty,
      SearchTab.tag => tagSuggestions.isNotEmpty,
    };
  }
}
