import 'package:freezed_annotation/freezed_annotation.dart';

import '../../channel/model/channel.dart';

part 'search.freezed.dart';
part 'search.g.dart';

@freezed
class SearchChannelResponse with _$SearchChannelResponse {
  const factory SearchChannelResponse({
    required int size,
    required List<SearchChannelData> data,
  }) = _SearchChannelResponse;

  factory SearchChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchChannelResponseFromJson(json);
}

@freezed
class SearchChannelData with _$SearchChannelData {
  const factory SearchChannelData({
    required Channel channel,
  }) = _SearchChannelData;

  factory SearchChannelData.fromJson(Map<String, dynamic> json) =>
      _$SearchChannelDataFromJson(json);
}

