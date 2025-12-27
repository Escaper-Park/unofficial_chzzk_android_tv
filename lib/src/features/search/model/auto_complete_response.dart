import 'package:freezed_annotation/freezed_annotation.dart';

part 'auto_complete_response.freezed.dart';
part 'auto_complete_response.g.dart';

/* channel */
@freezed
class AutoCompleteSearchChannelResponse
    with _$AutoCompleteSearchChannelResponse {
  const factory AutoCompleteSearchChannelResponse({
    required int page,
    required int size,
    required int totalCount,
    required int totalPages,
    required List<String> data,
  }) = _AutoCompleteSearchChannelResponse;

  factory AutoCompleteSearchChannelResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$AutoCompleteSearchChannelResponseFromJson(json);
}

/* category */
@freezed
class AutoCompleteSearchCategoryResponse
    with _$AutoCompleteSearchCategoryResponse {
  const factory AutoCompleteSearchCategoryResponse({
    Paging? paging,
    required int totalCount,
    required List<String> data,
  }) = _AutoCompleteSearchCategoryResponse;

  factory AutoCompleteSearchCategoryResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$AutoCompleteSearchCategoryResponseFromJson(json);
}

@freezed
class Paging with _$Paging {
  const factory Paging({
    required String pagingType,
    required int currentPageNo,
    required bool lastPage,
  }) = _Paging;

  factory Paging.fromJson(Map<String, dynamic> json) => _$PagingFromJson(json);
}
