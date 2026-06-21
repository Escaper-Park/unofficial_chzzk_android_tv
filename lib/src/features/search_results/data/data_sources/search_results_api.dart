import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/network/network.dart';
import '../dtos/search_results_dtos.dart';
import 'search_results_api_contract.dart';

part 'search_results_api.g.dart';

@RestApi(baseUrl: ChzzkApiBaseUrls.service)
abstract class SearchResultsApi {
  factory SearchResultsApi(Dio dio, {String? baseUrl}) = _SearchResultsApi;

  @GET(SearchResultsApiPaths.channels)
  Future<ApiResponseDto<SearchChannelListDto>> searchChannels({
    @Query(SearchResultsApiQueryKeys.keyword) required String keyword,
    @Query(SearchResultsApiQueryKeys.offset)
    int offset = SearchResultsApiDefaults.offset,
    @Query(SearchResultsApiQueryKeys.size)
    int size = SearchResultsApiDefaults.resultSize,
    @Query(SearchResultsApiQueryKeys.withFirstChannelContent)
    bool withFirstChannelContent =
        SearchResultsApiDefaults.withFirstChannelContent,
  });

  @GET(SearchResultsApiPaths.videos)
  Future<ApiResponseDto<SearchVideoListDto>> searchVideos({
    @Query(SearchResultsApiQueryKeys.keyword) required String keyword,
    @Query(SearchResultsApiQueryKeys.offset)
    int offset = SearchResultsApiDefaults.offset,
    @Query(SearchResultsApiQueryKeys.size)
    int size = SearchResultsApiDefaults.resultSize,
  });

  @GET(SearchResultsApiPaths.lives)
  Future<ApiResponseDto<SearchLiveListDto>> searchLives({
    @Query(SearchResultsApiQueryKeys.keyword) required String keyword,
    @Query(SearchResultsApiQueryKeys.offset)
    int offset = SearchResultsApiDefaults.offset,
    @Query(SearchResultsApiQueryKeys.size)
    int size = SearchResultsApiDefaults.resultSize,
  });
}
