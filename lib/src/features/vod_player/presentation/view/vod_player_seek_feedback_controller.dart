import 'dart:async';

import 'package:flutter/foundation.dart';

import 'vod_player_seek_feedback_overlay.dart';

final class VodPlayerSeekFeedbackController extends ChangeNotifier {
  VodPlayerSeekFeedbackController({
    required this.displayDuration,
  });

  final Duration displayDuration;
  Timer? _timer;
  VodPlayerSeekFeedback? _feedback;

  VodPlayerSeekFeedback? get feedback => _feedback;

  void show({
    required bool forward,
    required Duration position,
  }) {
    _cancelTimer();
    _feedback = VodPlayerSeekFeedback(
      forward: forward,
      position: position,
    );
    notifyListeners();
    _timer = Timer(displayDuration, clear);
  }

  void clear() {
    _cancelTimer();
    if (_feedback == null) {
      return;
    }

    _feedback = null;
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
