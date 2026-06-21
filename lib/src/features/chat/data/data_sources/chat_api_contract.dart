abstract final class ChatApiPaths {
  static const accessToken = '/nng_main/v1/chats/access-token';
  static const videoChats = '/service/v1/videos/{videoNo}/chats';
}

abstract final class ChatApiPathKeys {
  static const videoNo = 'videoNo';
}

abstract final class ChatApiQueryKeys {
  static const channelId = 'channelId';
  static const chatType = 'chatType';
  static const playerMessageTime = 'playerMessageTime';
  static const previousVideoChatSize = 'previousVideoChatSize';
}

abstract final class ChatApiDefaults {
  static const chatTypeStreaming = 'STREAMING';
}
