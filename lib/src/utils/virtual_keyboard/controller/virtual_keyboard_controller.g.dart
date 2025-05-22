// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'virtual_keyboard_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$virtualKeyboardControllerHash() =>
    r'f7c68693d4eafe3d6a465cbb4333b9149515e9e7';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$VirtualKeyboardController
    extends BuildlessAutoDisposeNotifier<String> {
  late final String routeName;

  String build({
    required String routeName,
  });
}

/// See also [VirtualKeyboardController].
@ProviderFor(VirtualKeyboardController)
const virtualKeyboardControllerProvider = VirtualKeyboardControllerFamily();

/// See also [VirtualKeyboardController].
class VirtualKeyboardControllerFamily extends Family<String> {
  /// See also [VirtualKeyboardController].
  const VirtualKeyboardControllerFamily();

  /// See also [VirtualKeyboardController].
  VirtualKeyboardControllerProvider call({
    required String routeName,
  }) {
    return VirtualKeyboardControllerProvider(
      routeName: routeName,
    );
  }

  @override
  VirtualKeyboardControllerProvider getProviderOverride(
    covariant VirtualKeyboardControllerProvider provider,
  ) {
    return call(
      routeName: provider.routeName,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'virtualKeyboardControllerProvider';
}

/// See also [VirtualKeyboardController].
class VirtualKeyboardControllerProvider
    extends AutoDisposeNotifierProviderImpl<VirtualKeyboardController, String> {
  /// See also [VirtualKeyboardController].
  VirtualKeyboardControllerProvider({
    required String routeName,
  }) : this._internal(
          () => VirtualKeyboardController()..routeName = routeName,
          from: virtualKeyboardControllerProvider,
          name: r'virtualKeyboardControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$virtualKeyboardControllerHash,
          dependencies: VirtualKeyboardControllerFamily._dependencies,
          allTransitiveDependencies:
              VirtualKeyboardControllerFamily._allTransitiveDependencies,
          routeName: routeName,
        );

  VirtualKeyboardControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.routeName,
  }) : super.internal();

  final String routeName;

  @override
  String runNotifierBuild(
    covariant VirtualKeyboardController notifier,
  ) {
    return notifier.build(
      routeName: routeName,
    );
  }

  @override
  Override overrideWith(VirtualKeyboardController Function() create) {
    return ProviderOverride(
      origin: this,
      override: VirtualKeyboardControllerProvider._internal(
        () => create()..routeName = routeName,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        routeName: routeName,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<VirtualKeyboardController, String>
      createElement() {
    return _VirtualKeyboardControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VirtualKeyboardControllerProvider &&
        other.routeName == routeName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, routeName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin VirtualKeyboardControllerRef on AutoDisposeNotifierProviderRef<String> {
  /// The parameter `routeName` of this provider.
  String get routeName;
}

class _VirtualKeyboardControllerProviderElement
    extends AutoDisposeNotifierProviderElement<VirtualKeyboardController,
        String> with VirtualKeyboardControllerRef {
  _VirtualKeyboardControllerProviderElement(super.provider);

  @override
  String get routeName =>
      (origin as VirtualKeyboardControllerProvider).routeName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
