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

    final nextCleanup = connection.dispose().catchError((_) {});
    _connectionCleanup = _connectionCleanup.then<void>(
      (_) => nextCleanup,
      onError: (_) => nextCleanup,
    );
    return _connectionCleanup;
  }
}
