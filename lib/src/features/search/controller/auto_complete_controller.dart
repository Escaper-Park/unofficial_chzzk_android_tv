import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repository/search_repository_wrapper.dart';

part 'auto_complete_controller.g.dart';

@riverpod
class AutoCompleteController extends _$AutoCompleteController {
  late SearchRepositoryWrapper _repository;

  /// return auto-completed channel and category keywords.
  @override
  FutureOr<List<String>> build() async {
    _repository = ref.watch(searchRepositoryWrapperProvider);
    return [];
  }

  Future<void> updateAutoCompleteKeywords({
    required String keyword,
  }) async {
    state = await AsyncValue.guard(() async {
      if (keyword.isEmpty) return [];

      final responses = await Future.wait([
        _getAutoCompleteChannelResponse(keyword),
        _getAutoCompleteCategoryResponse(keyword),
      ]);

      return [...responses[0], ...responses[1]];
    });
  }

  Future<List<String>> _getAutoCompleteChannelResponse(String keyword) async {
    final result = await _repository.getAutoCompleteChannels(
      keyword: keyword,
      offset: 0,
      size: 18,
    );

    return result.when(
      success: (response) => response?.data ?? [],
      failure: (_) => [],
    );
  }

  Future<List<String>> _getAutoCompleteCategoryResponse(
    String keyword,
  ) async {
    final result = await _repository.getAutoCompleteCategories(
      keyword: keyword,
      offset: 0,
      limit: 10,
    );

    return result.when(
      success: (response) => response?.data ?? [],
      failure: (_) => [],
    );
  }
}
