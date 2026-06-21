import '../entities/chat.dart';

abstract interface class ChatRepository {
  Future<ChatAccessToken> fetchAccessToken({
    required String channelId,
    String? chatType,
  });

  Future<VideoChatPage> fetchVideoChats({
    required int videoNo,
    required int playerMessageTime,
    int? previousVideoChatSize,
  });
}
