import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_prefs.g.dart';

@riverpod
SharedPreferences sharedPrefs(SharedPrefsRef ref) {
  return throw UnimplementedError();
}

class SharedPrefsDBKey {
  // Chat
  static const String chatSettings = 'chat';
  // Stream
  static const String streamSettings = 'stream';
}
