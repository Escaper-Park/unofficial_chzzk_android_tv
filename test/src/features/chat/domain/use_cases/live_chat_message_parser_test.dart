import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/chat/domain/use_cases/live_chat_message_parser.dart';

void main() {
  test('parses connected session id', () {
    expect(
      LiveChatMessageParser.parseSessionId({
        'cmd': LiveChatMessageParser.connectedCommand,
        'bdy': {'sid': 'session-a'},
      }),
      'session-a',
    );
  });

  test('parses realtime chat profile, extras, and donation values', () {
    final messages = LiveChatMessageParser.parseRealtimeMessages({
      'cmd': LiveChatMessageParser.donationChatCommand,
      'bdy': [
        {
          'msgTime': 1718500000000,
          'msgTypeCode': 10,
          'msg': '후원합니다 {:smile:}',
          'msgStatusType': 'NORMAL',
          'uid': 'fallback-user',
          'profile': jsonEncode({
            'userIdHash': 'profile-user',
            'nickname': '테스터',
            'userRoleCode': 'streamer',
            'verifiedMark': true,
            'badge': {'imageUrl': 'https://example.com/nickname.png'},
            'viewerBadges': [
              {
                'badge': {'imageUrl': 'https://example.com/viewer.png'},
              },
            ],
          }),
          'extras': jsonEncode({
            'emojis': {'smile': 'https://example.com/smile.png'},
            'isAnonymous': true,
            'payAmount': 10000,
          }),
        },
      ],
    });

    expect(messages, hasLength(1));
    final message = messages.single;
    expect(message.source.name, 'live');
    expect(message.userIdHash, 'profile-user');
    expect(message.nickname, '테스터');
    expect(message.verifiedMark, isTrue);
    expect(message.nicknameBadgeImageUrl, 'https://example.com/nickname.png');
    expect(message.userBadgeImageUrls, ['https://example.com/viewer.png']);
    expect(message.emojis, {'smile': 'https://example.com/smile.png'});
    expect(message.isAnonymous, isTrue);
    expect(message.payAmount, 10000);
    expect(message.isDonation, isTrue);
    expect(message.isBadgeCollectorProfile, isTrue);
  });

  test('parses recent messages in chronological order', () {
    final messages = LiveChatMessageParser.parseRecentMessages({
      'cmd': LiveChatMessageParser.recentMessagesCommand,
      'bdy': {
        'messageList': [
          {
            'messageTime': 2000,
            'messageTypeCode': 1,
            'content': 'second',
          },
          {
            'messageTime': 1000,
            'messageTypeCode': 1,
            'content': 'first',
          },
        ],
      },
    });

    expect(
      messages.map((message) => message.content),
      ['first', 'second'],
    );
  });

  test('parses same-time recent messages in original chronological order', () {
    final messages = LiveChatMessageParser.parseRecentMessages({
      'cmd': LiveChatMessageParser.recentMessagesCommand,
      'bdy': {
        'messageList': [
          {
            'messageTime': 1000,
            'messageTypeCode': 1,
            'content': 'newer',
          },
          {
            'messageTime': 1000,
            'messageTypeCode': 1,
            'content': 'older',
          },
        ],
      },
    });

    expect(
      messages.map((message) => message.content),
      ['older', 'newer'],
    );
  });
}
