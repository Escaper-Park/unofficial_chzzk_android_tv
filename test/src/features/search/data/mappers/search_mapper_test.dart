import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search/data/dtos/search_dtos.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search/data/mappers/search_mapper.dart';

void main() {
  test('maps autocomplete dto into domain suggestions', () {
    const dto = SearchAutoCompleteListDto(
      data: ['alpha', 'beta'],
      size: 2,
      totalCount: 10,
      totalPages: 5,
    );

    final suggestions = searchSuggestionsFromDto(dto);

    expect(suggestions.items, ['alpha', 'beta']);
    expect(suggestions.size, 2);
    expect(suggestions.totalCount, 10);
    expect(suggestions.totalPages, 5);
  });

  test('parses channel autocomplete payload with numeric page', () {
    final dto = SearchAutoCompleteListDto.fromJson({
      'page': 1,
      'size': 10,
      'totalCount': 7,
      'totalPages': 1,
      'data': ['channel'],
    });

    expect(dto.data, ['channel']);
    expect(dto.size, 10);
    expect(dto.totalCount, 7);
    expect(dto.totalPages, 1);
  });

  test('parses category autocomplete payload with paging object', () {
    final dto = SearchAutoCompleteListDto.fromJson({
      'data': ['category'],
      'paging': {
        'pagingType': 'OFFSET',
        'currentPageNo': 1,
        'lastPage': true,
      },
      'totalCount': 5,
    });

    expect(dto.data, ['category']);
    expect(dto.totalCount, 5);
  });

  test('maps tag autocomplete dto into domain suggestions', () {
    const dto = SearchTagAutoCompleteDto(keywords: ['tag']);

    final suggestions = searchTagSuggestionsFromDto(dto);

    expect(suggestions.keywords, ['tag']);
  });
}
