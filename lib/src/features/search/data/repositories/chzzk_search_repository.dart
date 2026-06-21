import '../../../../core/network/network.dart';
import '../../domain/entities/search_suggestions.dart';
import '../../domain/failures/search_failure.dart';
import '../../domain/repositories/search_repository.dart';
import '../data_sources/search_api.dart';
import '../dtos/search_dtos.dart';
import '../mappers/search_mapper.dart';

final class ChzzkSearchRepository implements SearchRepository {
  const ChzzkSearchRepository({
    required this.api,
    required this.categoryApi,
  });

  final SearchApi api;
  final SearchCategoryApi categoryApi;

  @override
  Future<SearchSuggestions> fetchChannelAutoComplete({
    required String keyword,
  }) async {
    try {
      final response = await api.fetchChannelAutoComplete(keyword: keyword);
      final content = response.contentOr(const SearchAutoCompleteListDto());

      return searchSuggestionsFromDto(content);
    } on Object catch (_, stackTrace) {
      Error.throwWithStackTrace(
        const SearchSuggestionLoadFailure(),
        stackTrace,
      );
    }
  }

  @override
  Future<SearchSuggestions> fetchCategoryAutoComplete({
    required String keyword,
  }) async {
    try {
      final response = await categoryApi.fetchCategoryAutoComplete(
        keyword: keyword,
      );
      final content = response.contentOr(const SearchAutoCompleteListDto());

      return searchSuggestionsFromDto(content);
    } on Object catch (_, stackTrace) {
      Error.throwWithStackTrace(
        const SearchSuggestionLoadFailure(),
        stackTrace,
      );
    }
  }

  @override
  Future<SearchTagSuggestions> fetchTagAutoComplete({
    required String keyword,
  }) async {
    try {
      final response = await api.fetchTagAutoComplete(keyword: keyword);
      final content = response.contentOr(const SearchTagAutoCompleteDto());

      return searchTagSuggestionsFromDto(content);
    } on Object catch (_, stackTrace) {
      Error.throwWithStackTrace(
        const SearchSuggestionLoadFailure(),
        stackTrace,
      );
    }
  }
}
