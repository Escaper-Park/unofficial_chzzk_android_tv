import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/constants/enums.dart' show LiveMode;

part 'live_mode_controller.g.dart';

@Riverpod(keepAlive: true)
class LiveModeController extends _$LiveModeController {
  @override
  LiveMode build() {
    return LiveMode.single;
  }

  void reset() {
    state = LiveMode.single;
  }

  void changeMode() {
    state = state == LiveMode.single ? LiveMode.multi : LiveMode.single;
  }
}
