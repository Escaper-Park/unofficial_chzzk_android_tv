import 'dart:async';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'toast_service.g.dart';

/// Toast message types for different feedback scenarios.
enum ToastType {
  success,
  error,
  info,
}

/// Toast message data.
@immutable
class ToastMessage {
  const ToastMessage({
    required this.message,
    required this.type,
    this.duration = const Duration(seconds: 2),
  });

  final String message;
  final ToastType type;
  final Duration duration;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ToastMessage &&
          runtimeType == other.runtimeType &&
          message == other.message &&
          type == other.type;

  @override
  int get hashCode => message.hashCode ^ type.hashCode;
}

/// Service for displaying toast notifications.
///
/// This service manages a queue of toast messages and provides methods
/// for showing success, error, and info toasts.
///
/// Usage:
/// ```dart
/// ref.read(toastServiceProvider.notifier).showSuccess('팔로우했습니다');
/// ref.read(toastServiceProvider.notifier).showError('오류가 발생했습니다');
/// ```
@Riverpod(keepAlive: true)
class ToastService extends _$ToastService {
  Timer? _hideTimer;

  @override
  ToastMessage? build() {
    ref.onDispose(() {
      _hideTimer?.cancel();
    });
    return null;
  }

  /// Shows a success toast with the given message.
  void showSuccess(String message) {
    _showToast(
      ToastMessage(
        message: message,
        type: ToastType.success,
      ),
    );
  }

  /// Shows an error toast with the given message.
  void showError(String message) {
    _showToast(
      ToastMessage(
        message: message,
        type: ToastType.error,
      ),
    );
  }

  /// Shows an info toast with the given message.
  void showInfo(String message) {
    _showToast(
      ToastMessage(
        message: message,
        type: ToastType.info,
      ),
    );
  }

  /// Shows a toast with custom configuration.
  void _showToast(ToastMessage toast) {
    _hideTimer?.cancel();
    state = toast;

    _hideTimer = Timer(toast.duration, () {
      state = null;
    });
  }

  /// Hides the current toast immediately.
  void hide() {
    _hideTimer?.cancel();
    state = null;
  }
}
