part of 'live_chat_service.dart';

final class _LiveChatSocketConnection implements LiveChatConnection {
  _LiveChatSocketConnection({
    required this._channel,
    required this._chatChannelId,
    required this._accessToken,
    required this._clientId,
    required this._windowId,
    required this._pingInterval,
    required this._pongTimeout,
  });

  final WebSocketChannel _channel;
  final String _chatChannelId;
  final String _accessToken;
  final String _clientId;
  final String _windowId;
  final Duration _pingInterval;
  final Duration _pongTimeout;
  final StreamController<LiveChatMessageBatch> _batches =
      StreamController<LiveChatMessageBatch>.broadcast();

  StreamSubscription<dynamic>? _subscription;
  Timer? _pingTimer;
  Timer? _pongTimeoutTimer;
  String? _sessionId;
  var _nextTid = 1;
  var _requestedRecentMessages = false;
  var _isDisposed = false;

  @override
  Stream<LiveChatMessageBatch> get batches => _batches.stream;

  void start() {
    _subscription = _channel.stream
        .asyncExpand(_decodeRawFrame)
        .listen(
          _handleFrame,
          onError: _addError,
          onDone: () {
            _addError(StateError('Live chat websocket closed.'));
          },
          cancelOnError: false,
        );
    _sendConnect();
    _schedulePing();
  }

  @override
  Future<void> dispose() async {
    if (_isDisposed) {
      return;
    }

    _isDisposed = true;
    _pingTimer?.cancel();
    _pingTimer = null;
    _pongTimeoutTimer?.cancel();
    _pongTimeoutTimer = null;
    await _subscription?.cancel();
    await _channel.sink.close();
    await _batches.close();
  }

  void _sendConnect() {
    _sendFrame(
      _liveChatConnectFrame(
        chatChannelId: _chatChannelId,
        accessToken: _accessToken,
        clientId: _clientId,
        windowId: _windowId,
        transactionId: _nextTransactionId(),
      ),
    );
  }

  void _requestRecentMessages() {
    final sessionId = _sessionId;
    if (sessionId == null ||
        sessionId.isEmpty ||
        _requestedRecentMessages ||
        _isDisposed) {
      return;
    }

    _requestedRecentMessages = true;
    _sendFrame(
      _liveChatRecentMessagesFrame(
        chatChannelId: _chatChannelId,
        sessionId: sessionId,
        transactionId: _nextTransactionId(),
      ),
    );
  }

  Stream<Map<String, dynamic>> _decodeRawFrame(dynamic rawFrame) async* {
    if (_isDisposed) {
      return;
    }

    _schedulePing();
    _clearPongTimeout();
    final frames = await _decodeFrames(rawFrame);
    if (_isDisposed) {
      return;
    }

    for (final frame in frames) {
      yield frame;
    }
  }

  void _handleFrame(Map<String, dynamic> frame) {
    final command = frame['cmd'];
    if (command is! int) {
      return;
    }

    switch (command) {
      case LiveChatMessageParser.pingCommand:
        _sendPong();
        return;
      case LiveChatMessageParser.pongCommand:
        return;
      case LiveChatMessageParser.connectedCommand:
        _sessionId = LiveChatMessageParser.parseSessionId(frame);
        _requestRecentMessages();
        return;
      case LiveChatMessageParser.recentMessagesCommand:
        _emit(
          LiveChatMessageParser.parseRecentMessages(frame),
          replaceExisting: true,
        );
        return;
      case LiveChatMessageParser.liveChatCommand:
      case LiveChatMessageParser.donationChatCommand:
        _emit(
          LiveChatMessageParser.parseRealtimeMessages(frame),
          replaceExisting: false,
        );
        return;
      default:
        return;
    }
  }

  void _emit(
    List<PlayerChatMessage> messages, {
    required bool replaceExisting,
  }) {
    if (_isDisposed ||
        _batches.isClosed ||
        messages.isEmpty && !replaceExisting) {
      return;
    }

    _batches.add(
      LiveChatMessageBatch(
        messages: messages,
        replaceExisting: replaceExisting,
      ),
    );
  }

  Future<List<Map<String, dynamic>>> _decodeFrames(dynamic rawFrame) async {
    return switch (rawFrame) {
      final String value
          when value.length >=
              LiveChatService._frameDecodeIsolateThresholdBytes =>
        Isolate.run(() => _decodeLiveChatJsonFrames(value)),
      final String value => _decodeLiveChatJsonFrames(value),
      final Map<String, dynamic> value => [value],
      final Map value => [Map<String, dynamic>.from(value)],
      _ => const <Map<String, dynamic>>[],
    };
  }

  void _sendPing() {
    _sendFrame(_liveChatPingFrame);
    _schedulePongTimeout();
  }

  void _sendPong() {
    _sendFrame(_liveChatPongFrame);
  }

  void _sendFrame(Map<String, dynamic> payload) {
    if (_isDisposed) {
      return;
    }

    _channel.sink.add(jsonEncode(payload));
  }

  void _schedulePing() {
    _pingTimer?.cancel();
    _pingTimer = Timer(_pingInterval, _sendPing);
  }

  void _schedulePongTimeout() {
    _pongTimeoutTimer?.cancel();
    _pongTimeoutTimer = Timer(_pongTimeout, () {
      _addError(StateError('Live chat heartbeat timed out.'));
      unawaited(dispose());
    });
  }

  void _clearPongTimeout() {
    _pongTimeoutTimer?.cancel();
    _pongTimeoutTimer = null;
  }

  int _nextTransactionId() => _nextTid++;

  void _addError(Object error, [StackTrace? stackTrace]) {
    if (_isDisposed || _batches.isClosed) {
      return;
    }

    _batches.addError(error, stackTrace);
  }
}
