import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_preferences_utils.g.dart';

@riverpod
SharedPreferences sharedPrefs(SharedPrefsRef ref) {
  return throw UnimplementedError();
}

class SharedPrefencesKey {
  static const String chatFontSize = 'chatFontSize';
  static const String chatPosition = 'chatPosition';
  static const String chatContainerHeight = 'chatContainerHeight';
  static const String chatContainerWidth = 'chatContainerWidth';
  static const String chatContainerTransparency = 'chatContainerTransparency';

  static const String chatDelaySec = 'chatDelaySec';

  static const String naverId = 'naverId';
}
