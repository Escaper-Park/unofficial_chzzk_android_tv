// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$settingControllerHash() => r'2954f60666028fa60e31027c9c48261fc6e41913';

/// See also [SettingController].
@ProviderFor(SettingController)
final settingControllerProvider =
    AutoDisposeNotifierProvider<SettingController, void>.internal(
  SettingController.new,
  name: r'settingControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$settingControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SettingController = AutoDisposeNotifier<void>;
String _$chatSettingControllerHash() =>
    r'bd2492518f5444142bcc2caa6d2f62f1a1c87913';

/// See also [ChatSettingController].
@ProviderFor(ChatSettingController)
final chatSettingControllerProvider =
    NotifierProvider<ChatSettingController, ChatSetting>.internal(
  ChatSettingController.new,
  name: r'chatSettingControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$chatSettingControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ChatSettingController = Notifier<ChatSetting>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
