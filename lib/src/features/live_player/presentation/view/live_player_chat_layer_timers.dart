part of 'live_player_chat_layer.dart';

final class _LivePlayerChatLayerTimers {
  Timer? _disconnectTimer;
  Timer? _retryTimer;

  bool get hasDisconnectTimer => _disconnectTimer != null;

  bool get hasRetryTimer => _retryTimer != null;

  void scheduleDisconnect(VoidCallback onElapsed) {
    cancelDisconnect();
    _disconnectTimer = Timer(_chatDisconnectGracePeriod, () {
      _disconnectTimer = null;
      onElapsed();
    });
  }

  void scheduleRetry(VoidCallback onElapsed) {
    cancelRetry();
    _retryTimer = Timer(_chatReconnectDelay, () {
      _retryTimer = null;
      onElapsed();
    });
  }

  void cancelDisconnect() {
    _disconnectTimer?.cancel();
    _disconnectTimer = null;
  }

  void cancelRetry() {
    _retryTimer?.cancel();
    _retryTimer = null;
  }

  void cancelAll() {
    cancelDisconnect();
    cancelRetry();
  }
}

const _chatDisconnectGracePeriod = Duration(seconds: 8);
const _chatReconnectDelay = Duration(milliseconds: 700);
