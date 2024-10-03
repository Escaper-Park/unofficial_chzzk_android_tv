import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'wakelock_monitor_controller.g.dart';

@Riverpod(keepAlive: true)
class WakelockMonitorController extends _$WakelockMonitorController {
  @override
  List<bool> build() {
    return [];
  }

  void setWakelockEnable(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index) true else state[i]
    ];
  }

  void setWakelockDisable(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index) false else state[i]
    ];
  }

  void addState() {
    state = [...state, true];
  }

  void removeLast() {
    state = List.from(state)..removeLast();
  }

  void reset() {
    state = [];
  }
}
