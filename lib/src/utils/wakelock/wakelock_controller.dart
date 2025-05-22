import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

part 'wakelock_controller.g.dart';

@Riverpod(keepAlive: true)
class WakelockController extends _$WakelockController {
  @override
  bool build() {
    return false;
  }

  Future<void> enable() async {
    await WakelockPlus.enable();
    state = true;
  }

  Future<void> disable() async {
    await WakelockPlus.disable();
    state = false;
  }
}
