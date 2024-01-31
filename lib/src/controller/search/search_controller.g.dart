// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentSearchControllerHash() =>
    r'f11a6dc3d24a036bc2f8b2a967e13a78cf0a7df8';

/// See also [CurrentSearchController].
@ProviderFor(CurrentSearchController)
final currentSearchControllerProvider =
    AutoDisposeNotifierProvider<CurrentSearchController, Channel?>.internal(
  CurrentSearchController.new,
  name: r'currentSearchControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentSearchControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentSearchController = AutoDisposeNotifier<Channel?>;
String _$searchResultsControllerHash() =>
    r'17b6d62634700b141db0784ed07b9d4ab7be07f6';

/// See also [SearchResultsController].
@ProviderFor(SearchResultsController)
final searchResultsControllerProvider = AutoDisposeAsyncNotifierProvider<
    SearchResultsController, List<Channel>?>.internal(
  SearchResultsController.new,
  name: r'searchResultsControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$searchResultsControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchResultsController = AutoDisposeAsyncNotifier<List<Channel>?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
