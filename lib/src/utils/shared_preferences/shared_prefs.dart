import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_prefs.g.dart';

@riverpod
SharedPreferences sharedPrefs(Ref ref) {
  return throw UnimplementedError();
}

abstract class SharedPrefsDBKey {
  const SharedPrefsDBKey._();

  /// chat settings
  static const String chatSettings = 'chat';

  /// stream settings
  static const String streamSettings = 'stream';

  // group
  static const String group = 'group';

  // watching history
  static const String watchingHistory = 'watching_history';
}
