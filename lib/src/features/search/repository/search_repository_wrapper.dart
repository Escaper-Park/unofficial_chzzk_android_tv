import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/result/results.dart';
import '../../../utils/dio/base_repository.dart';
import '../../../utils/dio/dio_client.dart';
import '../model/auto_complete_response.dart';
import '../model/search_response.dart';
import 'search_repository.dart';

part 'search_repository_wrapper.g.dart';

/// A wrapper around [SearchRepository] and [CategorySearchRepository]
/// that provides Result-based error handling.
///
/// This class bridges the gap between the generated Retrofit repositories
/// (which throw exceptions) and the Result pattern used throughout the app.
///
/// Usage:
/// ```dart
/// final result = await ref.read(searchRepositoryWrapperProvider)
///     .getAutoCompleteChannels(keyword: 'test');
/// result.when(
///   success: (response) => handleResponse(response),
///   failure: (error) => handleError(error),
/// );
/// ```
class SearchRepositoryWrapper extends BaseRepository {
  final SearchRepository _searchRepository;
  final CategorySearchRepository _categorySearchRepository;

  SearchRepositoryWrapper(
    this._searchRepository,
    this._categorySearchRepository,
  );

  /// Fetches autocomplete channel keywords.
  ///
  /// Returns:
  /// - [Success<AutoCompleteSearchChannelResponse?>] with keyword list
  /// - [Failure] with [NetworkException] if network error occurs
  Future<Result<AutoCompleteSearchChannelResponse?>> getAutoCompleteChannels({
    required String keyword,
    required int offset,
    required int size,
  }) {
    return handleNullableApiCall(
      () => _searchRepository.getAutoCompleteSearchChannelResponse(
        keyword: keyword,
        offset: offset,
        size: size,
      ),
    );
  }

  /// Fetches autocomplete category keywords.
  ///
  /// Returns:
  /// - [Success<AutoCompleteSearchCategoryResponse?>] with keyword list
  /// - [Failure] with [NetworkException] if network error occurs
  Future<Result<AutoCompleteSearchCategoryResponse?>> getAutoCompleteCategories(
      {
    required String keyword,
    required int offset,
    required int limit,
  }) {
    return handleNullableApiCall(
      () => _categorySearchRepository.getAutoCompleteSearchCategoryResponse(
        keyword: keyword,
        offset: offset,
        limit: limit,
      ),
    );
  }

  /// Fetches channel search results.
  ///
  /// Returns:
  /// - [Success<SearchChannelResponse?>] with channel search results
  /// - [Failure] with [NetworkException] if network error occurs
  Future<Result<SearchChannelResponse?>> searchChannels({
    required String keyword,
    required int offset,
    required int size,
    required bool withFirstChannelContent,
  }) {
    return handleNullableApiCall(
      () => _searchRepository.getSearchChannelResponse(
        keyword: keyword,
        offset: offset,
        size: size,
        withFirstChannelContent: withFirstChannelContent,
      ),
    );
  }

  /// Fetches VOD search results.
  ///
  /// Returns:
  /// - [Success<SearchVodResponse?>] with VOD search results
  /// - [Failure] with [NetworkException] if network error occurs
  Future<Result<SearchVodResponse?>> searchVods({
    required String keyword,
    required int offset,
    required int size,
  }) {
    return handleNullableApiCall(
      () => _searchRepository.getSearchVodResponse(
        keyword: keyword,
        offset: offset,
        size: size,
      ),
    );
  }

  /// Fetches live search results.
  ///
  /// Returns:
  /// - [Success<SearchLiveResponse?>] with live search results
  /// - [Failure] with [NetworkException] if network error occurs
  Future<Result<SearchLiveResponse?>> searchLives({
    required String keyword,
    required int offset,
    required int size,
  }) {
    return handleNullableApiCall(
      () => _searchRepository.getSearchLiveResponse(
        keyword: keyword,
        offset: offset,
        size: size,
      ),
    );
  }
}

/// Provider for [SearchRepositoryWrapper].
///
/// This provider creates a new wrapper instance using the DioClient,
/// ensuring proper dependency injection and lifecycle management.
@riverpod
SearchRepositoryWrapper searchRepositoryWrapper(
  SearchRepositoryWrapperRef ref,
) {
  final dio = ref.watch(dioClientProvider);
  final searchRepository = SearchRepository(dio);
  final categorySearchRepository = CategorySearchRepository(dio);
  return SearchRepositoryWrapper(searchRepository, categorySearchRepository);
}
