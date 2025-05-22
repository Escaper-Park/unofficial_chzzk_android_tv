import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../common/constants/api.dart';
import '../model/live_detail.dart';
import '../model/live_response.dart';
import '../model/live_status.dart';

part 'live_repository.g.dart';

@RestApi(baseUrl: BaseUrl.chzzkService)
abstract class LiveRepository {
  factory LiveRepository(Dio dio, {String baseUrl}) = _LiveRepository;

  @GET(ChzzkServiceApi.allLives)
  Future<LiveResponse?> getLiveResponse({
    @Query('size') required int size,
    @Query('sortType') required String sortType,
    @Query('concurrentUserCount') required int? concurrentUserCount,
    @Query('liveId') required int? liveId,
  });

  @GET('${ChzzkServiceApi.liveDetail}/{channelId}/live-detail')
  Future<LiveDetail?> getLiveDetail({
    @Path('channelId') required String channelId,
  });
}

@RestApi(baseUrl: BaseUrl.chzzk)
abstract class LiveStatusRepository {
  factory LiveStatusRepository(Dio dio, {String baseUrl}) =
      _LiveStatusRepository;

  @GET('${ChzzkApi.liveStatus}/{channelId}/live-status')
  Future<LiveStatus?> getLiveStatus({
    @Path('channelId') required String channelId,
    @Query('includePlayerRecommendContent')
    required bool includePlayerRecommendContent,
  });
}
