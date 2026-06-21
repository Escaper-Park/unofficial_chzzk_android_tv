import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/network/network.dart';
import '../dtos/following_dtos.dart';
import 'following_api_contract.dart';

part 'following_api.g.dart';

@RestApi(baseUrl: ChzzkApiBaseUrls.service)
abstract class FollowingApi {
  factory FollowingApi(Dio dio, {String? baseUrl}) = _FollowingApi;

  @GET(FollowingApiPaths.channels)
  Future<ApiResponseDto<FollowingChannelListDto>> getFollowingChannels({
    @Query(FollowingApiQueryKeys.page)
    int page = FollowingApiDefaults.channelPage,
    @Query(FollowingApiQueryKeys.size)
    int size = FollowingApiDefaults.channelPageSize,
    @Query(FollowingApiQueryKeys.sortType)
    String sortType = FollowingApiDefaults.channelSortType,
  });

  @GET(FollowingApiPaths.lives)
  Future<ApiResponseDto<FollowingLiveListDto>> getFollowingLives({
    @Query(FollowingApiQueryKeys.sortType)
    String sortType = FollowingApiDefaults.liveSortType,
  });
}
