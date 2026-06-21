import '../../domain/entities/search_suggestions.dart';
import '../dtos/search_dtos.dart';

SearchSuggestions searchSuggestionsFromDto(SearchAutoCompleteListDto dto) {
  return SearchSuggestions(
    items: dto.data,
    size: dto.size,
    totalCount: dto.totalCount,
    totalPages: dto.totalPages,
  );
}

SearchTagSuggestions searchTagSuggestionsFromDto(
  SearchTagAutoCompleteDto dto,
) {
  return SearchTagSuggestions(keywords: dto.keywords);
}
