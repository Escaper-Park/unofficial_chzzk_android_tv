import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../../../common/constants/api.dart';
import '../model/vod.dart';
import '../model/vod_chat_response.dart';
import '../model/vod_event.dart';
import '../model/vod_response.dart';

part 'vod_repository.g.dart';

@RestApi(baseUrl: BaseUrl.chzzk)
abstract class VodRepository {
  factory VodRepository(Dio dio, {String baseUrl}) = _VodRepository;

  @GET('/service${ChzzkServiceApi.vod}/{videoNo}')
  Future<Vod?> getVodDetail({
    @Path('videoNo') required int videoNo,
  });

  @GET('/service${ChzzkServiceApi.allVods}')
  Future<VodResponse?> getAllVods({
    @Query('size') required int size,
    @Query('sortType') required String sortType,
    @Query('publishDateAt') required int? publishDateAt,
    @Query('readCount') required int? readCount,
  });

  @GET('/service${ChzzkServiceApi.channelVods}/{channelId}/videos')
  Future<ChannelVodResponse?> getChannelVods({
    @Path('channelId') required String channelId,
    @Query('sortType') required String sortType,
    @Query('pagingType') required String pagingType,
    @Query('page') required int page,
    @Query('size') required int size,
    @Query('publishDateAt') required int? publishDateAt,
    @Query('videoType') required String? videoType,
  });

  @GET('/service${ChzzkServiceApi.followingVods}')
  Future<FollowingVodResponse?> getFollowingVods({
    @Query('size') required int size,
    @Query('nextNo') required String? nextNo,
  });

  @GET('/service${ChzzkServiceApi.categoryVods}/{categoryType}/{categoryId}/videos')
  Future<CategoryVodResponse?> getCategoryVods({
    @Query('publishDateAt') required int? publishDateAt,
    @Query('readCount') required int? readCount,
  });

  @GET('/service${ChzzkServiceApi.vodChat}/{videoNo}/chats')
  Future<VodChatResponse?> getVodChat({
    @Path('videoNo') required int videoNo,
    @Query('playerMessageTime') required int playerMessageTime,
    @Query('previousVideoChatSize') required int? previousVideoChatSize,
  });

  @Headers({'Content-Type': 'application/json'})
  @POST(ChzzkApi.watchEvent)
  Future<void> postWatchingEvent({
    @Body() required VodEvent event,
  });
}
