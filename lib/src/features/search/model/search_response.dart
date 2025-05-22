import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_response.g.dart';
part 'search_response.freezed.dart';

@freezed
@JsonSerializable(createToJson: true, explicitToJson: true)
class SearchChannelResponse with _$SearchChannelResponse {
  final int size;
  final List<dynamic> data;

  SearchChannelResponse({
    required this.size,
    required this.data,
  });

  factory SearchChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchChannelResponseFromJson(json);

  Map<String, Object?> toJson() => _$SearchChannelResponseToJson(this);
}

@freezed
@JsonSerializable(createToJson: true, explicitToJson: true)
class SearchVodResponse with _$SearchVodResponse {
  final int size;
  final List<dynamic> data;

  SearchVodResponse({
    required this.size,
    required this.data,
  });

  factory SearchVodResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchVodResponseFromJson(json);

  Map<String, Object?> toJson() => _$SearchVodResponseToJson(this);
}

@freezed
@JsonSerializable(createToJson: true, explicitToJson: true)
class SearchLiveResponse with _$SearchLiveResponse {
  final int size;
  final List<dynamic> data;

  SearchLiveResponse({
    required this.size,
    required this.data,
  });

  factory SearchLiveResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchLiveResponseFromJson(json);

  Map<String, Object?> toJson() => _$SearchLiveResponseToJson(this);
}
