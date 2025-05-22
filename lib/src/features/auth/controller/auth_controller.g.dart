// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authControllerHash() => r'aed82ba000f05f2d233807d18a614569e21c3528';

/// See also [AuthController].
@ProviderFor(AuthController)
final authControllerProvider =
    AsyncNotifierProvider<AuthController, Auth?>.internal(
  AuthController.new,
  name: r'authControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AuthController = AsyncNotifier<Auth?>;
String _$loginStepControllerHash() =>
    r'e842ac0bc0df812ae0c0c4e52b6fa0710425ef73';

/// See also [LoginStepController].
@ProviderFor(LoginStepController)
final loginStepControllerProvider =
    AutoDisposeNotifierProvider<LoginStepController, LoginStep>.internal(
  LoginStepController.new,
  name: r'loginStepControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$loginStepControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LoginStepController = AutoDisposeNotifier<LoginStep>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
