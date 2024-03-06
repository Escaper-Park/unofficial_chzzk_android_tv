import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_prefs.g.dart';

@riverpod
SharedPreferences sharedPrefs(SharedPrefsRef ref) {
  return throw UnimplementedError();
}

class SharedPrefencesKey {
  // Chat
  static const String chatFontSize = 'chatFontSize';
  static const String chatPosition = 'chatPosition';
  static const String chatContainerHeight = 'chatContainerHeight';
  static const String chatContainerWidth = 'chatContainerWidth';
  static const String chatContainerTransparency = 'chatContainerTransparency';
  static const String chatContainerVerticalInterval =
      'chatContainerVerticalInterval';

  // ScreenMode
  static const String screenMode = 'screenMode';

  // Settings - Chat
  static const String chatDelaySec = 'chatDelaySec';

  // Settings - Popular
  static const String popularChannelsLength = 'popularChannelsLength';

  // ID
  static const String naverId = 'naverId';

  // Category Favorites
  static const String category = 'category';
}
