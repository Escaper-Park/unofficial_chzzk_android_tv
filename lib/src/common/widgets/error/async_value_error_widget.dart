import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constants/styles.dart';
import '../../result/result.dart' show AppException;
import 'app_error_widget.dart';

/// A widget that displays error states from [AsyncValue] with proper styling.
///
/// This widget bridges the gap between simple error text display and the
/// full-featured [AppErrorWidget]. It automatically detects if the error
/// is an [AppException] and uses [AppErrorWidget] for rich error display,
/// otherwise falls back to a simple text display.
///
/// Example usage:
/// ```dart
/// asyncValue.when(
///   data: (data) => DataWidget(data),
///   error: (error, stack) => AsyncValueErrorWidget(
///     error: error,
///     fallbackMessage: '데이터를 불러올 수 없습니다',
///     onRetry: () => ref.invalidate(provider),
///   ),
///   loading: () => LoadingWidget(),
/// )
/// ```
class AsyncValueErrorWidget extends StatelessWidget {
  /// The error object from [AsyncValue.error].
  final Object error;

  /// The stack trace from [AsyncValue.error].
  final StackTrace? stackTrace;

  /// Fallback message to display if error is not an [AppException].
  final String fallbackMessage;

  /// Optional callback when retry button is pressed.
  final VoidCallback? onRetry;

  /// Whether to use compact display mode.
  final bool compact;

  const AsyncValueErrorWidget({
    super.key,
    required this.error,
    this.stackTrace,
    required this.fallbackMessage,
    this.onRetry,
    this.compact = false,
  });

  /// Creates an error widget from an [AsyncValue] if it's in error state.
  ///
  /// Returns null if the [AsyncValue] is not an error.
  static Widget? fromAsyncValue<T>(
    AsyncValue<T> asyncValue, {
    required String fallbackMessage,
    VoidCallback? onRetry,
    bool compact = false,
  }) {
    return asyncValue.whenOrNull(
      error: (error, stack) => AsyncValueErrorWidget(
        error: error,
        stackTrace: stack,
        fallbackMessage: fallbackMessage,
        onRetry: onRetry,
        compact: compact,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // If error is AppException, use full-featured AppErrorWidget
    if (error is AppException) {
      return AppErrorWidget(
        exception: error as AppException,
        onRetry: onRetry,
        compact: compact,
      );
    }

    // Fallback to simple error display for non-AppException errors
    if (compact) {
      return _buildCompactFallback();
    }
    return _buildFullFallback();
  }

  Widget _buildFullFallback() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.lightRedColor.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.error_outline,
                size: 40,
                color: AppColors.lightRedColor,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '오류 발생',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.whiteColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              fallbackMessage,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.greyColor,
              ),
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh, size: 18),
                label: const Text('다시 시도'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.chzzkColor,
                  foregroundColor: AppColors.blackColor,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildCompactFallback() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.error_outline,
          size: 20,
          color: AppColors.lightRedColor,
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            fallbackMessage,
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
}

/// Extension to easily create error widgets from AsyncValue types.
extension AsyncValueErrorExtension<T> on AsyncValue<T> {
  /// Creates an [AsyncValueErrorWidget] if this is an error state.
  ///
  /// Returns null if this is not an error state.
  Widget? errorWidgetOrNull({
    required String fallbackMessage,
    VoidCallback? onRetry,
    bool compact = false,
  }) {
    return AsyncValueErrorWidget.fromAsyncValue(
      this,
      fallbackMessage: fallbackMessage,
      onRetry: onRetry,
      compact: compact,
    );
  }

  /// Returns the error widget if error state, otherwise returns the
  /// result of [orElse].
  Widget errorWidgetOr({
    required String fallbackMessage,
    VoidCallback? onRetry,
    bool compact = false,
    required Widget Function() orElse,
  }) {
    return errorWidgetOrNull(
          fallbackMessage: fallbackMessage,
          onRetry: onRetry,
          compact: compact,
        ) ??
        orElse();
  }
}
