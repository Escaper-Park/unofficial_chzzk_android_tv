// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toast_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$toastServiceHash() => r'e676b76d06c9801a6ce09d7e2900bcf424649058';

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
///
/// Copied from [ToastService].
@ProviderFor(ToastService)
final toastServiceProvider =
    NotifierProvider<ToastService, ToastMessage?>.internal(
  ToastService.new,
  name: r'toastServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$toastServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ToastService = Notifier<ToastMessage?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
