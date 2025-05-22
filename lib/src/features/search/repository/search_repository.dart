import 'package:retrofit/retrofit.dart';

import '../../../common/constants/api.dart';
import '../../../utils/dio/dio_client.dart';
import '../model/auto_complete_response.dart';
import '../model/search_response.dart';

part 'search_repository.g.dart';

@RestApi(baseUrl: BaseUrl.chzzkService)
abstract class SearchRepository {
  factory SearchRepository(Dio dio, {String baseUrl}) = _SearchRepository;

  @GET(ChzzkServiceApi.autoCompleteSearchChannels)
  Future<AutoCompleteSearchChannelResponse?>
      getAutoCompleteSearchChannelResponse({
    @Query('keyword') required String keyword,
    @Query('offset') required int offset,
    @Query('size') required int size,
  });

  @GET(ChzzkServiceApi.searchChannels)
  Future<SearchChannelResponse?> getSearchChannelResponse({
    @Query('keyword') required String keyword,
    @Query('offset') required int offset,
    @Query('size') required int size,
    @Query('withFirstChannelContent') required bool withFirstChannelContent,
  });

  @GET(ChzzkServiceApi.searchVods)
  Future<SearchVodResponse?> getSearchVodResponse({
    @Query('keyword') required String keyword,
    @Query('offset') required int offset,
    @Query('size') required int size,
  });

  @GET(ChzzkServiceApi.searchLives)
  Future<SearchLiveResponse?> getSearchLiveResponse({
    @Query('keyword') required String keyword,
    @Query('offset') required int offset,
    @Query('size') required int size,
  });
}

@RestApi(baseUrl: BaseUrl.naverGame)
abstract class CategorySearchRepository {
  factory CategorySearchRepository(Dio dio, {String baseUrl}) = _CategorySearchRepository;

  @GET(NaverGameApi.autoCompleteSearchCategories)
  Future<AutoCompleteSearchCategoryResponse?>
      getAutoCompleteSearchCategoryResponse({
    @Query('keyword') required String keyword,
    @Query('offset') required int offset,
    @Query('limit') required int limit,
  });
}
