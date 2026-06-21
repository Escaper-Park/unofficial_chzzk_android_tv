import '../../../live/domain/entities/live_sort.dart';
import '../../../vod/domain/entities/vod_sort.dart';
import '../entities/search_tag_feed.dart';

abstract interface class SearchTagResultsRepository {
  Future<SearchTagLivePage> searchTagLives({
    required String tag,
    int? size,
    LiveSort? sortType,
    SearchTagLiveCursor? cursor,
  });

  Future<SearchTagVideoPage> searchTagVideos({
    required String tag,
    int? size,
    VodSort? sortType,
    SearchTagVideoCursor? cursor,
  });
}
