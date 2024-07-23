import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../common/constants/api.dart';
import '../model/following.dart';

part 'following_repository.g.dart';

@RestApi(baseUrl: ApiUrl.chzzkService)
abstract class FollowingRepository {
  factory FollowingRepository(Dio dio, {String baseUrl}) = _FollowingRepository;

  @GET(ApiUrl.followings)
  Future<FollowingResponse?> getFollowingResponse({
    @Query('size') required int size,
    @Query('page') required int page,
  });

  @GET(ApiUrl.followingLives)
  Future<FollowingResponse?> getFollowingLives();
}
