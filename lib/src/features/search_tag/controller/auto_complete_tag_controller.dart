import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/dio/dio_client.dart';
import '../repository/search_tag_repository.dart';

part 'auto_complete_tag_controller.g.dart';

@riverpod
class AutoCompleteTagController extends _$AutoCompleteTagController {
  late SearchTagRepository _repository;

  @override
  FutureOr<List<String>> build() {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = SearchTagRepository(dio);
    return [];
  }

  Future<void> updateAutoCompleteKeywords({
    required String keyword,
  }) async {
    state = await AsyncValue.guard(() async {
      if (keyword.isEmpty) return [];

      final response = await _repository.getAutoCompleteTagResponse(
        keyword: keyword,
        size: 50,
      );

      return response?.keywords ?? [];
    });
  }
}
