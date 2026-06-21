import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_suggestions.freezed.dart';

@freezed
abstract class SearchSuggestions with _$SearchSuggestions {
  const factory SearchSuggestions({
    @Default(<String>[]) List<String> items,
    @Default(0) int size,
    @Default(0) int totalCount,
    @Default(0) int totalPages,
  }) = _SearchSuggestions;
}

@freezed
abstract class SearchTagSuggestions with _$SearchTagSuggestions {
  const factory SearchTagSuggestions({
    @Default(<String>[]) List<String> keywords,
  }) = _SearchTagSuggestions;
}
