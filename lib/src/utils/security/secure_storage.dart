import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../common/exceptions/exceptions.dart';
import '../../common/result/results.dart';

/// Storage wrapper for persistent data.
///
/// Uses SharedPreferences for data persistence.
///
/// NOTE: For truly secure storage of sensitive data like auth tokens,
/// consider adding `flutter_secure_storage` package to pubspec.yaml:
/// ```yaml
/// dependencies:
///   flutter_secure_storage: ^9.0.0
/// ```
///
/// Example usage:
/// ```dart
/// final storage = AppStorage();
/// await storage.initialize();
///
/// // Store data
/// await storage.write('auth_token', 'my_token');
///
/// // Read data
/// final token = await storage.read('auth_token');
///
/// // Store objects
/// await storage.writeJson('user', user.toJson());
/// ```
class AppStorage {
  /// Singleton instance.
  static final AppStorage _instance = AppStorage._internal();

  /// Returns the singleton instance.
  factory AppStorage() => _instance;

  AppStorage._internal();

  /// The underlying SharedPreferences instance.
  SharedPreferences? _prefs;

  /// Whether the storage has been initialized.
  bool get isInitialized => _prefs != null;

  /// Initializes the storage.
  ///
  /// Must be called before any read/write operations.
  Future<void> initialize() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  /// Ensures storage is initialized before operations.
  void _ensureInitialized() {
    if (_prefs == null) {
      throw StateError(
        'AppStorage not initialized. Call initialize() first.',
      );
    }
  }

  /// Writes a string value to storage.
  ///
  /// Returns [Success] if write succeeds, [Failure] otherwise.
  Future<Result<void>> write(String key, String value) async {
    _ensureInitialized();

    try {
      await _prefs!.setString(key, value);
      return const Success(null);
    } catch (e) {
      return Failure(CacheException.writeError());
    }
  }

  /// Reads a string value from storage.
  ///
  /// Returns [Success] with the value (or null if not found),
  /// [Failure] on read error.
  Future<Result<String?>> read(String key) async {
    _ensureInitialized();

    try {
      final value = _prefs!.getString(key);
      return Success(value);
    } catch (e) {
      return Failure(CacheException.readError());
    }
  }

  /// Writes an integer value to storage.
  Future<Result<void>> writeInt(String key, int value) async {
    _ensureInitialized();

    try {
      await _prefs!.setInt(key, value);
      return const Success(null);
    } catch (e) {
      return Failure(CacheException.writeError());
    }
  }

  /// Reads an integer value from storage.
  Future<Result<int?>> readInt(String key) async {
    _ensureInitialized();

    try {
      final value = _prefs!.getInt(key);
      return Success(value);
    } catch (e) {
      return Failure(CacheException.readError());
    }
  }

  /// Writes a boolean value to storage.
  Future<Result<void>> writeBool(String key, bool value) async {
    _ensureInitialized();

    try {
      await _prefs!.setBool(key, value);
      return const Success(null);
    } catch (e) {
      return Failure(CacheException.writeError());
    }
  }

  /// Reads a boolean value from storage.
  Future<Result<bool?>> readBool(String key) async {
    _ensureInitialized();

    try {
      final value = _prefs!.getBool(key);
      return Success(value);
    } catch (e) {
      return Failure(CacheException.readError());
    }
  }

  /// Deletes a value from storage.
  ///
  /// Returns [Success] if delete succeeds, [Failure] otherwise.
  Future<Result<void>> delete(String key) async {
    _ensureInitialized();

    try {
      await _prefs!.remove(key);
      return const Success(null);
    } catch (e) {
      return Failure(
        CacheException(
          message: '데이터 삭제 중 오류가 발생했습니다.',
          originalError: e,
        ),
      );
    }
  }

  /// Deletes all values from storage.
  ///
  /// Returns [Success] if clear succeeds, [Failure] otherwise.
  Future<Result<void>> deleteAll() async {
    _ensureInitialized();

    try {
      await _prefs!.clear();
      return const Success(null);
    } catch (e) {
      return Failure(
        CacheException(
          message: '데이터 삭제 중 오류가 발생했습니다.',
          originalError: e,
        ),
      );
    }
  }

  /// Checks if a key exists in storage.
  bool containsKey(String key) {
    _ensureInitialized();
    return _prefs!.containsKey(key);
  }

  /// Writes a JSON-encodable object to storage.
  ///
  /// The object is serialized to JSON before storage.
  Future<Result<void>> writeJson(
    String key,
    Map<String, dynamic> value,
  ) async {
    try {
      final jsonString = jsonEncode(value);
      return write(key, jsonString);
    } catch (e) {
      return Failure(
        CacheException(
          message: 'JSON 인코딩 중 오류가 발생했습니다.',
          originalError: e,
        ),
      );
    }
  }

  /// Reads a JSON object from storage.
  ///
  /// Returns the deserialized Map, or null if not found.
  Future<Result<Map<String, dynamic>?>> readJson(String key) async {
    final result = await read(key);

    return result.flatMap((value) {
      if (value == null) {
        return const Success(null);
      }

      try {
        final Map<String, dynamic> decoded = jsonDecode(value);
        return Success(decoded);
      } catch (e) {
        return Failure(
          CacheException(
            message: 'JSON 디코딩 중 오류가 발생했습니다.',
            originalError: e,
          ),
        );
      }
    });
  }

  /// Writes a typed object to storage using a serializer.
  ///
  /// Example:
  /// ```dart
  /// await storage.writeObject(
  ///   'user',
  ///   user,
  ///   (u) => u.toJson(),
  /// );
  /// ```
  Future<Result<void>> writeObject<T>(
    String key,
    T value,
    Map<String, dynamic> Function(T) toJson,
  ) async {
    try {
      final json = toJson(value);
      return writeJson(key, json);
    } catch (e) {
      return Failure(
        CacheException(
          message: '객체 직렬화 중 오류가 발생했습니다.',
          originalError: e,
        ),
      );
    }
  }

  /// Reads a typed object from storage using a deserializer.
  ///
  /// Example:
  /// ```dart
  /// final user = await storage.readObject(
  ///   'user',
  ///   User.fromJson,
  /// );
  /// ```
  Future<Result<T?>> readObject<T>(
    String key,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    final result = await readJson(key);

    return result.flatMap((json) {
      if (json == null) {
        return const Success(null);
      }

      try {
        return Success(fromJson(json));
      } catch (e) {
        return Failure(
          CacheException(
            message: '객체 역직렬화 중 오류가 발생했습니다.',
            originalError: e,
          ),
        );
      }
    });
  }
}

/// Storage keys used throughout the application.
///
/// Centralizes all storage key definitions to prevent typos and
/// make key management easier.
abstract class StorageKeys {
  StorageKeys._();

  /// Authentication cookie storage key.
  static const String authCookies = 'chzzk_auth_cookies';

  /// User ID hash storage key.
  static const String userIdHash = 'chzzk_user_id_hash';

  /// Last login timestamp.
  static const String lastLoginTimestamp = 'chzzk_last_login';

  /// App settings storage key.
  static const String appSettings = 'chzzk_app_settings';

  /// Chat settings storage key.
  static const String chatSettings = 'chzzk_chat_settings';

  /// Video player settings storage key.
  static const String playerSettings = 'chzzk_player_settings';

  /// Whether user has completed onboarding.
  static const String onboardingCompleted = 'chzzk_onboarding_completed';

  /// Last viewed channel.
  static const String lastViewedChannel = 'chzzk_last_viewed_channel';
}
