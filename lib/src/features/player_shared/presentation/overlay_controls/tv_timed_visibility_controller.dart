import 'dart:async';

import 'package:flutter/foundation.dart';

class TvTimedVisibilityController extends ChangeNotifier {
  TvTimedVisibilityController({
    required this.displayDuration,
  });

  final Duration displayDuration;
  Timer? _timer;
  bool _isShowing = false;

  bool get isShowing => _isShowing;

  void show() {
    _cancelTimer();
    if (!_isShowing) {
      _isShowing = true;
      notifyListeners();
    }

    _timer = Timer(displayDuration, hide);
  }

  void hide() {
    _cancelTimer();
    if (!_isShowing) {
      return;
    }

    _isShowing = false;
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
