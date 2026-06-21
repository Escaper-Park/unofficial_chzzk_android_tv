import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/network/dtos/api_response_dto.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search/data/data_sources/search_api.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search/data/data_sources/search_api_contract.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search/data/dtos/search_dtos.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search/data/repositories/chzzk_search_repository.dart';

void main() {
  test('treats null autocomplete content as empty suggestions', () async {
    const repository = ChzzkSearchRepository(
      api: _FakeSearchApi(
        channelResponse: ApiResponseDto<SearchAutoCompleteListDto>(),
        tagResponse: ApiResponseDto<SearchTagAutoCompleteDto>(),
      ),
      categoryApi: _FakeSearchCategoryApi(
        response: ApiResponseDto<SearchAutoCompleteListDto>(),
      ),
    );

    final channel = await repository.fetchChannelAutoComplete(keyword: 'game');
    final category = await repository.fetchCategoryAutoComplete(
      keyword: 'game',
    );
    final tag = await repository.fetchTagAutoComplete(keyword: 'tag');

    expect(channel.items, isEmpty);
    expect(category.items, isEmpty);
    expect(tag.keywords, isEmpty);
  });
}

final class _FakeSearchApi implements SearchApi {
  const _FakeSearchApi({
    required this.channelResponse,
    required this.tagResponse,
  });

  final ApiResponseDto<SearchAutoCompleteListDto> channelResponse;
  final ApiResponseDto<SearchTagAutoCompleteDto> tagResponse;

  @override
  Future<ApiResponseDto<SearchAutoCompleteListDto>> fetchChannelAutoComplete({
    required String keyword,
    int offset = SearchApiDefaults.offset,
    int size = SearchApiDefaults.channelAutoCompleteSize,
  }) async {
    return channelResponse;
  }

  @override
  Future<ApiResponseDto<SearchTagAutoCompleteDto>> fetchTagAutoComplete({
    required String keyword,
    int size = SearchApiDefaults.tagAutoCompleteSize,
  }) async {
    return tagResponse;
  }
}

final class _FakeSearchCategoryApi implements SearchCategoryApi {
  const _FakeSearchCategoryApi({required this.response});

  final ApiResponseDto<SearchAutoCompleteListDto> response;

  @override
  Future<ApiResponseDto<SearchAutoCompleteListDto>> fetchCategoryAutoComplete({
    required String keyword,
    int limit = SearchApiDefaults.categoryAutoCompleteLimit,
    int offset = SearchApiDefaults.offset,
  }) async {
    return response;
  }
}
