import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/network/network.dart';
import '../dtos/search_tag_results_dtos.dart';
import 'search_tag_results_api_contract.dart';

part 'search_tag_results_api.g.dart';

@RestApi(baseUrl: ChzzkApiBaseUrls.service)
abstract class SearchTagResultsApi {
  factory SearchTagResultsApi(Dio dio, {String? baseUrl}) =
      _SearchTagResultsApi;

  @GET(SearchTagResultsApiPaths.lives)
  Future<ApiResponseDto<SearchTagLiveListDto>> searchTagLives({
    @Query(SearchTagResultsApiQueryKeys.size)
    int size = SearchTagResultsApiDefaults.pageSize,
    @Query(SearchTagResultsApiQueryKeys.sortType)
    String sortType = SearchTagResultsApiDefaults.sortTypePopular,
    @Query(SearchTagResultsApiQueryKeys.tags) required String tags,
    @Query(SearchTagResultsApiQueryKeys.concurrentUserCount)
    int? concurrentUserCount,
    @Query(SearchTagResultsApiQueryKeys.liveId) int? liveId,
  });

  @GET(SearchTagResultsApiPaths.videos)
  Future<ApiResponseDto<SearchTagVideoListDto>> searchTagVideos({
    @Query(SearchTagResultsApiQueryKeys.size)
    int size = SearchTagResultsApiDefaults.pageSize,
    @Query(SearchTagResultsApiQueryKeys.sortType)
    String sortType = SearchTagResultsApiDefaults.sortTypePopular,
    @Query(SearchTagResultsApiQueryKeys.tag) required String tag,
    @Query(SearchTagResultsApiQueryKeys.start) int? start,
  });
}
