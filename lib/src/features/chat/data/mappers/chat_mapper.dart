import '../../domain/entities/chat.dart';
import '../dtos/chat_dtos.dart';

ChatAccessToken chatAccessTokenFromDto(ChatAccessTokenDto dto) {
  return ChatAccessTokenCredentials(
    accessToken: dto.accessToken,
    extraToken: dto.extraToken,
  );
}

VideoChatPage videoChatPageFromDto(VideoChatListDto dto) {
  return VideoChatPage(
    nextPlayerMessageTime: dto.nextPlayerMessageTime,
    previousMessages: dto.previousVideoChats
        .map(videoChatMessageFromDto)
        .toList(growable: false),
    messages: dto.videoChats
        .map(videoChatMessageFromDto)
        .toList(
          growable: false,
        ),
  );
}

VideoChatMessage videoChatMessageFromDto(VideoChatMessageDto dto) {
  return VideoChatReplayMessage(
    chatChannelId: dto.chatChannelId,
    content: dto.content,
    extras: dto.extras,
    messageStatusType: dto.messageStatusType,
    messageTime: dto.messageTime,
    messageTypeCode: dto.messageTypeCode,
    playerMessageTime: dto.playerMessageTime,
    profile: dto.profile,
    userIdHash: dto.userIdHash,
  );
}
