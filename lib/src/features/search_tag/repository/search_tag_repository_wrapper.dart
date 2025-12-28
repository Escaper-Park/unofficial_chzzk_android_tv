import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/result/results.dart';
import '../../../utils/dio/base_repository.dart';
import '../../../utils/dio/dio_client.dart';
import '../model/auto_complete_tag_response.dart';
import '../model/search_tag_response.dart';
import 'search_tag_repository.dart';

part 'search_tag_repository_wrapper.g.dart';

/// A wrapper around [SearchTagRepository] that provides Result-based error handling.
///
/// This class bridges the gap between the generated Retrofit repository
/// (which throws exceptions) and the Result pattern used throughout the app.
class SearchTagRepositoryWrapper extends BaseRepository {
  final SearchTagRepository _repository;

  SearchTagRepositoryWrapper(this._repository);

  /// Fetches autocomplete tag suggestions.
  ///
  /// Returns:
  /// - [Success<AutoCompleteTagResponse>] with tag suggestions
  /// - [Failure] with appropriate exception on error
  Future<Result<AutoCompleteTagResponse?>> getAutoCompleteTagResponse({
    required String keyword,
    required int size,
  }) {
    return handleNullableApiCall(
      () => _repository.getAutoCompleteTagResponse(
        keyword: keyword,
        size: size,
      ),
    );
  }

  /// Fetches live streams by tag.
  ///
  /// Returns:
  /// - [Success<SearchTagLiveResponse>] with live stream results
  /// - [Failure] with appropriate exception on error
  Future<Result<SearchTagLiveResponse?>> getSearchTagLiveResponse({
    required String tags,
    required int size,
    required String sortType,
    required int? concurrentUserCount,
    required int? liveId,
  }) {
    return handleNullableApiCall(
      () => _repository.getSearchTagLiveResponse(
        tags: tags,
        size: size,
        sortType: sortType,
        concurrentUserCount: concurrentUserCount,
        liveId: liveId,
      ),
    );
  }

  /// Fetches VODs by tag.
  ///
  /// Returns:
  /// - [Success<SearchTagVodResponse>] with VOD results
  /// - [Failure] with appropriate exception on error
  Future<Result<SearchTagVodResponse?>> getSearchTagVodResponse({
    required String tag,
    required int size,
    required String sortType,
    required int? start,
  }) {
    return handleNullableApiCall(
      () => _repository.getSearchTagVodResponse(
        tag: tag,
        size: size,
        sortType: sortType,
        start: start,
      ),
    );
  }
}

/// Provider for [SearchTagRepositoryWrapper].
///
/// This provider creates a new wrapper instance using the DioClient,
/// ensuring proper dependency injection and lifecycle management.
@riverpod
SearchTagRepositoryWrapper searchTagRepositoryWrapper(
  SearchTagRepositoryWrapperRef ref,
) {
  final dio = ref.watch(dioClientProvider);
  final repository = SearchTagRepository(dio);
  return SearchTagRepositoryWrapper(repository);
}
