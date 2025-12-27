import 'dart:async';

/// A utility class that prevents duplicate concurrent API requests.
///
/// When multiple parts of the app request the same data simultaneously,
/// this class ensures only one actual API call is made, and all callers
/// receive the same result.
///
/// Example usage:
/// ```dart
/// final data = await RequestDeduplicator.deduplicate(
///   'user_profile_$userId',
///   () => api.getUserProfile(userId),
/// );
/// ```
class RequestDeduplicator {
  /// Map of active requests keyed by their identifier.
  static final Map<String, Future<dynamic>> _activeRequests = {};

  /// Deduplicates concurrent requests with the same key.
  ///
  /// If a request with the same [key] is already in progress, returns
  /// the existing Future. Otherwise, executes [request] and caches
  /// the Future until completion.
  ///
  /// - [key]: Unique identifier for this request (e.g., 'user_123' or 'live_list_popular').
  /// - [request]: The actual API call to execute.
  /// - Returns: The result of the API call.
  static Future<T> deduplicate<T>(
    String key,
    Future<T> Function() request,
  ) async {
    // Check if there's already an active request for this key
    if (_activeRequests.containsKey(key)) {
      return await _activeRequests[key] as T;
    }

    // Create and store the new request
    final future = request();
    _activeRequests[key] = future;

    try {
      final result = await future;
      return result;
    } finally {
      // Always remove the request when done (success or failure)
      _activeRequests.remove(key);
    }
  }

  /// Deduplicates requests with automatic expiration.
  ///
  /// Similar to [deduplicate], but the cached result expires after [expiration].
  /// This is useful for data that changes infrequently.
  ///
  /// - [key]: Unique identifier for this request.
  /// - [request]: The actual API call to execute.
  /// - [expiration]: How long to cache the result (default: 5 seconds).
  static Future<T> deduplicateWithExpiry<T>(
    String key,
    Future<T> Function() request, {
    Duration expiration = const Duration(seconds: 5),
  }) async {
    final cacheKey = '${key}_timed';

    if (_activeRequests.containsKey(cacheKey)) {
      return await _activeRequests[cacheKey] as T;
    }

    final completer = Completer<T>();
    _activeRequests[cacheKey] = completer.future;

    try {
      final result = await request();
      completer.complete(result);

      // Schedule removal after expiration
      Future.delayed(expiration, () {
        _activeRequests.remove(cacheKey);
      });

      return result;
    } catch (e) {
      _activeRequests.remove(cacheKey);
      completer.completeError(e);
      rethrow;
    }
  }

  /// Cancels an active request if it exists.
  ///
  /// Note: This doesn't actually cancel the underlying HTTP request,
  /// but it removes the cached Future so new callers will start a fresh request.
  static void cancel(String key) {
    _activeRequests.remove(key);
  }

  /// Cancels all active requests.
  ///
  /// Useful for cleanup during logout or app reset.
  static void cancelAll() {
    _activeRequests.clear();
  }

  /// Checks if a request with the given key is currently active.
  static bool isActive(String key) {
    return _activeRequests.containsKey(key);
  }

  /// Returns the number of currently active requests.
  static int get activeCount => _activeRequests.length;
}

/// A request deduplicator scoped to a specific feature or domain.
///
/// Useful when you want to manage a subset of requests independently.
///
/// Example usage:
/// ```dart
/// class UserRepository {
///   final _deduplicator = ScopedRequestDeduplicator('user');
///
///   Future<User> getUser(String id) {
///     return _deduplicator.deduplicate(
///       id,
///       () => api.getUser(id),
///     );
///   }
/// }
/// ```
class ScopedRequestDeduplicator {
  /// The scope prefix for all keys managed by this instance.
  final String scope;

  /// Active requests for this scope.
  final Map<String, Future<dynamic>> _requests = {};

  ScopedRequestDeduplicator(this.scope);

  /// Deduplicates concurrent requests with the same key within this scope.
  Future<T> deduplicate<T>(
    String key,
    Future<T> Function() request,
  ) async {
    final scopedKey = '${scope}_$key';

    if (_requests.containsKey(scopedKey)) {
      return await _requests[scopedKey] as T;
    }

    final future = request();
    _requests[scopedKey] = future;

    try {
      final result = await future;
      return result;
    } finally {
      _requests.remove(scopedKey);
    }
  }

  /// Cancels all active requests in this scope.
  void cancelAll() {
    _requests.clear();
  }

  /// Checks if a request with the given key is currently active in this scope.
  bool isActive(String key) {
    return _requests.containsKey('${scope}_$key');
  }

  /// Returns the number of currently active requests in this scope.
  int get activeCount => _requests.length;
}
