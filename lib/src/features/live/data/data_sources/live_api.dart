import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/network/network.dart';
import '../dtos/live_dtos.dart';
import 'live_api_contract.dart';

part 'live_api.g.dart';

@RestApi(baseUrl: ChzzkApiBaseUrls.service)
abstract class LiveApi {
  factory LiveApi(Dio dio, {String? baseUrl}) = _LiveApi;

  @GET(LiveApiPaths.lives)
  Future<ApiResponseDto<LiveListDto>> getLives({
    @Query(LiveApiQueryKeys.size) int size = LiveApiDefaults.browsePageSize,
    @Query(LiveApiQueryKeys.sortType)
    String sortType = LiveApiDefaults.sortTypePopular,
    @Query(LiveApiQueryKeys.concurrentUserCount) int? concurrentUserCount,
    @Query(LiveApiQueryKeys.liveId) int? liveId,
  });

  @GET(LiveApiPaths.liveStatus)
  Future<ApiResponseDto<LiveStatusDto>> getLiveStatus({
    @Path(LiveApiPathKeys.channelId) required String channelId,
    @Query(LiveApiQueryKeys.includePlayerRecommendContent)
    bool includePlayerRecommendContent =
        LiveApiDefaults.includePlayerRecommendContent,
  });

  @GET(LiveApiPaths.liveDetail)
  Future<ApiResponseDto<LiveDetailDto>> getLiveDetail({
    @Path(LiveApiPathKeys.channelId) required String channelId,
    @Query(LiveApiQueryKeys.dt) required String dt,
    @Query(LiveApiQueryKeys.cu) bool cu = LiveApiDefaults.liveDetailCu,
    @Query(LiveApiQueryKeys.tm) bool tm = LiveApiDefaults.liveDetailTm,
  });

  @POST(LiveApiPaths.watchEvent)
  Future<void> postWatchEvent({
    @Header(LiveWatchEventHeaderKeys.scene)
    String scene = LiveWatchEventHeaderValues.liveEndScene,
    @Body() required Map<String, dynamic> request,
  });
}
