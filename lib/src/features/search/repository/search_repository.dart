import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../common/constants/api.dart';
import '../../live/model/live.dart';
import '../model/search.dart';

part 'search_repository.g.dart';

@RestApi(baseUrl: ApiUrl.chzzkService)
abstract class SearchRepository {
  factory SearchRepository(Dio dio, {String baseUrl}) = _SearchRepository;

  @GET(ApiUrl.searchChannels)
  Future<SearchChannelResponse?> getSearchChannelResults({
    @Query('keyword') required String keyword,
    @Query('offset') int offset = 0,
    @Query('size') int size = 50,
    @Query('withFirstChannelContent') bool withFirstChannelContent = false,
  });

  @GET(ApiUrl.searchTags)
  Future<LiveResponse?> getSearchTagResults({
    @Query('size') int size = 20,
    @Query('sortType') required String sortType,
    @Query('concurrentUserCount') required int? concurrentUserCount,
    @Query('liveId') required int? liveId,
    @Query('tags') required String tags,
  });
}
