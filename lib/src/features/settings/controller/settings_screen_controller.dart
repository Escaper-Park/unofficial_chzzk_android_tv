import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_screen_controller.g.dart';

@riverpod
class SettingsScreenController extends _$SettingsScreenController {
  @override
  int build() {
    return 0;
  }

  void setState(int index) {
    if (state != index) state = index;
  }
}
