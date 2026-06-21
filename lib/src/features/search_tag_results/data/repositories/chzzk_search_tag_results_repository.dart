import '../../../../core/network/network.dart';
import '../../../live/domain/entities/live_sort.dart';
import '../../../vod/domain/entities/vod_sort.dart';
import '../../domain/entities/search_tag_feed.dart';
import '../../domain/failures/search_tag_results_failure.dart';
import '../../domain/repositories/search_tag_results_repository.dart';
import '../data_sources/search_tag_results_api.dart';
import '../data_sources/search_tag_results_api_contract.dart';
import '../mappers/search_tag_results_mapper.dart';

final class ChzzkSearchTagResultsRepository
    implements SearchTagResultsRepository {
  const ChzzkSearchTagResultsRepository({
    required this.api,
  });

  final SearchTagResultsApi api;

  @override
  Future<SearchTagLivePage> searchTagLives({
    required String tag,
    int? size,
    LiveSort? sortType,
    SearchTagLiveCursor? cursor,
  }) async {
    try {
      final response = await api.searchTagLives(
        tags: tag,
        size: size ?? SearchTagResultsApiDefaults.pageSize,
        sortType: _searchTagLiveSortType(sortType ?? LiveSort.popular),
        concurrentUserCount: cursor?.concurrentUserCount,
        liveId: cursor?.liveId,
      );
      final content = response.requireContent();

      return searchTagLivePageFromDto(content);
    } on Object catch (_, stackTrace) {
      Error.throwWithStackTrace(
        const SearchTagResultsLoadFailure(),
        stackTrace,
      );
    }
  }

  @override
  Future<SearchTagVideoPage> searchTagVideos({
    required String tag,
    int? size,
    VodSort? sortType,
    SearchTagVideoCursor? cursor,
  }) async {
    try {
      final response = await api.searchTagVideos(
        tag: tag,
        size: size ?? SearchTagResultsApiDefaults.pageSize,
        sortType: _searchTagVideoSortType(sortType ?? VodSort.popular),
        start: cursor?.start,
      );
      final content = response.requireContent();

      return searchTagVideoPageFromDto(content);
    } on Object catch (_, stackTrace) {
      Error.throwWithStackTrace(
        const SearchTagResultsLoadFailure(),
        stackTrace,
      );
    }
  }
}

String _searchTagLiveSortType(LiveSort sort) {
  return switch (sort) {
    LiveSort.popular => SearchTagResultsApiDefaults.sortTypePopular,
    LiveSort.latest => SearchTagResultsApiDefaults.sortTypeLatest,
  };
}

String _searchTagVideoSortType(VodSort sort) {
  return switch (sort) {
    VodSort.popular => SearchTagResultsApiDefaults.sortTypePopular,
    VodSort.latest => SearchTagResultsApiDefaults.sortTypeLatest,
  };
}
