import 'package:freezed_annotation/freezed_annotation.dart';

part 'auto_complete_response.freezed.dart';
part 'auto_complete_response.g.dart';

/* channel */
@freezed
@JsonSerializable()
class AutoCompleteSearchChannelResponse
    with _$AutoCompleteSearchChannelResponse {
  final int page;
  final int size;
  final int totalCount;
  final int totalPages;
  final List<String> data;

  AutoCompleteSearchChannelResponse({
    required this.page,
    required this.size,
    required this.totalCount,
    required this.totalPages,
    required this.data,
  });

  factory AutoCompleteSearchChannelResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$AutoCompleteSearchChannelResponseFromJson(json);
}

/* category */
@freezed
@JsonSerializable()
class AutoCompleteSearchCategoryResponse
    with _$AutoCompleteSearchCategoryResponse {
  final Paging? paging;
  final int totalCount;
  final List<String> data;

  AutoCompleteSearchCategoryResponse({
    required this.paging,
    required this.totalCount,
    required this.data,
  });

  factory AutoCompleteSearchCategoryResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$AutoCompleteSearchCategoryResponseFromJson(json);
}

@freezed
@JsonSerializable()
class Paging with _$Paging {
  final String pagingType;
  final int currentPageNo;
  final bool lastPage;

  Paging({
    required this.pagingType,
    required this.currentPageNo,
    required this.lastPage,
  });

  factory Paging.fromJson(Map<String, dynamic> json) => _$PagingFromJson(json);
}

