part of 'live_player_chat_layer.dart';

extension _LivePlayerChatLayerConnectionHelpers
    on _LivePlayerChatLayerConnection {
  bool _isCurrentConnection(int serial, LiveChatSessionRequest request) {
    return mounted && _connectSerial == serial && _isCurrentSession(request);
  }

  bool _isCurrentSession(LiveChatSessionRequest request) {
    return mounted && _sessionActive && _activeRequest == request;
  }

  Future<void> _disposeConnection({bool clearActiveRequest = true}) {
    final subscription = _messageSubscription;
    _messageSubscription = null;
    if (subscription != null) {
      unawaited(subscription.cancel().catchError((_) {}));
    }

    final connection = _connection;
    _connection = null;
    if (clearActiveRequest) {
      _activeRequest = null;
    }

    if (connection == null) {
      return _connectionCleanup;
    }

    final nextCleanup = _disposeLiveChatConnectionAfter(
      _connectionCleanup,
      connection,
    );
    _connectionCleanup = nextCleanup;
    return _connectionCleanup;
  }
}

Future<void> _disposeLiveChatConnectionAfter(
  Future<void> previous,
  LiveChatConnection connection,
) async {
  await _waitForLiveChatConnectionCleanup(previous);

  Future<void> current;
  try {
    current = connection.dispose();
  } on Object {
    return;
  }
  await _waitForLiveChatConnectionCleanup(current);
}

Future<void> _waitForLiveChatConnectionCleanup(Future<void> cleanup) async {
  try {
    await cleanup.timeout(
      _liveChatConnectionCleanupTimeout,
      onTimeout: () {},
    );
  } on Object {
    // A stuck connection must not block browse exit or a later reconnect.
  }
}

const _liveChatConnectionCleanupTimeout = Duration(seconds: 3);
