import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../common/constants/api.dart';
import '../model/vod.dart';

part 'vod_repository.g.dart';

enum VodSortType {
  latest('LATEST'),
  popular('POPULAR'),
  following('Following'),
  popularClip('POPULAR'),
  recentClip('RECENT');

  final String value;

  const VodSortType(this.value);
}

@RestApi(baseUrl: ApiUrl.chzzkService)
abstract class VodRepository {
  factory VodRepository(Dio dio, {String baseUrl}) = _VodRepository;

  @GET('${ApiUrl.channelVods}/{channelId}/videos')
  Future<ChannelVodResponse?> getChannelVods({
    @Path('channelId') required String channelId,
    @Query('sortType') required String sortType,
    @Query('pagingType') required String pagingType,
    @Query('page') required int page,
    @Query('size') required int size,
  });

  @GET(ApiUrl.followingVods)
  Future<FollowingVodResponse?> getFollowingVods({
    @Query('size') required int size,
    @Query('nextNo') required int? nextNo,
  });

  @GET(ApiUrl.popularVods)
  Future<PopularVodResponse?> getPopularVods({
    @Query('size') required int size,
  });

  @GET('${ApiUrl.vod}/{videoNo}')
  Future<Vod?> getVod({@Path('videoNo') required int videoNo});

  // TODO : POST EVENT
}
