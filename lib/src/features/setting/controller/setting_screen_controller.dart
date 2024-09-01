import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'setting_screen_controller.g.dart';

@riverpod
class SettingScreenController extends _$SettingScreenController {
  @override
  int build() {
    return 0;
  }

  void setState(int index) {
    state = index;
  }
}
