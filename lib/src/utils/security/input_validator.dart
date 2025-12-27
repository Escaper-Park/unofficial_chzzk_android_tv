/// Input validation utilities for secure user input handling.
///
/// Provides validation and sanitization functions to prevent
/// injection attacks and ensure data integrity.
library;

/// Result of a validation check.
sealed class ValidationResult {
  const ValidationResult();

  /// Creates a valid result.
  const factory ValidationResult.valid() = ValidationValid;

  /// Creates an invalid result with an error message.
  const factory ValidationResult.invalid(String message) = ValidationInvalid;

  /// Whether the validation passed.
  bool get isValid;

  /// The error message if validation failed, null otherwise.
  String? get errorMessage;
}

/// Represents a successful validation.
final class ValidationValid extends ValidationResult {
  const ValidationValid();

  @override
  bool get isValid => true;

  @override
  String? get errorMessage => null;
}

/// Represents a failed validation with an error message.
final class ValidationInvalid extends ValidationResult {
  /// The error message describing why validation failed.
  final String message;

  const ValidationInvalid(this.message);

  @override
  bool get isValid => false;

  @override
  String get errorMessage => message;
}

/// Utility class for validating and sanitizing user input.
abstract class InputValidator {
  InputValidator._();

  /// Maximum allowed length for usernames.
  static const int maxUsernameLength = 50;

  /// Maximum allowed length for search queries.
  static const int maxSearchQueryLength = 100;

  /// Maximum allowed length for chat messages.
  static const int maxChatMessageLength = 500;

  /// Pattern for valid usernames (alphanumeric, Korean, underscores, hyphens).
  static final RegExp _usernamePattern = RegExp(r'^[a-zA-Z0-9가-힣_\-]+$');

  /// Pattern for valid search queries.
  static final RegExp _searchPattern = RegExp(r'^[a-zA-Z0-9가-힣\s_\-@#]+$');

  /// Pattern for detecting potentially dangerous characters.
  static final RegExp _dangerousPattern = RegExp(r'[<>"\x27\\;]');

  /// Pattern for detecting script tags.
  static final RegExp _scriptPattern = RegExp(
    r'<script[^>]*>.*?</script>',
    caseSensitive: false,
    dotAll: true,
  );

  /// Pattern for HTML tags.
  static final RegExp _htmlTagPattern = RegExp(r'<[^>]*>');

  /// Validates a username.
  ///
  /// - Must not be empty
  /// - Must not exceed [maxUsernameLength] characters
  /// - Must only contain allowed characters
  static ValidationResult validateUsername(String? username) {
    if (username == null || username.isEmpty) {
      return const ValidationInvalid('사용자명을 입력해주세요.');
    }

    if (username.length > maxUsernameLength) {
      return ValidationInvalid(
        '사용자명은 $maxUsernameLength자를 초과할 수 없습니다.',
      );
    }

    if (!_usernamePattern.hasMatch(username)) {
      return const ValidationInvalid(
        '사용자명에 허용되지 않은 문자가 포함되어 있습니다.',
      );
    }

    return const ValidationValid();
  }

  /// Validates a search query.
  ///
  /// - Must not be empty
  /// - Must not exceed [maxSearchQueryLength] characters
  /// - Must only contain allowed characters
  static ValidationResult validateSearchQuery(String? query) {
    if (query == null || query.trim().isEmpty) {
      return const ValidationInvalid('검색어를 입력해주세요.');
    }

    final trimmed = query.trim();

    if (trimmed.length > maxSearchQueryLength) {
      return ValidationInvalid(
        '검색어는 $maxSearchQueryLength자를 초과할 수 없습니다.',
      );
    }

    if (!_searchPattern.hasMatch(trimmed)) {
      return const ValidationInvalid(
        '검색어에 허용되지 않은 문자가 포함되어 있습니다.',
      );
    }

    return const ValidationValid();
  }

  /// Validates a chat message.
  ///
  /// - Must not be empty
  /// - Must not exceed [maxChatMessageLength] characters
  /// - Must not contain potentially dangerous content
  static ValidationResult validateChatMessage(String? message) {
    if (message == null || message.trim().isEmpty) {
      return const ValidationInvalid('메시지를 입력해주세요.');
    }

    if (message.length > maxChatMessageLength) {
      return ValidationInvalid(
        '메시지는 $maxChatMessageLength자를 초과할 수 없습니다.',
      );
    }

    // Check for script injection attempts
    if (_scriptPattern.hasMatch(message)) {
      return const ValidationInvalid('허용되지 않은 내용이 포함되어 있습니다.');
    }

    return const ValidationValid();
  }

  /// Validates a URL.
  ///
  /// - Must be a valid URL format
  /// - Must use HTTPS scheme (optional)
  static ValidationResult validateUrl(
    String? url, {
    bool requireHttps = false,
  }) {
    if (url == null || url.trim().isEmpty) {
      return const ValidationInvalid('URL을 입력해주세요.');
    }

    final uri = Uri.tryParse(url);
    if (uri == null || !uri.hasScheme || !uri.hasAuthority) {
      return const ValidationInvalid('유효하지 않은 URL 형식입니다.');
    }

    if (requireHttps && uri.scheme != 'https') {
      return const ValidationInvalid('보안 연결(HTTPS)이 필요합니다.');
    }

    return const ValidationValid();
  }

  /// Sanitizes user input by removing potentially dangerous characters.
  ///
  /// - Removes HTML tags
  /// - Removes script content
  /// - Escapes dangerous characters
  /// - Trims whitespace
  static String sanitize(String input) {
    String sanitized = input;

    // Remove script tags and their content
    sanitized = sanitized.replaceAll(_scriptPattern, '');

    // Remove HTML tags
    sanitized = sanitized.replaceAll(_htmlTagPattern, '');

    // Remove dangerous characters
    sanitized = sanitized.replaceAll(_dangerousPattern, '');

    // Trim and normalize whitespace
    sanitized = sanitized.trim();
    sanitized = sanitized.replaceAll(RegExp(r'\s+'), ' ');

    return sanitized;
  }

  /// Sanitizes input for safe use in searches.
  ///
  /// Less aggressive than [sanitize], preserving more characters
  /// while still preventing injection attacks.
  static String sanitizeForSearch(String input) {
    String sanitized = input.trim();

    // Remove script tags
    sanitized = sanitized.replaceAll(_scriptPattern, '');

    // Remove HTML tags
    sanitized = sanitized.replaceAll(_htmlTagPattern, '');

    // Normalize whitespace
    sanitized = sanitized.replaceAll(RegExp(r'\s+'), ' ');

    return sanitized;
  }

  /// Checks if a string contains potentially dangerous content.
  static bool containsDangerousContent(String input) {
    return _dangerousPattern.hasMatch(input) ||
        _scriptPattern.hasMatch(input) ||
        _htmlTagPattern.hasMatch(input);
  }

  /// Truncates a string to the specified maximum length.
  ///
  /// If [addEllipsis] is true and the string is truncated,
  /// an ellipsis (…) is appended.
  static String truncate(
    String input,
    int maxLength, {
    bool addEllipsis = true,
  }) {
    if (input.length <= maxLength) {
      return input;
    }

    if (addEllipsis && maxLength > 1) {
      return '${input.substring(0, maxLength - 1)}…';
    }

    return input.substring(0, maxLength);
  }
}

/// Extension methods for convenient validation on strings.
extension StringValidationExtension on String {
  /// Validates this string as a username.
  ValidationResult validateAsUsername() {
    return InputValidator.validateUsername(this);
  }

  /// Validates this string as a search query.
  ValidationResult validateAsSearchQuery() {
    return InputValidator.validateSearchQuery(this);
  }

  /// Sanitizes this string.
  String sanitized() {
    return InputValidator.sanitize(this);
  }

  /// Sanitizes this string for search use.
  String sanitizedForSearch() {
    return InputValidator.sanitizeForSearch(this);
  }

  /// Truncates this string to the specified length.
  String truncated(int maxLength, {bool addEllipsis = true}) {
    return InputValidator.truncate(this, maxLength, addEllipsis: addEllipsis);
  }
}
