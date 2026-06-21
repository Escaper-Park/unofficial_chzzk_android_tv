import '../../../../core/network/network.dart';
import '../../domain/entities/chat.dart';
import '../../domain/failures/chat_failure.dart';
import '../../domain/repositories/chat_repository.dart';
import '../data_sources/chat_api.dart';
import '../data_sources/chat_api_contract.dart';
import '../mappers/chat_mapper.dart';

final class ChzzkChatRepository implements ChatRepository {
  const ChzzkChatRepository({
    required this.accessTokenApi,
    required this.videoChatApi,
  });

  final ChatAccessTokenApi accessTokenApi;
  final VideoChatApi videoChatApi;

  @override
  Future<ChatAccessToken> fetchAccessToken({
    required String channelId,
    String? chatType,
  }) async {
    try {
      final response = await accessTokenApi.getAccessToken(
        channelId: channelId,
        chatType: chatType ?? ChatApiDefaults.chatTypeStreaming,
      );
      final content = response.requireContent();

      return chatAccessTokenFromDto(content);
    } on Object catch (_, stackTrace) {
      Error.throwWithStackTrace(const ChatLoadFailure(), stackTrace);
    }
  }

  @override
  Future<VideoChatPage> fetchVideoChats({
    required int videoNo,
    required int playerMessageTime,
    int? previousVideoChatSize,
  }) async {
    try {
      final response = await videoChatApi.getVideoChats(
        videoNo: videoNo,
        playerMessageTime: playerMessageTime,
        previousVideoChatSize: previousVideoChatSize,
      );
      final content = response.requireContent();

      return videoChatPageFromDto(content);
    } on Object catch (_, stackTrace) {
      Error.throwWithStackTrace(const ChatLoadFailure(), stackTrace);
    }
  }
}
