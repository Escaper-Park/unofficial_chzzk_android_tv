part of 'shared_preferences_group_repository.dart';

extension _SharedPreferencesGroupRepositoryStorage
    on SharedPreferencesGroupRepository {
  Future<GroupCollection> _readNow() async {
    final rawValue = preferences.getString(GroupStorageKeys.groups);
    if (rawValue == null || rawValue.isEmpty) {
      return defaultGroupCollection;
    }

    try {
      final decoded = jsonDecode(rawValue);
      if (decoded is! Map) {
        return defaultGroupCollection;
      }

      return _normalizedCollection(_decodeCollection(_jsonObject(decoded)));
    } on Object {
      return defaultGroupCollection;
    }
  }

  Future<void> _writeNow(GroupCollection collection) async {
    final normalized = _normalizedCollection(collection);
    final didSave = await preferences.setString(
      GroupStorageKeys.groups,
      jsonEncode(normalized.toJson()),
    );
    if (!didSave) {
      throw StateError('Failed to save group collection.');
    }
  }

  Future<T> _runExclusive<T>(Future<T> Function() operation) async {
    final previousOperation = _operationQueue;
    final operationCompleter = Completer<void>();
    _operationQueue = operationCompleter.future;

    await previousOperation;
    try {
      return await operation();
    } finally {
      operationCompleter.complete();
    }
  }
}
