import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../common/constants/enums.dart' show PlaybackDirection;

part 'vod_seek_indicator_controller.g.dart';

@riverpod
class VodSeekIndicatorController extends _$VodSeekIndicatorController {
  Timer? _timer;
  late PlaybackDirection? _direction;

  PlaybackDirection? getCurrentDirection() => _direction;

  @override
  bool build() {
    _direction = null;
    // if true, show icon
    return false;
  }

  void startTimer(PlaybackDirection direction) {
    _direction = direction;
    _resetTimer();

    state = true;
    _timer = Timer(
      const Duration(milliseconds: 500),
      () {
        state = false;
        _resetTimer();
      },
    );
  }

  void _resetTimer() {
    _timer?.cancel();
    _timer = null;
  }
}
