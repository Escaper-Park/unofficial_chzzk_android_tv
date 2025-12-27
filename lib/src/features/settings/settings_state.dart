import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'controller/chat_setting_controller.dart';
import 'controller/settings_screen_controller.dart';
import 'controller/stream_setting_controller.dart';
import 'controller/update_controller.dart';

import 'model/chat_settings.dart';
import 'model/stream_settings.dart';

mixin class SettingsState {
  /* main screen*/
  int getCurrentSettingMenuIndex(WidgetRef ref) =>
      ref.watch(settingsScreenControllerProvider);

  /* detail-screen: stream settings */
  StreamSettings getCurrentStreamSettings(WidgetRef ref) =>
      ref.watch(streamSettingsControllerProvider);

  /* detail-screen: chat settings */
  ChatSettings getCurrentChatSettings(WidgetRef ref) =>
      ref.watch(chatSettingsControllerProvider);

  /* detail-screen: update */
  AsyncValue<(String, String)?> getAsyncUpdate(WidgetRef ref) =>
      ref.watch(updateControllerProvider);
}
