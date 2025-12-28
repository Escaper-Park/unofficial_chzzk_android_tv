# 보안 개선사항

## 1. 인증 및 인가 개선

### 현재 문제점
- 쿠키 기반 인증의 보안 취약점
- 토큰 만료 처리 미흡
- 인증 상태 검증 부족

### 개선 방안

#### A. 보안 쿠키 관리
```dart
class SecureCookieManager {
  static const String _keyPrefix = 'chzzk_';
  static const String _authCookieKey = '${_keyPrefix}auth';
  
  // 쿠키 암호화를 위한 키 (실제로는 secure storage에서 관리)
  static final _encryptionKey = Hive.generateSecureKey();
  
  static Future<void> storeAuthCookies(Map<String, String> cookies) async {
    final encryptedCookies = await _encryptCookies(cookies);
    await _storage.write(key: _authCookieKey, value: encryptedCookies);
  }
  
  static Future<Map<String, String>?> getAuthCookies() async {
    final encryptedData = await _storage.read(key: _authCookieKey);
    if (encryptedData == null) return null;
    
    return await _decryptCookies(encryptedData);
  }
  
  static Future<void> clearAuthCookies() async {
    await _storage.delete(key: _authCookieKey);
  }
  
  static Future<String> _encryptCookies(Map<String, String> cookies) async {
    final jsonString = jsonEncode(cookies);
    final encrypted = await _encrypt(jsonString, _encryptionKey);
    return encrypted;
  }
  
  static Future<Map<String, String>> _decryptCookies(String encrypted) async {
    final decrypted = await _decrypt(encrypted, _encryptionKey);
    final Map<String, dynamic> decoded = jsonDecode(decrypted);
    return decoded.cast<String, String>();
  }
}
```

#### B. 토큰 검증 및 갱신
```dart
class AuthenticationService {
  static const Duration _tokenValidityPeriod = Duration(hours: 24);
  static const Duration _refreshThreshold = Duration(hours: 1);
  
  Future<bool> isTokenValid() async {
    final cookies = await SecureCookieManager.getAuthCookies();
    if (cookies == null) return false;
    
    final tokenTimestamp = await _getTokenTimestamp();
    if (tokenTimestamp == null) return false;
    
    final elapsed = DateTime.now().difference(tokenTimestamp);
    return elapsed < _tokenValidityPeriod;
  }
  
  Future<bool> shouldRefreshToken() async {
    final tokenTimestamp = await _getTokenTimestamp();
    if (tokenTimestamp == null) return false;
    
    final elapsed = DateTime.now().difference(tokenTimestamp);
    return elapsed > (_tokenValidityPeriod - _refreshThreshold);
  }
  
  Future<Result<Unit>> refreshTokenIfNeeded() async {
    if (!await shouldRefreshToken()) {
      return const Success(Unit.instance);
    }
    
    try {
      // 토큰 갱신 로직
      final newCookies = await _performTokenRefresh();
      await SecureCookieManager.storeAuthCookies(newCookies);
      await _updateTokenTimestamp();
      
      return const Success(Unit.instance);
    } catch (e) {
      return Error(AuthenticationException('토큰 갱신 실패: ${e.toString()}'));
    }
  }
}
```

## 2. 데이터 암호화

### 현재 문제점
- 민감한 사용자 데이터가 평문으로 저장
- 네트워크 통신 시 추가 암호화 부족
- 로컬 데이터베이스 암호화 미흡

### 개선 방안

#### A. 로컬 데이터 암호화
```dart
class EncryptedStorage {
  static const String _keyAlias = 'chzzk_encryption_key';
  late final FlutterSecureStorage _secureStorage;
  late final String _encryptionKey;
  
  EncryptedStorage() {
    _secureStorage = const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
    );
  }
  
  Future<void> initialize() async {
    _encryptionKey = await _getOrCreateEncryptionKey();
  }
  
  Future<String> _getOrCreateEncryptionKey() async {
    String? key = await _secureStorage.read(key: _keyAlias);
    if (key == null) {
      key = _generateSecureKey();
      await _secureStorage.write(key: _keyAlias, value: key);
    }
    return key;
  }
  
  Future<void> store(String key, dynamic value) async {
    final jsonString = jsonEncode(value);
    final encrypted = await _encrypt(jsonString);
    await _secureStorage.write(key: key, value: encrypted);
  }
  
  Future<T?> retrieve<T>(String key, T Function(Map<String, dynamic>) fromJson) async {
    final encrypted = await _secureStorage.read(key: key);
    if (encrypted == null) return null;
    
    final decrypted = await _decrypt(encrypted);
    final Map<String, dynamic> json = jsonDecode(decrypted);
    return fromJson(json);
  }
  
  Future<String> _encrypt(String plainText) async {
    // AES 암호화 구현
    final encrypter = Encrypter(AES(Key.fromBase64(_encryptionKey)));
    final iv = IV.fromSecureRandom(16);
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    
    return '${iv.base64}:${encrypted.base64}';
  }
  
  Future<String> _decrypt(String encryptedData) async {
    final parts = encryptedData.split(':');
    final iv = IV.fromBase64(parts[0]);
    final encrypted = Encrypted.fromBase64(parts[1]);
    
    final encrypter = Encrypter(AES(Key.fromBase64(_encryptionKey)));
    return encrypter.decrypt(encrypted, iv: iv);
  }
}
```

#### B. 네트워크 보안 강화
```dart
class SecureNetworkInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Certificate Pinning 검증
    if (!_isTrustedHost(options.uri.host)) {
      handler.reject(DioException(
        requestOptions: options,
        error: SecurityException('Untrusted host: ${options.uri.host}'),
      ));
      return;
    }
    
    // Request headers 보안 강화
    options.headers.addAll({
      'X-Content-Type-Options': 'nosniff',
      'X-Frame-Options': 'DENY',
      'X-XSS-Protection': '1; mode=block',
    });
    
    // API 키나 민감한 정보 로깅 방지
    _sanitizeHeaders(options.headers);
    
    super.onRequest(options, handler);
  }
  
  bool _isTrustedHost(String host) {
    const trustedHosts = [
      'api.chzzk.naver.com',
      'comm-api.game.naver.com',
      // 기타 신뢰할 수 있는 호스트들
    ];
    
    return trustedHosts.contains(host);
  }
  
  void _sanitizeHeaders(Map<String, dynamic> headers) {
    const sensitiveKeys = ['Cookie', 'Authorization', 'X-API-Key'];
    
    for (final key in sensitiveKeys) {
      if (headers.containsKey(key)) {
        headers[key] = '***REDACTED***';
      }
    }
  }
}
```

## 3. 입력 검증 및 새니테이션

### 현재 문제점
- 사용자 입력 검증 부족
- XSS 공격 가능성
- SQL Injection 대비책 부족

### 개선 방안

#### A. 입력 검증 시스템
```dart
class InputValidator {
  static const int maxUsernameLength = 50;
  static const int maxSearchQueryLength = 100;
  static final RegExp _usernamePattern = RegExp(r'^[a-zA-Z0-9가-힣_-]+$');
  static final RegExp _searchPattern = RegExp(r'^[a-zA-Z0-9가-힣\s_-]+$');
  
  static ValidationResult validateUsername(String? username) {
    if (username == null || username.isEmpty) {
      return const ValidationResult.error('사용자명을 입력해주세요');
    }
    
    if (username.length > maxUsernameLength) {
      return ValidationResult.error('사용자명은 $maxUsernameLength자를 초과할 수 없습니다');
    }
    
    if (!_usernamePattern.hasMatch(username)) {
      return const ValidationResult.error('사용자명에 허용되지 않은 문자가 포함되어 있습니다');
    }
    
    return const ValidationResult.valid();
  }
  
  static ValidationResult validateSearchQuery(String? query) {
    if (query == null || query.isEmpty) {
      return const ValidationResult.error('검색어를 입력해주세요');
    }
    
    if (query.length > maxSearchQueryLength) {
      return ValidationResult.error('검색어는 $maxSearchQueryLength자를 초과할 수 없습니다');
    }
    
    if (!_searchPattern.hasMatch(query)) {
      return const ValidationResult.error('검색어에 허용되지 않은 문자가 포함되어 있습니다');
    }
    
    return const ValidationResult.valid();
  }
  
  static String sanitizeInput(String input) {
    return input
        .replaceAll(RegExp(r'<[^>]*>'), '') // HTML 태그 제거
        .replaceAll(RegExp(r'[<>"\']'), '') // 위험한 문자 제거
        .trim();
  }
}

sealed class ValidationResult {
  const ValidationResult();
  
  const factory ValidationResult.valid() = _Valid;
  const factory ValidationResult.error(String message) = _Error;
}

class _Valid extends ValidationResult {
  const _Valid();
}

class _Error extends ValidationResult {
  final String message;
  const _Error(this.message);
}
```

#### B. 보안 텍스트 입력 위젯
```dart
class SecureTextInput extends HookWidget {
  final String? label;
  final String? hint;
  final ValidationResult Function(String?) validator;
  final Function(String) onChanged;
  final bool obscureText;
  final int? maxLength;
  
  const SecureTextInput({
    super.key,
    this.label,
    this.hint,
    required this.validator,
    required this.onChanged,
    this.obscureText = false,
    this.maxLength,
  });
  
  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    final validationResult = useState<ValidationResult?>(null);
    
    useEffect(() {
      void listener() {
        final sanitized = InputValidator.sanitizeInput(controller.text);
        if (sanitized != controller.text) {
          controller.text = sanitized;
          controller.selection = TextSelection.fromPosition(
            TextPosition(offset: sanitized.length),
          );
        }
        
        final result = validator(controller.text);
        validationResult.value = result;
        
        if (result is _Valid) {
          onChanged(controller.text);
        }
      }
      
      controller.addListener(listener);
      return () => controller.removeListener(listener);
    }, [controller]);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(label!, style: Theme.of(context).textTheme.labelMedium),
          const SizedBox(height: 8),
        ],
        
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          maxLength: maxLength,
          decoration: InputDecoration(
            hintText: hint,
            errorText: validationResult.value is _Error 
                ? (validationResult.value as _Error).message 
                : null,
            border: const OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
```

## 4. 보안 로깅 및 모니터링

### 현재 문제점
- 보안 관련 이벤트 로깅 부족
- 비정상적인 접근 시도 감지 미흡
- 민감한 정보 로그 노출 위험

### 개선 방안

#### A. 보안 이벤트 로깅
```dart
class SecurityLogger {
  static final _instance = SecurityLogger._();
  static SecurityLogger get instance => _instance;
  
  SecurityLogger._();
  
  void logAuthenticationAttempt({
    required bool success,
    required String method,
    String? failureReason,
  }) {
    final event = SecurityEvent(
      type: SecurityEventType.authentication,
      success: success,
      timestamp: DateTime.now(),
      details: {
        'method': method,
        'failure_reason': failureReason,
      },
    );
    
    _logSecurityEvent(event);
  }
  
  void logSuspiciousActivity({
    required String activity,
    required Map<String, dynamic> context,
  }) {
    final event = SecurityEvent(
      type: SecurityEventType.suspiciousActivity,
      success: false,
      timestamp: DateTime.now(),
      details: {
        'activity': activity,
        'context': context,
      },
    );
    
    _logSecurityEvent(event);
  }
  
  void logDataAccess({
    required String resource,
    required String action,
    required bool authorized,
  }) {
    final event = SecurityEvent(
      type: SecurityEventType.dataAccess,
      success: authorized,
      timestamp: DateTime.now(),
      details: {
        'resource': resource,
        'action': action,
      },
    );
    
    _logSecurityEvent(event);
  }
  
  void _logSecurityEvent(SecurityEvent event) {
    // 로컬 로그 저장
    _storeLocalSecurityLog(event);
    
    // 프로덕션 환경에서는 보안 모니터링 서비스로 전송
    if (kReleaseMode) {
      _sendToSecurityMonitoring(event);
    }
  }
  
  void _storeLocalSecurityLog(SecurityEvent event) {
    // 민감한 정보 마스킹 후 로그 저장
    final sanitizedEvent = _sanitizeEvent(event);
    logger.i('Security Event: ${sanitizedEvent.toJson()}');
  }
  
  SecurityEvent _sanitizeEvent(SecurityEvent event) {
    final sanitizedDetails = <String, dynamic>{};
    
    for (final entry in event.details.entries) {
      if (_isSensitiveField(entry.key)) {
        sanitizedDetails[entry.key] = '***MASKED***';
      } else {
        sanitizedDetails[entry.key] = entry.value;
      }
    }
    
    return event.copyWith(details: sanitizedDetails);
  }
  
  bool _isSensitiveField(String fieldName) {
    const sensitiveFields = [
      'password',
      'token',
      'cookie',
      'secret',
      'key',
      'auth',
    ];
    
    return sensitiveFields.any((field) => 
      fieldName.toLowerCase().contains(field)
    );
  }
}
```

#### B. 비정상 행동 감지
```dart
class AnomalyDetector {
  static const int maxFailedAttempts = 5;
  static const Duration lockoutDuration = Duration(minutes: 15);
  static const int maxRequestsPerMinute = 60;
  
  final Map<String, List<DateTime>> _requestHistory = {};
  final Map<String, int> _failedAttempts = {};
  final Map<String, DateTime> _lockedUntil = {};
  
  bool isLockedOut(String identifier) {
    final lockoutTime = _lockedUntil[identifier];
    if (lockoutTime == null) return false;
    
    if (DateTime.now().isAfter(lockoutTime)) {
      _lockedUntil.remove(identifier);
      _failedAttempts.remove(identifier);
      return false;
    }
    
    return true;
  }
  
  bool isRateLimited(String identifier) {
    final now = DateTime.now();
    final requests = _requestHistory[identifier] ?? [];
    
    // 1분 이내의 요청만 유지
    requests.removeWhere((time) => 
      now.difference(time) > const Duration(minutes: 1)
    );
    
    _requestHistory[identifier] = requests;
    
    if (requests.length >= maxRequestsPerMinute) {
      SecurityLogger.instance.logSuspiciousActivity(
        activity: 'Rate limit exceeded',
        context: {
          'identifier': identifier,
          'requests_count': requests.length,
        },
      );
      return true;
    }
    
    requests.add(now);
    return false;
  }
  
  void recordFailedAttempt(String identifier) {
    final attempts = _failedAttempts[identifier] ?? 0;
    _failedAttempts[identifier] = attempts + 1;
    
    if (attempts + 1 >= maxFailedAttempts) {
      _lockedUntil[identifier] = DateTime.now().add(lockoutDuration);
      
      SecurityLogger.instance.logSuspiciousActivity(
        activity: 'Account locked due to failed attempts',
        context: {
          'identifier': identifier,
          'failed_attempts': attempts + 1,
        },
      );
    }
  }
  
  void recordSuccessfulAttempt(String identifier) {
    _failedAttempts.remove(identifier);
    _lockedUntil.remove(identifier);
  }
}
```

## 5. 보안 설정 및 정책

### 개선 방안

#### A. 보안 정책 설정
```dart
class SecurityPolicy {
  static const Duration sessionTimeout = Duration(hours: 8);
  static const Duration inactivityTimeout = Duration(minutes: 30);
  static const bool requireStrongPasswords = true;
  static const bool enableBiometricAuth = true;
  static const bool logSecurityEvents = true;
  
  static const Map<String, dynamic> networkSecurityConfig = {
    'certificate_pinning': true,
    'allow_http': false,
    'require_secure_connection': true,
    'trusted_certificates_only': true,
  };
  
  static const Map<String, dynamic> dataProtectionConfig = {
    'encrypt_local_storage': true,
    'encrypt_cache': true,
    'secure_delete': true,
    'backup_encryption': true,
  };
}
```

#### B. 보안 상태 검사
```dart
class SecurityHealthChecker {
  static Future<SecurityHealthReport> performSecurityCheck() async {
    final checks = <SecurityCheck>[];
    
    // 인증 상태 검사
    checks.add(await _checkAuthenticationSecurity());
    
    // 저장소 보안 검사
    checks.add(await _checkStorageSecurity());
    
    // 네트워크 보안 검사
    checks.add(await _checkNetworkSecurity());
    
    // 앱 무결성 검사
    checks.add(await _checkAppIntegrity());
    
    return SecurityHealthReport(checks: checks);
  }
  
  static Future<SecurityCheck> _checkAuthenticationSecurity() async {
    try {
      final hasSecureCookies = await SecureCookieManager.getAuthCookies() != null;
      final isTokenValid = await AuthenticationService().isTokenValid();
      
      if (hasSecureCookies && isTokenValid) {
        return const SecurityCheck(
          name: 'Authentication Security',
          status: SecurityStatus.secure,
          message: 'Authentication is properly secured',
        );
      } else {
        return const SecurityCheck(
          name: 'Authentication Security',
          status: SecurityStatus.warning,
          message: 'Authentication may need renewal',
        );
      }
    } catch (e) {
      return SecurityCheck(
        name: 'Authentication Security',
        status: SecurityStatus.vulnerable,
        message: 'Authentication security check failed: $e',
      );
    }
  }
}
``` 