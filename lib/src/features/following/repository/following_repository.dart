import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../common/constants/api.dart' show BaseUrl, ChzzkServiceApi;
import '../model/following_response.dart';

part 'following_repository.g.dart';

@RestApi(baseUrl: BaseUrl.chzzkService)
abstract class FollowingRepository {
  factory FollowingRepository(Dio dio, {String baseUrl}) = _FollowingRepository;

  @GET(ChzzkServiceApi.followings)
  Future<FollowingResponse?> getFollowings({
    @Query('size') required int size,
    @Query('page') required int page,
  });

  @GET(ChzzkServiceApi.followingLives)
  Future<FollowingResponse?> getFollowingLives({
    @Query('sortType') required String sortType,
  });
}
