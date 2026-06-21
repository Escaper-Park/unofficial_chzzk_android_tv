import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/chat/data/dtos/chat_dtos.dart';
import 'package:unofficial_chzzk_android_tv/src/features/chat/data/mappers/chat_mapper.dart';
import 'package:unofficial_chzzk_android_tv/src/features/chat/domain/entities/chat.dart';

void main() {
  test('maps chat access token dto to the domain contract', () {
    const dto = ChatAccessTokenDto(
      accessToken: 'access',
      extraToken: 'extra',
    );

    final token = chatAccessTokenFromDto(dto);

    expect(token, isA<ChatAccessToken>());
    expect(token, isNot(isA<ChatAccessTokenDto>()));
    expect(token.accessToken, 'access');
    expect(token.extraToken, 'extra');
  });

  test('chat access token dto ignores unused api fields', () {
    final dto = ChatAccessTokenDto.fromJson({
      'accessToken': 'access',
      'extraToken': 'extra',
      'chatTime': null,
      'realNameAuth': false,
      'temporaryRestrict': {
        'temporaryRestrict': false,
        'times': 0,
        'duration': null,
        'createdTime': null,
      },
    });

    expect(dto.accessToken, 'access');
    expect(dto.extraToken, 'extra');
  });

  test('chat access token dto toString does not expose tokens', () {
    const dto = ChatAccessTokenDto(
      accessToken: 'secret-access-token',
      extraToken: 'secret-extra-token',
    );

    final description = dto.toString();

    expect(description, isNot(contains('secret-access-token')));
    expect(description, isNot(contains('secret-extra-token')));
  });

  test('maps video chat message dto to the domain contract', () {
    const dto = VideoChatMessageDto(
      chatChannelId: 'chat',
      content: 'message',
      messageStatusType: 'NORMAL',
      messageTime: 100,
      messageTypeCode: 1,
      playerMessageTime: 90,
      userIdHash: 'user',
    );

    final message = videoChatMessageFromDto(dto);

    expect(message, isA<VideoChatMessage>());
    expect(message, isNot(isA<VideoChatMessageDto>()));
    expect(message.chatChannelId, 'chat');
    expect(message.content, 'message');
    expect(message.playerMessageTime, 90);
    expect(message.userIdHash, 'user');
  });

  test('maps video chat page', () {
    const dto = VideoChatListDto(
      nextPlayerMessageTime: 200,
      previousVideoChats: [
        VideoChatMessageDto(
          chatChannelId: 'chat',
          content: 'previous',
          messageStatusType: 'NORMAL',
          messageTime: 100,
          messageTypeCode: 1,
          playerMessageTime: 90,
          userIdHash: 'user-a',
        ),
      ],
      videoChats: [
        VideoChatMessageDto(
          chatChannelId: 'chat',
          content: 'current',
          messageStatusType: 'NORMAL',
          messageTime: 120,
          messageTypeCode: 1,
          playerMessageTime: 110,
          userIdHash: 'user-b',
        ),
      ],
    );

    final page = videoChatPageFromDto(dto);

    expect(page.nextPlayerMessageTime, 200);
    expect(page.previousMessages.single, isNot(isA<VideoChatMessageDto>()));
    expect(page.previousMessages.single.content, 'previous');
    expect(page.previousMessages.single.playerMessageTime, 90);
    expect(page.messages.single, isNot(isA<VideoChatMessageDto>()));
    expect(page.messages.single.content, 'current');
    expect(page.messages.single.userIdHash, 'user-b');
  });
}
