import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/network/network.dart';
import '../dtos/channel_dtos.dart';
import 'channel_api_contract.dart';

part 'channel_api.g.dart';

@RestApi(baseUrl: ChzzkApiBaseUrls.service)
abstract class ChannelApi {
  factory ChannelApi(Dio dio, {String? baseUrl}) = _ChannelApi;

  @GET(ChannelApiPaths.channel)
  Future<ApiResponseDto<ChannelDetailDto>> getChannel({
    @Path(ChannelApiPathKeys.channelId) required String channelId,
  });

  @GET(ChannelApiPaths.myInfo)
  Future<ApiResponseDto<ChannelMyInfoDto>> getMyInfo({
    @Path(ChannelApiPathKeys.channelId) required String channelId,
  });

  @GET(ChannelApiPaths.channelVideos)
  Future<ApiResponseDto<ChannelVideoListDto>> getChannelVideos({
    @Path(ChannelApiPathKeys.channelId) required String channelId,
    @Query(ChannelApiQueryKeys.sortType)
    String sortType = ChannelApiDefaults.videoSortTypeLatest,
    @Query(ChannelApiQueryKeys.pagingType)
    String pagingType = ChannelApiDefaults.videoPagingTypePage,
    @Query(ChannelApiQueryKeys.page) int page = ChannelApiDefaults.videoPage,
    @Query(ChannelApiQueryKeys.size)
    int size = ChannelApiDefaults.videoPageSize,
    @Query(ChannelApiQueryKeys.publishDateAt)
    String publishDateAt = ChannelApiDefaults.publishDateAt,
    @Query(ChannelApiQueryKeys.videoType)
    String videoType = ChannelApiDefaults.videoType,
  });

  @POST(ChannelApiPaths.channelFollow)
  Future<void> followChannel({
    @Path(ChannelApiPathKeys.channelId) required String channelId,
  });

  @DELETE(ChannelApiPaths.channelFollow)
  Future<void> unfollowChannel({
    @Path(ChannelApiPathKeys.channelId) required String channelId,
  });

  @PUT(ChannelApiPaths.channelNotification)
  Future<void> enableChannelNotification({
    @Path(ChannelApiPathKeys.channelId) required String channelId,
  });

  @DELETE(ChannelApiPaths.channelNotification)
  Future<void> disableChannelNotification({
    @Path(ChannelApiPathKeys.channelId) required String channelId,
  });
}
