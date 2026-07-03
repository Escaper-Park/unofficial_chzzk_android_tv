part of 'live_player_chat_layer.dart';

mixin _LivePlayerChatLayerConnection on State<LivePlayerChatLayer> {
  final _chatLayerTimers = _LivePlayerChatLayerTimers();
  LiveChatConnection? _connection;
  StreamSubscription<List<PlayerChatMessage>>? _messageSubscription;
  LiveChatSessionRequest? _activeRequest;
  List<PlayerChatMessage> _messages = const <PlayerChatMessage>[];
  Future<void> _connectionCleanup = Future<void>.value();
  _LivePlayerChatLayerStatus _status = _LivePlayerChatLayerStatus.loading;
  final _chatSnapshot = ValueNotifier(
    const _LivePlayerChatLayerSnapshot(
      messages: <PlayerChatMessage>[],
      status: _LivePlayerChatLayerStatus.loading,
    ),
  );
  var _connectSerial = 0;
  var _connectAttempt = 0;
  var _isConnecting = false;
  var _sessionActive = false;

  void _syncSession({required bool notify}) {
    final mode = PlayerChatPresentationMode.fromLiveSettingsIndex(
      widget.presentationModeIndex,
    );
    final request = LiveChatSessionRequest.tryCreate(
      channelId: widget.channelId,
      chatChannelId: widget.chatChannelId,
    );

    if (mode == PlayerChatPresentationMode.hidden || request == null) {
      _disconnectNow(clearMessages: true);
      return;
    }

    if (widget.playbackActive) {
      _chatLayerTimers.cancelDisconnect();
      if (!_sessionActive) {
        _updateState(
          () {
            _sessionActive = true;
          },
          notify: notify,
        );
      }
      _connectIfNeeded(request, notify: notify);
      return;
    }

    if (_activeRequest != null && _activeRequest != request) {
      _disconnectNow(clearMessages: true);
      return;
    }

    if (widget.disconnectImmediatelyWhenInactive) {
      _disconnectNow();
      return;
    }

    if (_sessionActive && !_chatLayerTimers.hasDisconnectTimer) {
      _chatLayerTimers.scheduleDisconnect(() {
        if (!mounted) {
          return;
        }

        _disconnectNow();
      });
    }
  }

  void _connectIfNeeded(
    LiveChatSessionRequest request, {
    required bool notify,
  }) {
    if (_activeRequest == request &&
        (_connection != null ||
            _isConnecting ||
            _chatLayerTimers.hasRetryTimer)) {
      return;
    }

    _chatLayerTimers.cancelRetry();
    _connectAttempt = 0;
    _connect(request, notify: notify, clearMessages: true);
  }

  void _connect(
    LiveChatSessionRequest request, {
    required bool notify,
    required bool clearMessages,
  }) {
    _connectSerial += 1;
    final serial = _connectSerial;
    final cleanup = _disposeConnection(clearActiveRequest: false);
    _activeRequest = request;
    _isConnecting = true;
    _connectAttempt += 1;
    _updateState(
      () {
        if (clearMessages) {
          _updateChatSnapshot(
            messages: const <PlayerChatMessage>[],
            status: _LivePlayerChatLayerStatus.loading,
          );
          return;
        }
        _updateChatSnapshot(status: _LivePlayerChatLayerStatus.loading);
      },
      notify: notify,
    );

    unawaited(
      _connectAfterCleanup(
        cleanup: cleanup,
        serial: serial,
        request: request,
      ),
    );
  }

  Future<void> _connectAfterCleanup({
    required Future<void> cleanup,
    required int serial,
    required LiveChatSessionRequest request,
  }) async {
    await cleanup;
    if (!_isCurrentConnection(serial, request)) {
      return;
    }

    try {
      final connection = await widget.connectLiveChat(request);
      if (!_isCurrentConnection(serial, request)) {
        await connection.dispose();
        return;
      }

      _connection = connection;
      _isConnecting = false;
      _updateChatSnapshot(status: _LivePlayerChatLayerStatus.data);
      _messageSubscription =
          liveChatMessageSnapshotsFromBatches(connection.batches).listen(
            (messages) {
              if (!_isCurrentConnection(serial, request)) {
                return;
              }

              _updateChatSnapshot(
                messages: messages,
                status: _LivePlayerChatLayerStatus.data,
              );
            },
            onError: (Object _, StackTrace _) {
              if (!_isCurrentConnection(serial, request)) {
                return;
              }

              _handleConnectionFailure(request);
            },
            onDone: () {
              if (!_isCurrentConnection(serial, request)) {
                return;
              }

              _handleConnectionFailure(request);
            },
          );
    } catch (_) {
      if (!_isCurrentConnection(serial, request)) {
        return;
      }

      _handleConnectionFailure(request);
    }
  }

  void _handleConnectionFailure(LiveChatSessionRequest request) {
    _isConnecting = false;
    unawaited(_disposeConnection(clearActiveRequest: false));
    if (_connectAttempt >= _maxLiveChatConnectAttempts) {
      _updateChatSnapshot(
        messages: const <PlayerChatMessage>[],
        status: _LivePlayerChatLayerStatus.error,
      );
      return;
    }

    _updateChatSnapshot(status: _LivePlayerChatLayerStatus.loading);
    _chatLayerTimers.scheduleRetry(() {
      if (!_isCurrentSession(request)) {
        return;
      }

      _connect(request, notify: true, clearMessages: false);
    });
  }

  void _disconnectNow({bool clearMessages = false}) {
    _chatLayerTimers.cancelAll();
    _connectSerial += 1;
    _connectAttempt = 0;
    _isConnecting = false;
    unawaited(_disposeConnection());
    if (!mounted) {
      return;
    }

    final shouldUpdate =
        _sessionActive ||
        clearMessages && _messages.isNotEmpty ||
        clearMessages && _status != _LivePlayerChatLayerStatus.loading;
    if (!shouldUpdate) {
      return;
    }

    setState(() {
      _sessionActive = false;
      if (clearMessages) {
        _updateChatSnapshot(
          messages: const <PlayerChatMessage>[],
          status: _LivePlayerChatLayerStatus.loading,
        );
      }
    });
  }

  void _updateState(
    VoidCallback update, {
    required bool notify,
  }) {
    if (notify) {
      setState(update);
      return;
    }

    update();
  }

  void _updateChatSnapshot({
    List<PlayerChatMessage>? messages,
    _LivePlayerChatLayerStatus? status,
  }) {
    final nextMessages = messages ?? _messages;
    final nextStatus = status ?? _status;
    _messages = nextMessages;
    _status = nextStatus;

    final nextSnapshot = _LivePlayerChatLayerSnapshot(
      messages: nextMessages,
      status: nextStatus,
    );
    if (_chatSnapshot.value == nextSnapshot) {
      return;
    }

    _chatSnapshot.value = nextSnapshot;
  }
}

const _maxLiveChatConnectAttempts = 3;

@immutable
final class _LivePlayerChatLayerSnapshot {
  const _LivePlayerChatLayerSnapshot({
    required this.messages,
    required this.status,
  });

  final List<PlayerChatMessage> messages;
  final _LivePlayerChatLayerStatus status;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is _LivePlayerChatLayerSnapshot &&
            identical(other.messages, messages) &&
            other.status == status;
  }

  @override
  int get hashCode => Object.hash(identityHashCode(messages), status);
}
