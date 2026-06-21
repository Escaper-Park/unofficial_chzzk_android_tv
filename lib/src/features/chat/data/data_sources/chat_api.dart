import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/network/network.dart';
import '../dtos/chat_dtos.dart';
import 'chat_api_contract.dart';

part 'chat_api.g.dart';

@RestApi(baseUrl: ChzzkApiBaseUrls.comm)
// ignore: one_member_abstracts
abstract class ChatAccessTokenApi {
  factory ChatAccessTokenApi(Dio dio, {String? baseUrl}) = _ChatAccessTokenApi;

  @GET(ChatApiPaths.accessToken)
  Future<ApiResponseDto<ChatAccessTokenDto>> getAccessToken({
    @Query(ChatApiQueryKeys.channelId) required String channelId,
    @Query(ChatApiQueryKeys.chatType)
    String chatType = ChatApiDefaults.chatTypeStreaming,
  });
}

@RestApi(baseUrl: ChzzkApiBaseUrls.service)
// ignore: one_member_abstracts
abstract class VideoChatApi {
  factory VideoChatApi(Dio dio, {String? baseUrl}) = _VideoChatApi;

  @GET(ChatApiPaths.videoChats)
  Future<ApiResponseDto<VideoChatListDto>> getVideoChats({
    @Path(ChatApiPathKeys.videoNo) required int videoNo,
    @Query(ChatApiQueryKeys.playerMessageTime) required int playerMessageTime,
    @Query(ChatApiQueryKeys.previousVideoChatSize) int? previousVideoChatSize,
  });
}
