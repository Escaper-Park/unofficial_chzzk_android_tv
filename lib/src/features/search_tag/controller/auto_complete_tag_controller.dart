import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repository/search_tag_repository_wrapper.dart';

part 'auto_complete_tag_controller.g.dart';

@riverpod
class AutoCompleteTagController extends _$AutoCompleteTagController {
  late SearchTagRepositoryWrapper _repository;

  @override
  FutureOr<List<String>> build() {
    _repository = ref.watch(searchTagRepositoryWrapperProvider);
    return [];
  }

  Future<void> updateAutoCompleteKeywords({
    required String keyword,
  }) async {
    state = await AsyncValue.guard(() async {
      if (keyword.isEmpty) return [];

      final result = await _repository.getAutoCompleteTagResponse(
        keyword: keyword,
        size: 50,
      );

      return result.when(
        success: (response) => response?.keywords ?? [],
        failure: (_) => [],
      );
    });
  }
}
