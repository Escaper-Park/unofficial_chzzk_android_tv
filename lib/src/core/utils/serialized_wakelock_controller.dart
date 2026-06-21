import 'package:wakelock_plus/wakelock_plus.dart';

typedef WakelockSetter = Future<void> Function({required bool enabled});

final class SerializedWakelockController {
  SerializedWakelockController({
    WakelockSetter setEnabled = _setPlatformWakelockEnabled,
    // ignore: prefer_initializing_formals
  }) : _setEnabled = setEnabled;

  final WakelockSetter _setEnabled;
  Future<void> _tail = Future<void>.value();
  bool? _lastRequested;
  var _disposed = false;

  void setEnabled({required bool enabled}) {
    if (_disposed && enabled) {
      return;
    }
    if (_lastRequested == enabled) {
      return;
    }

    _lastRequested = enabled;
    _tail = _tail
        .catchError((Object _) {})
        .then((_) => _setEnabled(enabled: enabled))
        .catchError((Object _) {});
  }

  void dispose() {
    _disposed = true;
    setEnabled(enabled: false);
  }

  Future<void> drain() {
    return _tail.catchError((Object _) {});
  }
}

Future<void> _setPlatformWakelockEnabled({required bool enabled}) {
  return enabled ? WakelockPlus.enable() : WakelockPlus.disable();
}
