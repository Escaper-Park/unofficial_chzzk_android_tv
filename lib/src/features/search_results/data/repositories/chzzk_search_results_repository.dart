import '../../../../core/network/network.dart';
import '../../domain/entities/search_results.dart';
import '../../domain/failures/search_results_failure.dart';
import '../../domain/repositories/search_results_repository.dart';
import '../data_sources/search_results_api.dart';
import '../data_sources/search_results_api_contract.dart';
import '../mappers/search_results_mapper.dart';

final class ChzzkSearchResultsRepository implements SearchResultsRepository {
  const ChzzkSearchResultsRepository({
    required this.api,
  });

  final SearchResultsApi api;

  @override
  Future<SearchChannelResultsPage> searchChannels({
    required String keyword,
    int? size,
    bool? withFirstChannelContent,
    SearchCursor? cursor,
  }) async {
    try {
      final response = await api.searchChannels(
        keyword: keyword,
        size: size ?? SearchResultsApiDefaults.resultSize,
        offset: cursor?.offset ?? SearchResultsApiDefaults.offset,
        withFirstChannelContent:
            withFirstChannelContent ??
            SearchResultsApiDefaults.withFirstChannelContent,
      );
      final content = response.requireContent();

      return searchChannelResultsPageFromDto(content);
    } on Object catch (_, stackTrace) {
      Error.throwWithStackTrace(
        const SearchResultsLoadFailure(),
        stackTrace,
      );
    }
  }

  @override
  Future<SearchVideoResultsPage> searchVideos({
    required String keyword,
    int? size,
    SearchCursor? cursor,
  }) async {
    try {
      final response = await api.searchVideos(
        keyword: keyword,
        size: size ?? SearchResultsApiDefaults.resultSize,
        offset: cursor?.offset ?? SearchResultsApiDefaults.offset,
      );
      final content = response.requireContent();

      return searchVideoResultsPageFromDto(content);
    } on Object catch (_, stackTrace) {
      Error.throwWithStackTrace(
        const SearchResultsLoadFailure(),
        stackTrace,
      );
    }
  }

  @override
  Future<SearchLiveResultsPage> searchLives({
    required String keyword,
    int? size,
    SearchCursor? cursor,
  }) async {
    try {
      final response = await api.searchLives(
        keyword: keyword,
        size: size ?? SearchResultsApiDefaults.resultSize,
        offset: cursor?.offset ?? SearchResultsApiDefaults.offset,
      );
      final content = response.requireContent();

      return searchLiveResultsPageFromDto(content);
    } on Object catch (_, stackTrace) {
      Error.throwWithStackTrace(
        const SearchResultsLoadFailure(),
        stackTrace,
      );
    }
  }
}
