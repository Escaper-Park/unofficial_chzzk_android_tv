part of 'live_chat_service.dart';

enum _LiveChatDecodedActionType {
  ping,
  pong,
  connected,
  recentMessages,
  realtimeMessages,
}

final class _LiveChatDecodedAction {
  const _LiveChatDecodedAction._({
    required this.type,
    this.sessionId,
    this.messages = const <PlayerChatMessage>[],
  });

  const _LiveChatDecodedAction.ping()
    : this._(type: _LiveChatDecodedActionType.ping);

  const _LiveChatDecodedAction.pong()
    : this._(type: _LiveChatDecodedActionType.pong);

  const _LiveChatDecodedAction.connected(String? sessionId)
    : this._(
        type: _LiveChatDecodedActionType.connected,
        sessionId: sessionId,
      );

  const _LiveChatDecodedAction.recentMessages(
    List<PlayerChatMessage> messages,
  ) : this._(
        type: _LiveChatDecodedActionType.recentMessages,
        messages: messages,
      );

  const _LiveChatDecodedAction.realtimeMessages(
    List<PlayerChatMessage> messages,
  ) : this._(
        type: _LiveChatDecodedActionType.realtimeMessages,
        messages: messages,
      );

  final _LiveChatDecodedActionType type;
  final String? sessionId;
  final List<PlayerChatMessage> messages;
}

List<_LiveChatDecodedAction> _decodeLiveChatActions(Object? rawFrame) {
  final frames = switch (rawFrame) {
    final String value => _decodeLiveChatJsonFrames(value),
    final Map<String, dynamic> value => <Map<String, dynamic>>[value],
    final Map value => <Map<String, dynamic>>[
      Map<String, dynamic>.from(value),
    ],
    _ => const <Map<String, dynamic>>[],
  };
  if (frames.isEmpty) {
    return const <_LiveChatDecodedAction>[];
  }

  final actions = <_LiveChatDecodedAction>[];
  for (final frame in frames) {
    final command = frame['cmd'];
    if (command is! int) {
      continue;
    }

    switch (command) {
      case LiveChatMessageParser.pingCommand:
        actions.add(const _LiveChatDecodedAction.ping());
      case LiveChatMessageParser.pongCommand:
        actions.add(const _LiveChatDecodedAction.pong());
      case LiveChatMessageParser.connectedCommand:
        actions.add(
          _LiveChatDecodedAction.connected(
            LiveChatMessageParser.parseSessionId(frame),
          ),
        );
      case LiveChatMessageParser.recentMessagesCommand:
        actions.add(
          _LiveChatDecodedAction.recentMessages(
            LiveChatMessageParser.parseRecentMessages(frame),
          ),
        );
      case LiveChatMessageParser.liveChatCommand:
      case LiveChatMessageParser.donationChatCommand:
        actions.add(
          _LiveChatDecodedAction.realtimeMessages(
            LiveChatMessageParser.parseRealtimeMessages(frame),
          ),
        );
      default:
    }
  }

  return actions;
}

/// Owns one long-lived JSON/parser isolate for exactly one socket connection.
///
/// The websocket stream awaits each [decode] call, so at most one request is
/// normally outstanding. The request map still makes shutdown and unexpected
/// isolate termination deterministic if that invariant changes later.
final class _LiveChatFrameDecodeWorker {
  _LiveChatFrameDecodeWorker({
    required this.onTerminalFailure,
  }) {
    _responsePort.listen(_handleWorkerMessage);
    _errorPort.listen(_handleWorkerError);
    _exitPort.listen(_handleWorkerExit);
  }

  final void Function(Object error, StackTrace stackTrace) onTerminalFailure;
  final ReceivePort _responsePort = ReceivePort();
  final ReceivePort _errorPort = ReceivePort();
  final ReceivePort _exitPort = ReceivePort();
  final Completer<void> _ready = Completer<void>();
  final Map<int, Completer<List<_LiveChatDecodedAction>>> _pending =
      <int, Completer<List<_LiveChatDecodedAction>>>{};

  Isolate? _isolate;
  SendPort? _requestPort;
  var _nextRequestId = 1;
  var _started = false;
  var _workerReady = false;
  var _usesMainIsolateFallback = false;
  var _isDisposed = false;
  var _hasFailed = false;
  var _portsClosed = false;

  void start() {
    if (_started || _isDisposed) {
      return;
    }

    _started = true;
    unawaited(_spawnWorker());
  }

  Future<List<_LiveChatDecodedAction>> decode(Object? rawFrame) async {
    if (_isDisposed || !_isSupportedFrame(rawFrame)) {
      return const <_LiveChatDecodedAction>[];
    }

    if (!_started) {
      start();
    }
    await _ready.future;
    if (_isDisposed) {
      return const <_LiveChatDecodedAction>[];
    }
    if (_usesMainIsolateFallback) {
      // Isolate spawning is attempted once per connection. If the platform
      // refuses it, keep the connection functional without retry churn.
      return _decodeLiveChatActions(rawFrame);
    }
    if (_hasFailed) {
      throw StateError('Live chat decode worker is unavailable.');
    }

    final requestPort = _requestPort;
    if (requestPort == null) {
      final error = StateError('Live chat decode worker did not become ready.');
      _failWorker(error, StackTrace.current);
      throw error;
    }

    final requestId = _nextRequestId++;
    final completer = Completer<List<_LiveChatDecodedAction>>();
    _pending[requestId] = completer;
    try {
      requestPort.send(<Object?>[requestId, rawFrame]);
    } on Object catch (error, stackTrace) {
      _failWorker(error, stackTrace);
    }
    return completer.future;
  }

  Future<void> dispose() async {
    if (_isDisposed) {
      return;
    }

    _isDisposed = true;
    _requestPort = null;
    _isolate?.kill(priority: Isolate.immediate);
    _isolate = null;
    _completeReady();
    for (final completer in _pending.values) {
      if (!completer.isCompleted) {
        completer.complete(const <_LiveChatDecodedAction>[]);
      }
    }
    _pending.clear();
    _closePorts();
  }

  Future<void> _spawnWorker() async {
    try {
      final isolate = await Isolate.spawn<SendPort>(
        _liveChatDecodeWorkerMain,
        _responsePort.sendPort,
        onError: _errorPort.sendPort,
        onExit: _exitPort.sendPort,
        errorsAreFatal: true,
        debugName: 'live-chat-decode',
      );
      if (_isDisposed || _usesMainIsolateFallback || _hasFailed) {
        isolate.kill(priority: Isolate.immediate);
        return;
      }
      _isolate = isolate;
    } on Object {
      if (_isDisposed) {
        _completeReady();
        return;
      }
      _useMainIsolateFallback();
    }
  }

  void _handleWorkerMessage(Object? message) {
    if (_isDisposed || _usesMainIsolateFallback || _hasFailed) {
      return;
    }

    if (!_workerReady) {
      if (message is! SendPort) {
        _useMainIsolateFallback();
        return;
      }
      _requestPort = message;
      _workerReady = true;
      _completeReady();
      return;
    }

    if (message is! List || message.length < 3) {
      _failWorker(
        StateError('Live chat decode worker returned an invalid response.'),
        StackTrace.current,
      );
      return;
    }

    final requestId = message[0];
    final succeeded = message[1];
    if (requestId is! int || succeeded is! bool) {
      _failWorker(
        StateError('Live chat decode worker returned an invalid response.'),
        StackTrace.current,
      );
      return;
    }

    final completer = _pending.remove(requestId);
    if (completer == null || completer.isCompleted) {
      return;
    }
    if (!succeeded) {
      final error = RemoteError(
        '${message[2]}',
        message.length > 3 ? '${message[3]}' : '',
      );
      completer.completeError(error, error.stackTrace);
      _failWorker(error, error.stackTrace);
      return;
    }

    try {
      final payload = message[2];
      if (payload is! List) {
        throw StateError('Live chat decode worker returned invalid actions.');
      }
      completer.complete(List<_LiveChatDecodedAction>.from(payload));
    } on Object catch (error, stackTrace) {
      completer.completeError(error, stackTrace);
      _failWorker(error, stackTrace);
    }
  }

  void _handleWorkerError(Object? message) {
    if (_isDisposed || _usesMainIsolateFallback || _hasFailed) {
      return;
    }

    final errorParts = message is List ? message : const <Object?>[];
    final error = RemoteError(
      errorParts.isNotEmpty ? '${errorParts[0]}' : 'Live chat worker failed.',
      errorParts.length > 1 ? '${errorParts[1]}' : '',
    );
    if (!_workerReady) {
      _useMainIsolateFallback();
      return;
    }
    _failWorker(error, error.stackTrace);
  }

  void _handleWorkerExit(Object? _) {
    if (_isDisposed || _usesMainIsolateFallback || _hasFailed) {
      return;
    }
    if (!_workerReady) {
      _useMainIsolateFallback();
      return;
    }

    _failWorker(
      StateError('Live chat decode worker stopped unexpectedly.'),
      StackTrace.current,
    );
  }

  void _useMainIsolateFallback() {
    if (_isDisposed || _usesMainIsolateFallback || _hasFailed) {
      return;
    }

    _usesMainIsolateFallback = true;
    _requestPort = null;
    _isolate?.kill(priority: Isolate.immediate);
    _isolate = null;
    _completeReady();
    _closePorts();
  }

  void _failWorker(Object error, StackTrace stackTrace) {
    if (_isDisposed || _usesMainIsolateFallback || _hasFailed) {
      return;
    }

    _hasFailed = true;
    _requestPort = null;
    _isolate?.kill(priority: Isolate.immediate);
    _isolate = null;
    if (!_ready.isCompleted) {
      _ready.completeError(error, stackTrace);
    }
    for (final completer in _pending.values) {
      if (!completer.isCompleted) {
        completer.completeError(error, stackTrace);
      }
    }
    _pending.clear();
    _closePorts();
    onTerminalFailure(error, stackTrace);
  }

  bool _isSupportedFrame(Object? rawFrame) {
    return rawFrame is String || rawFrame is Map;
  }

  void _completeReady() {
    if (!_ready.isCompleted) {
      _ready.complete();
    }
  }

  void _closePorts() {
    if (_portsClosed) {
      return;
    }
    _portsClosed = true;
    _responsePort.close();
    _errorPort.close();
    _exitPort.close();
  }
}

void _liveChatDecodeWorkerMain(SendPort responsePort) {
  final requestPort = ReceivePort();
  responsePort.send(requestPort.sendPort);
  requestPort.listen((message) {
    if (message is! List || message.length < 2 || message[0] is! int) {
      return;
    }

    final requestId = message[0] as int;
    try {
      final actions = _decodeLiveChatActions(message[1]);
      responsePort.send(<Object?>[requestId, true, actions]);
    } on Object catch (error, stackTrace) {
      responsePort.send(<Object?>[
        requestId,
        false,
        '$error',
        '$stackTrace',
      ]);
    }
  });
}
