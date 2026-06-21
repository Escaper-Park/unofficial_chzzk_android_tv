import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_dtos.freezed.dart';
part 'search_dtos.g.dart';

@freezed
abstract class SearchAutoCompleteListDto with _$SearchAutoCompleteListDto {
  const factory SearchAutoCompleteListDto({
    @Default(<String>[]) List<String> data,
    @Default(0) int size,
    @Default(0) int totalCount,
    @Default(0) int totalPages,
  }) = _SearchAutoCompleteListDto;

  factory SearchAutoCompleteListDto.fromJson(Map<String, dynamic> json) =>
      _$SearchAutoCompleteListDtoFromJson(json);
}

@freezed
abstract class SearchTagAutoCompleteDto with _$SearchTagAutoCompleteDto {
  const factory SearchTagAutoCompleteDto({
    @Default(<String>[]) List<String> keywords,
  }) = _SearchTagAutoCompleteDto;

  factory SearchTagAutoCompleteDto.fromJson(Map<String, dynamic> json) =>
      _$SearchTagAutoCompleteDtoFromJson(json);
}
