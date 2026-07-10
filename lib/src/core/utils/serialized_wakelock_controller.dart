import 'dart:async';

import 'package:wakelock_plus/wakelock_plus.dart';

typedef WakelockSetter = Future<void> Function({required bool enabled});

final class SerializedWakelockController {
  SerializedWakelockController({
    WakelockSetter setEnabled = _setPlatformWakelockEnabled,
    // ignore: prefer_initializing_formals
  }) : _setEnabled = setEnabled;

  final WakelockSetter _setEnabled;
  Future<void> _workerDone = Future<void>.value();
  bool? _lastRequested;
  bool? _lastProcessed;
  var _workerRunning = false;
  var _disposed = false;

  void setEnabled({required bool enabled}) {
    if (_disposed && enabled) {
      return;
    }
    if (_lastRequested == enabled) {
      return;
    }

    _lastRequested = enabled;
    _ensureWorker();
  }

  void dispose() {
    _disposed = true;
    setEnabled(enabled: false);
  }

  Future<void> drain() async {
    while (_workerRunning || _lastProcessed != _lastRequested) {
      await _workerDone;
    }
  }

  void _ensureWorker() {
    if (_workerRunning || _lastProcessed == _lastRequested) {
      return;
    }

    _workerRunning = true;
    final done = Completer<void>();
    _workerDone = done.future;
    unawaited(
      _runWorker().whenComplete(() {
        _workerRunning = false;
        done.complete();
        _ensureWorker();
      }),
    );
  }

  Future<void> _runWorker() async {
    while (true) {
      final enabled = _lastRequested;
      if (enabled == null) {
        return;
      }

      try {
        await _setEnabled(enabled: enabled);
      } on Object {
        // A platform failure must not prevent a later disable request.
      }
      _lastProcessed = enabled;
      if (_lastRequested == enabled) {
        return;
      }
    }
  }
}

Future<void> _setPlatformWakelockEnabled({required bool enabled}) {
  return enabled ? WakelockPlus.enable() : WakelockPlus.disable();
}
