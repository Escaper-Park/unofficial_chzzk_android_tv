import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/dio/dio_client.dart';
import '../repository/search_repository.dart';

part 'auto_complete_controller.g.dart';

@riverpod
class AutoCompleteController extends _$AutoCompleteController {
  late SearchRepository _searchRepository;
  late CategorySearchRepository _categorySearchRepository;

  /// return auto-completed channel and category keywords.
  @override
  FutureOr<List<String>> build() async {
    final Dio dio = ref.watch(dioClientProvider);
    _searchRepository = SearchRepository(dio);
    _categorySearchRepository = CategorySearchRepository(dio);

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
    final response =
        await _searchRepository.getAutoCompleteSearchChannelResponse(
      keyword: keyword,
      offset: 0,
      size: 18,
    );

    return response?.data ?? [];
  }

  Future<List<String>> _getAutoCompleteCategoryResponse(
    String keyword,
  ) async {
    final response =
        await _categorySearchRepository.getAutoCompleteSearchCategoryResponse(
      keyword: keyword,
      offset: 0,
      limit: 10,
    );

    return response?.data ?? [];
  }
}
