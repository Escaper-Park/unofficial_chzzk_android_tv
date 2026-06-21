import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/network/network.dart';
import '../dtos/search_dtos.dart';
import 'search_api_contract.dart';

part 'search_api.g.dart';

@RestApi(baseUrl: ChzzkApiBaseUrls.service)
abstract class SearchApi {
  factory SearchApi(Dio dio, {String? baseUrl}) = _SearchApi;

  @GET(SearchApiPaths.channelAutoComplete)
  Future<ApiResponseDto<SearchAutoCompleteListDto>> fetchChannelAutoComplete({
    @Query(SearchApiQueryKeys.keyword) required String keyword,
    @Query(SearchApiQueryKeys.offset) int offset = SearchApiDefaults.offset,
    @Query(SearchApiQueryKeys.size)
    int size = SearchApiDefaults.channelAutoCompleteSize,
  });

  @GET(SearchApiPaths.tagAutoComplete)
  Future<ApiResponseDto<SearchTagAutoCompleteDto>> fetchTagAutoComplete({
    @Query(SearchApiQueryKeys.keyword) required String keyword,
    @Query(SearchApiQueryKeys.size)
    int size = SearchApiDefaults.tagAutoCompleteSize,
  });
}

@RestApi(baseUrl: ChzzkApiBaseUrls.comm)
// ignore: one_member_abstracts
abstract class SearchCategoryApi {
  factory SearchCategoryApi(Dio dio, {String? baseUrl}) = _SearchCategoryApi;

  @GET(SearchApiPaths.categoryAutoComplete)
  Future<ApiResponseDto<SearchAutoCompleteListDto>> fetchCategoryAutoComplete({
    @Query(SearchApiQueryKeys.keyword) required String keyword,
    @Query(SearchApiQueryKeys.limit)
    int limit = SearchApiDefaults.categoryAutoCompleteLimit,
    @Query(SearchApiQueryKeys.offset) int offset = SearchApiDefaults.offset,
  });
}
