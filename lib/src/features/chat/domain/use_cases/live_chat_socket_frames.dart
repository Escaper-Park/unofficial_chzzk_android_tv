part of 'live_chat_service.dart';

Map<String, dynamic> _liveChatConnectFrame({
  required String chatChannelId,
  required String accessToken,
  required String clientId,
  required String windowId,
  required int transactionId,
}) {
  return <String, dynamic>{
    'ver': LiveChatService._connectVersion,
    'cmd': LiveChatMessageParser.connectCommand,
    'svcid': LiveChatService._chatServiceId,
    'cid': chatChannelId,
    'tid': transactionId,
    'bdy': <String, dynamic>{
      'uid': null,
      'devType': LiveChatService._deviceType,
      'accTkn': accessToken,
      'auth': 'READ',
      'libVer': LiveChatService._libraryVersion,
      'osVer': LiveChatService._osVersion,
      'devName': LiveChatService._deviceName,
      'locale': LiveChatService._locale,
      'timezone': LiveChatService._timezone,
      'uuid': clientId,
      'windowId': windowId,
    },
  };
}

Map<String, dynamic> _liveChatRecentMessagesFrame({
  required String chatChannelId,
  required String sessionId,
  required int transactionId,
}) {
  return <String, dynamic>{
    'ver': LiveChatService._connectVersion,
    'cmd': LiveChatMessageParser.requestRecentCommand,
    'svcid': LiveChatService._chatServiceId,
    'cid': chatChannelId,
    'sid': sessionId,
    'tid': transactionId,
    'bdy': <String, dynamic>{
      'recentMessageCount': LiveChatService._recentMessageCount,
    },
  };
}

const Map<String, dynamic> _liveChatPingFrame = <String, dynamic>{
  'ver': LiveChatService._connectVersion,
  'cmd': LiveChatMessageParser.pingCommand,
};

const Map<String, dynamic> _liveChatPongFrame = <String, dynamic>{
  'ver': LiveChatService._connectVersion,
  'cmd': LiveChatMessageParser.pongCommand,
};
