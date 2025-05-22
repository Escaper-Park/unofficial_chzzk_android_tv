import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../common/constants/api.dart';
import '../model/auto_complete_tag_response.dart';
import '../model/search_tag_response.dart';

part 'search_tag_repository.g.dart';

@RestApi(baseUrl: BaseUrl.chzzkService)
abstract class SearchTagRepository {
  factory SearchTagRepository(Dio dio, {String baseUrl}) = _SearchTagRepository;

  @GET(ChzzkServiceApi.autoCompleteSearchTags)
  Future<AutoCompleteTagResponse?> getAutoCompleteTagResponse({
    @Query('keyword') required String keyword,
    @Query('size') required int size,
  });

  @GET(ChzzkServiceApi.searchLivesWithTag)
  Future<SearchTagLiveResponse?> getSearchTagLiveResponse({
    @Query('tags') required String tags,
    @Query('size') required int size,
    @Query('sortType') required String sortType,
    @Query('concurrentUserCount') required int? concurrentUserCount,
    @Query('liveId') required int? liveId,
  });

  @GET(ChzzkServiceApi.searchVodsWithTag)
  Future<SearchTagVodResponse?> getSearchTagVodResponse({
    @Query('tag') required String tag,
    @Query('size') required int size,
    @Query('sortType') required String sortType,
    @Query('start') required int? start,
  });
}
