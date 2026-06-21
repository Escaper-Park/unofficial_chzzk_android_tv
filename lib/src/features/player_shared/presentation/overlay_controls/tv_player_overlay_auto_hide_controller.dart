import 'dart:async';

import 'package:flutter/foundation.dart';

class TvPlayerOverlayAutoHideController extends ChangeNotifier {
  factory TvPlayerOverlayAutoHideController({
    required Duration displayDuration,
  }) {
    return TvPlayerOverlayAutoHideController._(displayDuration);
  }

  TvPlayerOverlayAutoHideController._(this._displayDuration);

  Duration _displayDuration;
  Timer? _timer;
  bool _modalOpen = false;
  int _modalDismissSerial = 0;

  bool get modalOpen => _modalOpen;

  int get modalDismissSerial => _modalDismissSerial;

  void updateDisplayDuration(Duration displayDuration) {
    _displayDuration = displayDuration;
  }

  void restart(VoidCallback onTimeout) {
    _cancelTimer();
    if (_modalOpen) {
      return;
    }

    _timer = Timer(_displayDuration, onTimeout);
  }

  void cancel() {
    _cancelTimer();
  }

  void setModalVisible({required bool visible}) {
    _cancelTimer();
    if (_modalOpen == visible) {
      return;
    }

    _modalOpen = visible;
    notifyListeners();
  }

  void dismissModal() {
    _cancelTimer();
    _modalOpen = false;
    _modalDismissSerial += 1;
    notifyListeners();
  }

  @override
  void dispose() {
    _cancelTimer();
    super.dispose();
  }

  void _cancelTimer() {
    _timer?.cancel();
    _timer = null;
  }
}
