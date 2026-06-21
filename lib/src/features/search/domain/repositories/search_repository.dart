import '../entities/search_suggestions.dart';

abstract interface class SearchRepository {
  Future<SearchSuggestions> fetchChannelAutoComplete({
    required String keyword,
  });

  Future<SearchSuggestions> fetchCategoryAutoComplete({
    required String keyword,
  });

  Future<SearchTagSuggestions> fetchTagAutoComplete({
    required String keyword,
  });
}
