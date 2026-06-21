import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/network/network.dart';
import '../dtos/vod_dtos.dart';
import 'vod_api_contract.dart';

part 'vod_api.g.dart';

@RestApi(baseUrl: ChzzkApiBaseUrls.service)
abstract class VodApi {
  factory VodApi(Dio dio, {String? baseUrl}) = _VodApi;

  @GET(VodApiPaths.vods)
  Future<ApiResponseDto<VodListDto>> getVods({
    @Query(VodApiQueryKeys.size) int size = VodApiDefaults.browsePageSize,
    @Query(VodApiQueryKeys.sortType)
    String sortType = VodApiDefaults.sortTypePopular,
    @Query(VodApiQueryKeys.publishDateAt) int? publishDateAt,
    @Query(VodApiQueryKeys.readCount) int? readCount,
  });

  @GET(VodApiPaths.followingVods)
  Future<ApiResponseDto<FollowingVodListDto>> getFollowingVods({
    @Query(VodApiQueryKeys.size) int size = VodApiDefaults.browsePageSize,
    @Query(VodApiQueryKeys.nextNo) String? nextNo,
  });

  @GET(VodApiPaths.vodDetail)
  Future<ApiResponseDto<VodDetailDto>> getVodDetail({
    @Path(VodApiPathKeys.videoNo) required int videoNo,
  });

  @POST(VodApiPaths.watchEvent)
  Future<void> postWatchEvent({
    @Body() required Map<String, dynamic> request,
  });
}

@RestApi(baseUrl: ChzzkApiBaseUrls.player)
// ignore: one_member_abstracts
abstract class VodPlaybackApi {
  factory VodPlaybackApi(Dio dio, {String? baseUrl}) = _VodPlaybackApi;

  @GET(VodApiPaths.playback)
  Future<VodPlaybackDto> getPlayback({
    @Path(VodApiPathKeys.videoId) required String videoId,
    @Query(VodApiQueryKeys.key) required String key,
    @Query(VodApiQueryKeys.sid) String sid = VodApiDefaults.playbackSid,
    @Query(VodApiQueryKeys.deviceType)
    String deviceType = VodApiDefaults.playbackDeviceType,
    @Query(VodApiQueryKeys.status)
    String status = VodApiDefaults.playbackStatus,
    @Query(VodApiQueryKeys.locale)
    String locale = VodApiDefaults.playbackLocale,
    @Query(VodApiQueryKeys.captionLocale)
    String captionLocale = VodApiDefaults.playbackCaptionLocale,
  });
}
