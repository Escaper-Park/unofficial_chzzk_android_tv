// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$groupDetailControllerHash() =>
    r'dd1e0be5a4f77e04c7c48aa13fdd1bb2bf238e24';

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

abstract class _$GroupDetailController
    extends BuildlessAutoDisposeAsyncNotifier<List<Channel>?> {
  late final Group group;

  FutureOr<List<Channel>?> build({
    required Group group,
  });
}

/// See also [GroupDetailController].
@ProviderFor(GroupDetailController)
const groupDetailControllerProvider = GroupDetailControllerFamily();

/// See also [GroupDetailController].
class GroupDetailControllerFamily extends Family<AsyncValue<List<Channel>?>> {
  /// See also [GroupDetailController].
  const GroupDetailControllerFamily();

  /// See also [GroupDetailController].
  GroupDetailControllerProvider call({
    required Group group,
  }) {
    return GroupDetailControllerProvider(
      group: group,
    );
  }

  @override
  GroupDetailControllerProvider getProviderOverride(
    covariant GroupDetailControllerProvider provider,
  ) {
    return call(
      group: provider.group,
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
  String? get name => r'groupDetailControllerProvider';
}

/// See also [GroupDetailController].
class GroupDetailControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<GroupDetailController,
        List<Channel>?> {
  /// See also [GroupDetailController].
  GroupDetailControllerProvider({
    required Group group,
  }) : this._internal(
          () => GroupDetailController()..group = group,
          from: groupDetailControllerProvider,
          name: r'groupDetailControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$groupDetailControllerHash,
          dependencies: GroupDetailControllerFamily._dependencies,
          allTransitiveDependencies:
              GroupDetailControllerFamily._allTransitiveDependencies,
          group: group,
        );

  GroupDetailControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.group,
  }) : super.internal();

  final Group group;

  @override
  FutureOr<List<Channel>?> runNotifierBuild(
    covariant GroupDetailController notifier,
  ) {
    return notifier.build(
      group: group,
    );
  }

  @override
  Override overrideWith(GroupDetailController Function() create) {
    return ProviderOverride(
      origin: this,
      override: GroupDetailControllerProvider._internal(
        () => create()..group = group,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        group: group,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<GroupDetailController, List<Channel>?>
      createElement() {
    return _GroupDetailControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GroupDetailControllerProvider && other.group == group;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, group.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GroupDetailControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<Channel>?> {
  /// The parameter `group` of this provider.
  Group get group;
}

class _GroupDetailControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<GroupDetailController,
        List<Channel>?> with GroupDetailControllerRef {
  _GroupDetailControllerProviderElement(super.provider);

  @override
  Group get group => (origin as GroupDetailControllerProvider).group;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
