import 'package:flutter/material.dart';

import '../../constants/styles.dart';
import '../../exceptions/exceptions.dart';
import '../../result/results.dart';

/// A reusable error display widget that shows user-friendly error messages
/// with an optional retry button.
///
/// This widget adapts its appearance based on the type of exception,
/// showing appropriate icons and messages for different error scenarios.
///
/// Example usage:
/// ```dart
/// AppErrorWidget(
///   exception: networkException,
///   onRetry: () => ref.invalidate(someProvider),
/// )
/// ```
class AppErrorWidget extends StatelessWidget {
  /// The exception to display.
  final AppException exception;

  /// Optional callback when the retry button is pressed.
  /// If null, no retry button is shown.
  final VoidCallback? onRetry;

  /// Optional custom message to display instead of the exception's message.
  final String? customMessage;

  /// Whether to show a compact version suitable for inline display.
  final bool compact;

  const AppErrorWidget({
    super.key,
    required this.exception,
    this.onRetry,
    this.customMessage,
    this.compact = false,
  });

  /// Creates an error widget from a [Result.Failure].
  factory AppErrorWidget.fromResult(
    Failure failure, {
    VoidCallback? onRetry,
    String? customMessage,
    bool compact = false,
  }) {
    return AppErrorWidget(
      exception: failure.exception,
      onRetry: onRetry,
      customMessage: customMessage,
      compact: compact,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (compact) {
      return _buildCompact(context);
    }
    return _buildFull(context);
  }

  Widget _buildFull(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildIcon(),
            const SizedBox(height: 16),
            _buildTitle(context),
            const SizedBox(height: 8),
            _buildMessage(context),
            if (onRetry != null) ...[
              const SizedBox(height: 24),
              _buildRetryButton(context),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildCompact(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          _getIcon(),
          size: 20,
          color: _getIconColor(),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            customMessage ?? exception.message,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.greyColor,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (onRetry != null) ...[
          const SizedBox(width: 8),
          IconButton(
            onPressed: onRetry,
            icon: const Icon(Icons.refresh, size: 20),
            tooltip: '다시 시도',
            color: AppColors.chzzkColor,
          ),
        ],
      ],
    );
  }

  Widget _buildIcon() {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: _getIconBackgroundColor(),
        shape: BoxShape.circle,
      ),
      child: Icon(
        _getIcon(),
        size: 40,
        color: _getIconColor(),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      _getTitle(),
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.whiteColor,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildMessage(BuildContext context) {
    return Text(
      customMessage ?? exception.message,
      style: TextStyle(
        fontSize: 14,
        color: AppColors.greyColor,
      ),
      textAlign: TextAlign.center,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildRetryButton(BuildContext context) {
    final isRetryable = _isRetryable();

    return ElevatedButton.icon(
      onPressed: onRetry,
      icon: Icon(
        isRetryable ? Icons.refresh : Icons.arrow_back,
        size: 18,
      ),
      label: Text(isRetryable ? '다시 시도' : '돌아가기'),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.chzzkColor,
        foregroundColor: AppColors.blackColor,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  IconData _getIcon() {
    return switch (exception) {
      NetworkException(type: NetworkExceptionType.noConnection) =>
        Icons.wifi_off,
      NetworkException(type: NetworkExceptionType.timeout) =>
        Icons.hourglass_empty,
      NetworkException(type: NetworkExceptionType.security) => Icons.security,
      NetworkException(type: NetworkExceptionType.serverError) =>
        Icons.cloud_off,
      NetworkException() => Icons.error_outline,
      AuthException(type: AuthExceptionType.sessionExpired) => Icons.lock_clock,
      AuthException(type: AuthExceptionType.loginRequired) => Icons.login,
      AuthException() => Icons.lock_outline,
      StreamingException(type: StreamingExceptionType.liveEnded) =>
        Icons.videocam_off,
      StreamingException(type: StreamingExceptionType.ageRestricted) =>
        Icons.no_adult_content,
      StreamingException(type: StreamingExceptionType.regionRestricted) =>
        Icons.location_off,
      StreamingException() => Icons.play_disabled,
      CacheException() => Icons.storage,
      _ => Icons.error_outline,
    };
  }

  Color _getIconColor() {
    return switch (exception) {
      NetworkException(type: NetworkExceptionType.noConnection) =>
        AppColors.greyColor,
      NetworkException() => AppColors.lightRedColor,
      AuthException() => Colors.orange,
      StreamingException() => AppColors.greyColor,
      _ => AppColors.lightRedColor,
    };
  }

  Color _getIconBackgroundColor() {
    final color = _getIconColor();
    return color.withOpacity(0.15);
  }

  String _getTitle() {
    return switch (exception) {
      NetworkException(type: NetworkExceptionType.noConnection) => '연결 끊김',
      NetworkException(type: NetworkExceptionType.timeout) => '연결 시간 초과',
      NetworkException(type: NetworkExceptionType.serverError) => '서버 오류',
      NetworkException() => '네트워크 오류',
      AuthException(type: AuthExceptionType.sessionExpired) => '세션 만료',
      AuthException(type: AuthExceptionType.loginRequired) => '로그인 필요',
      AuthException() => '인증 오류',
      StreamingException(type: StreamingExceptionType.liveEnded) => '방송 종료',
      StreamingException(type: StreamingExceptionType.ageRestricted) => '연령 제한',
      StreamingException(type: StreamingExceptionType.regionRestricted) =>
        '지역 제한',
      StreamingException() => '재생 오류',
      CacheException() => '저장소 오류',
      _ => '오류 발생',
    };
  }

  bool _isRetryable() {
    if (exception is NetworkException) {
      return (exception as NetworkException).isRetryable;
    }
    return exception is! AuthException;
  }
}

/// Extension to easily create error widgets from Result types.
extension ResultErrorWidgetExtension<T> on Result<T> {
  /// Creates an [AppErrorWidget] if this is a [Failure], otherwise returns null.
  Widget? errorWidgetOrNull({
    VoidCallback? onRetry,
    String? customMessage,
    bool compact = false,
  }) {
    return whenOrNull(
      failure: (exception) => AppErrorWidget(
        exception: exception,
        onRetry: onRetry,
        customMessage: customMessage,
        compact: compact,
      ),
    );
  }
}
