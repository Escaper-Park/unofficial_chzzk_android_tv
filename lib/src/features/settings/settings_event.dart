import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'controller/chat_setting_controller.dart';
import 'controller/settings_screen_controller.dart';
import 'controller/stream_setting_controller.dart';
// import 'controller/update_controller.dart';

mixin class SettingsEvent {
  /* main screen */
  void changeScreenIndex(WidgetRef ref, {required int index}) {
    ref.read(settingsScreenControllerProvider.notifier).setState(index);
  }

  /* detail-screen: stream settings */
  StreamSettingsController getStreamSettingsController(WidgetRef ref) =>
      ref.read(streamSettingsControllerProvider.notifier);

  /* detail-screen: chat settings */
  ChatSettingsController getChatSettingsController(WidgetRef ref) =>
      ref.read(chatSettingsControllerProvider.notifier);
}
