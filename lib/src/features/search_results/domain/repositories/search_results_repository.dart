import '../entities/search_results.dart';

abstract interface class SearchResultsRepository {
  Future<SearchChannelResultsPage> searchChannels({
    required String keyword,
    int? size,
    bool? withFirstChannelContent,
    SearchCursor? cursor,
  });

  Future<SearchVideoResultsPage> searchVideos({
    required String keyword,
    int? size,
    SearchCursor? cursor,
  });

  Future<SearchLiveResultsPage> searchLives({
    required String keyword,
    int? size,
    SearchCursor? cursor,
  });
}
