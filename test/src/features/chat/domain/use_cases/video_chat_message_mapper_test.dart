import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/chat/domain/entities/chat.dart';
import 'package:unofficial_chzzk_android_tv/src/features/chat/domain/use_cases/video_chat_message_mapper.dart';

void main() {
  test('maps video chat profile, extras, and player time', () {
    final page = VideoChatPage(
      nextPlayerMessageTime: 3000,
      previousMessages: const [
        VideoChatReplayMessage(
          chatChannelId: 'chat-a',
          content: 'previous',
          extras: null,
          messageStatusType: 'NORMAL',
          messageTime: 100,
          messageTypeCode: 1,
          playerMessageTime: 900,
          profile: null,
          userIdHash: 'fallback-user',
        ),
      ],
      messages: [
        VideoChatReplayMessage(
          chatChannelId: 'chat-a',
          content: 'hello {:smile:}',
          extras: _extras,
          messageStatusType: 'NORMAL',
          messageTime: 200,
          messageTypeCode: 10,
          playerMessageTime: 1500,
          profile: _profile,
          userIdHash: 'fallback-user',
        ),
      ],
    );

    final mapped = playerChatMessagePageFromVideoChatPage(page);
    final message = mapped.messages.single;

    expect(mapped.nextPlayerMessageTime, 3000);
    expect(mapped.previousMessages.single.content, 'previous');
    expect(message.source, PlayerChatMessageSource.vod);
    expect(message.playerMessageTime, 1500);
    expect(message.userIdHash, 'profile-user');
    expect(message.nickname, 'tester');
    expect(message.verifiedMark, isTrue);
    expect(message.nicknameBadgeImageUrl, 'https://example.com/nickname.png');
    expect(message.userBadgeImageUrls, [
      'https://example.com/subscription.png',
      'https://example.com/viewer.png',
    ]);
    expect(message.emojis, {'smile': 'https://example.com/smile.png'});
    expect(message.isAnonymous, isTrue);
    expect(message.payAmount, 1000);
    expect(message.isDonation, isTrue);
  });
}

final _profile = jsonEncode({
  'userIdHash': 'profile-user',
  'nickname': 'tester',
  'userRoleCode': 'streamer',
  'verifiedMark': true,
  'badge': {'imageUrl': 'https://example.com/nickname.png'},
  'streamingProperty': {
    'subscription': {
      'badge': {'imageUrl': 'https://example.com/subscription.png'},
    },
  },
  'viewerBadges': [
    {
      'badge': {'imageUrl': 'https://example.com/viewer.png'},
    },
  ],
});

final _extras = jsonEncode({
  'emojis': {'smile': 'https://example.com/smile.png'},
  'isAnonymous': true,
  'payAmount': 1000,
});
