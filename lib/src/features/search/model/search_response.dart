import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_response.g.dart';
part 'search_response.freezed.dart';

@freezed
class SearchChannelResponse with _$SearchChannelResponse {
  const factory SearchChannelResponse({
    required int size,
    required List<dynamic> data,
  }) = _SearchChannelResponse;

  factory SearchChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchChannelResponseFromJson(json);
}

@freezed
class SearchVodResponse with _$SearchVodResponse {
  const factory SearchVodResponse({
    required int size,
    required List<dynamic> data,
  }) = _SearchVodResponse;

  factory SearchVodResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchVodResponseFromJson(json);
}

@freezed
class SearchLiveResponse with _$SearchLiveResponse {
  const factory SearchLiveResponse({
    required int size,
    required List<dynamic> data,
  }) = _SearchLiveResponse;

  factory SearchLiveResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchLiveResponseFromJson(json);
}

