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
    required this._disposeStepTimeout,
  });

  final WebSocketChannel _channel;
  final String _chatChannelId;
  final String _accessToken;
  final String _clientId;
  final String _windowId;
  final Duration _pingInterval;
  final Duration _pongTimeout;
  final Duration _disposeStepTimeout;
  final StreamController<LiveChatMessageBatch> _batches =
      StreamController<LiveChatMessageBatch>.broadcast();

  StreamSubscription<dynamic>? _subscription;
  _LiveChatFrameDecodeWorker? _frameDecoder;
  Future<void>? _disposeFuture;
  Timer? _pingTimer;
  Timer? _pongTimeoutTimer;
  final Stopwatch _heartbeatClock = Stopwatch();
  Duration _lastInboundElapsed = Duration.zero;
  String? _sessionId;
  var _nextTid = 1;
  var _requestedRecentMessages = false;
  var _started = false;
  var _terminalFailureReported = false;
  var _isDisposed = false;

  @override
  Stream<LiveChatMessageBatch> get batches => _batches.stream;

  void start() {
    if (_started || _isDisposed) {
      return;
    }

    _started = true;
    _heartbeatClock.start();
    _lastInboundElapsed = _heartbeatClock.elapsed;
    _frameDecoder = _LiveChatFrameDecodeWorker(
      onTerminalFailure: _reportTerminalFailure,
    )..start();
    _subscription = _channel.stream
        .asyncExpand(_decodeRawFrame)
        .listen(
          _handleFrame,
          onError: _reportTerminalFailure,
          onDone: () {
            _reportTerminalFailure(
              StateError('Live chat websocket closed.'),
            );
          },
          cancelOnError: false,
        );
    _sendConnect();
    _schedulePing();
  }

  @override
  Future<void> dispose() {
    final disposeFuture = _disposeFuture;
    if (disposeFuture != null) {
      return disposeFuture;
    }

    _isDisposed = true;
    _cancelHeartbeat();
    final nextDisposeFuture = _disposeResources();
    _disposeFuture = nextDisposeFuture;
    return nextDisposeFuture;
  }

  Future<void> _disposeResources() async {
    final frameDecoder = _frameDecoder;
    _frameDecoder = null;
    if (frameDecoder != null) {
      await _runDisposeStep(frameDecoder.dispose);
    }

    final subscription = _subscription;
    _subscription = null;
    if (subscription != null) {
      await _runDisposeStep(subscription.cancel);
    }
    await _runDisposeStep(_channel.sink.close);
    if (!_batches.isClosed) {
      await _runDisposeStep(_batches.close);
    }
  }

  Future<void> _runDisposeStep(Future<dynamic> Function() dispose) async {
    try {
      await dispose().timeout(_disposeStepTimeout, onTimeout: () {});
    } on Object {
      // Cleanup is best-effort and must not block later chat sessions.
    }
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

  Stream<_LiveChatDecodedAction> _decodeRawFrame(dynamic rawFrame) async* {
    if (_isDisposed) {
      return;
    }

    // Heartbeat accounting intentionally happens before isolate work. A large
    // burst of chat must never look like an unresponsive websocket merely
    // because its JSON is still waiting behind an earlier frame.
    _recordInboundFrame();
    _clearPongTimeout();
    final actions = await _decodeFrames(rawFrame);
    if (_isDisposed) {
      return;
    }

    for (final action in actions) {
      yield action;
    }
  }

  void _handleFrame(_LiveChatDecodedAction action) {
    switch (action.type) {
      case _LiveChatDecodedActionType.ping:
        _sendPong();
        return;
      case _LiveChatDecodedActionType.pong:
        return;
      case _LiveChatDecodedActionType.connected:
        _sessionId = action.sessionId;
        _requestRecentMessages();
        return;
      case _LiveChatDecodedActionType.recentMessages:
        _emit(
          action.messages,
          replaceExisting: true,
        );
        return;
      case _LiveChatDecodedActionType.realtimeMessages:
        _emit(
          action.messages,
          replaceExisting: false,
        );
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

  Future<List<_LiveChatDecodedAction>> _decodeFrames(dynamic rawFrame) {
    final frameDecoder = _frameDecoder;
    if (frameDecoder == null) {
      return Future.value(const <_LiveChatDecodedAction>[]);
    }

    return frameDecoder.decode(rawFrame);
  }

  void _sendPing() {
    if (_sendFrame(_liveChatPingFrame)) {
      _schedulePongTimeout();
    }
  }

  void _sendPong() {
    _sendFrame(_liveChatPongFrame);
  }

  bool _sendFrame(Map<String, dynamic> payload) {
    if (_isDisposed || _terminalFailureReported) {
      return false;
    }

    try {
      _channel.sink.add(jsonEncode(payload));
      return true;
    } on Object catch (error, stackTrace) {
      _reportTerminalFailure(error, stackTrace);
      return false;
    }
  }

  void _schedulePing() {
    if (_isDisposed || _terminalFailureReported || _pingTimer != null) {
      return;
    }

    _pingTimer = Timer(_pingInterval, _handlePingDeadline);
  }

  void _recordInboundFrame() {
    _lastInboundElapsed = _heartbeatClock.elapsed;
    _schedulePing();
  }

  void _handlePingDeadline() {
    _pingTimer = null;
    if (_isDisposed || _terminalFailureReported) {
      return;
    }

    final elapsedSinceInbound = _heartbeatClock.elapsed - _lastInboundElapsed;
    final remaining = _pingInterval - elapsedSinceInbound;
    if (remaining > Duration.zero) {
      _pingTimer = Timer(remaining, _handlePingDeadline);
      return;
    }

    _sendPing();
  }

  void _schedulePongTimeout() {
    if (_isDisposed || _terminalFailureReported) {
      return;
    }

    _pongTimeoutTimer?.cancel();
    _pongTimeoutTimer = Timer(_pongTimeout, () {
      _reportTerminalFailure(
        StateError('Live chat heartbeat timed out.'),
      );
    });
  }

  void _clearPongTimeout() {
    _pongTimeoutTimer?.cancel();
    _pongTimeoutTimer = null;
  }

  void _cancelHeartbeat() {
    _pingTimer?.cancel();
    _pingTimer = null;
    _heartbeatClock
      ..stop()
      ..reset();
    _clearPongTimeout();
  }

  int _nextTransactionId() => _nextTid++;

  void _addError(Object error, [StackTrace? stackTrace]) {
    if (_isDisposed || _batches.isClosed) {
      return;
    }

    _batches.addError(error, stackTrace);
  }

  void _reportTerminalFailure(Object error, [StackTrace? stackTrace]) {
    if (_isDisposed || _terminalFailureReported) {
      return;
    }

    _terminalFailureReported = true;
    _cancelHeartbeat();
    _addError(error, stackTrace);
    // Own terminal cleanup even if the broadcast error happened before the UI
    // subscribed. Closing the batches stream lets a late listener observe
    // `done` and start the normal reconnect path.
    unawaited(dispose());
  }
}
