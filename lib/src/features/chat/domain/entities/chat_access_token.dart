part of 'chat.dart';

abstract interface class ChatAccessToken {
  String get accessToken;

  String get extraToken;
}

final class ChatAccessTokenCredentials implements ChatAccessToken {
  const ChatAccessTokenCredentials({
    required this.accessToken,
    required this.extraToken,
  });

  @override
  final String accessToken;

  @override
  final String extraToken;
}
