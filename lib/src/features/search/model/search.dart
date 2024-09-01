import 'package:freezed_annotation/freezed_annotation.dart';

import '../../channel/model/channel.dart';

part 'search.freezed.dart';
part 'search.g.dart';

@freezed
class SearchResponse with _$SearchResponse {
  const factory SearchResponse({
    required int size,
    required List<SearchChannelData> data,
  }) = _SearchResponse;

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);
}

@freezed
class SearchChannelData with _$SearchChannelData {
  const factory SearchChannelData({
    required Channel channel,
  }) = _SearchChannelData;

  factory SearchChannelData.fromJson(Map<String, dynamic> json) =>
      _$SearchChannelDataFromJson(json);
}
