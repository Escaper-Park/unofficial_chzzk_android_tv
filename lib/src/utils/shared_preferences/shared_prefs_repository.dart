import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// T: ChatSettings, StreamSettings, Group
abstract class SharedPrefsRepository<T> {
  final SharedPreferences prefs;
  final String dbKey;

  SharedPrefsRepository({
    required this.prefs,
    required this.dbKey,
  });

  /// Make own initial settings.
  T initValue();

  T getValues() {
    final settingsJson = prefs.getString(dbKey);

    if (settingsJson == null) return _addInitialValue();

    try {
      return fromJson(json.decode(settingsJson));
    } catch (_) {
      return _addInitialValue();
    }
  }

  Future<void> updateValue(T values) async {
    await prefs.setString(
      dbKey,
      json.encode(toJson(values)),
    );
  }

  T _addInitialValue() {
    final T item = initValue();

    prefs.setString(
      dbKey,
      json.encode(toJson(item)),
    );

    return item;
  }

  T fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson(T item);
}
