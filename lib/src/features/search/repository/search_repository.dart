import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../../../common/constants/api.dart';
import '../model/search.dart';

part 'search_repository.g.dart';

@RestApi(baseUrl: ApiUrl.chzzkService)
abstract class SearchRepository {
  factory SearchRepository(Dio dio, {String baseUrl}) = _SearchRepository;

  @GET(ApiUrl.searchChannels)
  Future<SearchResponse?> getSearchChannelResults({
    @Query('keyword') required String keyword,
    @Query('offset') int offset = 0,
    @Query('size') int size = 50,
    @Query('withFirstChannelContent') bool withFirstChannelContent = false,
  });
}
