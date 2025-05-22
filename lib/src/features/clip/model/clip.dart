import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'clip.freezed.dart';
part 'clip.g.dart';

@freezed
@JsonSerializable(createToJson: true, explicitToJson: true)
class NaverClip with _$NaverClip {
  final String clipUID;
  final String? videoId;
  final String clipTitle;
  final String ownerChannelId;
  final OwnerChannel? ownerChannel;
  final String? thumbnailImageUrl;
  final int duration;
  final bool adult;
  final String? blindType;
  final String? categoryType;
  final String? clipCategory;
  final String? categoryValue;
  final String createdDate;
  final int readCount;
  @RecIdConverter()
  final RecId? recId;
  @ContentLineageConverter()
  final ContentLineage? contentLineage;

  final bool? privateUserBlock;

  NaverClip({
    required this.clipUID,
    this.videoId,
    required this.clipTitle,
    required this.ownerChannelId,
    required this.ownerChannel,
    this.thumbnailImageUrl,
    required this.duration,
    required this.adult,
    this.blindType,
    this.categoryType,
    this.clipCategory,
    this.categoryValue,
    required this.createdDate,
    required this.readCount,
    @RecIdConverter() required this.recId,
    @ContentLineageConverter() required this.contentLineage,
    this.privateUserBlock,
  });

  factory NaverClip.fromJson(Map<String, dynamic> json) =>
      _$NaverClipFromJson(json);

  Map<String, dynamic> toJson() => _$NaverClipToJson(this);
}

@freezed
@JsonSerializable()
class OwnerChannel with _$OwnerChannel {
  final String channelId;
  final String channelName;
  final String? channelImageUrl;
  final bool verifiedMark;

  OwnerChannel({
    required this.channelId,
    required this.channelName,
    this.channelImageUrl,
    required this.verifiedMark,
  });

  factory OwnerChannel.fromJson(Map<String, dynamic> json) =>
      _$OwnerChannelFromJson(json);

  Map<String, dynamic> toJson() => _$OwnerChannelToJson(this);
}

@freezed
@JsonSerializable(explicitToJson: true)
class RecId with _$RecId {
  final String? seedClipUID;
  final String? fromType;
  final String? listType;
  final String? orderType;
  final String? filterType;
  final String? recommendRecId;

  RecId({
    this.seedClipUID,
    this.fromType,
    this.listType,
    this.recommendRecId,
    this.orderType,
    this.filterType,
  });

  factory RecId.fromJson(Map<String, dynamic> json) => _$RecIdFromJson(json);
  Map<String, dynamic> toJson() => _$RecIdToJson(this);
}

@freezed
@JsonSerializable(explicitToJson: true)
class ContentLineage with _$ContentLineage {
  final String? contentSource;
  final String? contentType;
  final ContentTag? contentTag;

  ContentLineage({
    this.contentSource,
    this.contentType,
    this.contentTag,
  });

  factory ContentLineage.fromJson(Map<String, dynamic> json) =>
      _$ContentLineageFromJson(json);

  Map<String, dynamic> toJson() => _$ContentLineageToJson(this);
}

@freezed
@JsonSerializable(explicitToJson: true)
class ContentTag with _$ContentTag {
  final String? internal;

  @JsonKey(name: 'external')
  final External? externalTag;

  ContentTag({
    this.internal,
    @JsonKey(name: 'external') this.externalTag,
  });

  factory ContentTag.fromJson(Map<String, dynamic> json) =>
      _$ContentTagFromJson(json);

  Map<String, dynamic> toJson() => _$ContentTagToJson(this);
}

@freezed
@JsonSerializable(explicitToJson: true)
class External with _$External {
  final String? rqt;
  final String? apiRequestKey;

  External({
    this.rqt,
    this.apiRequestKey,
  });

  factory External.fromJson(Map<String, dynamic> json) =>
      _$ExternalFromJson(json);

  Map<String, dynamic> toJson() => _$ExternalToJson(this);
}

class RecIdConverter implements JsonConverter<RecId, String> {
  const RecIdConverter();

  @override
  RecId fromJson(String json) {
    final recIdJson = jsonDecode(json);

    return RecId.fromJson(recIdJson);
  }

  @override
  String toJson(RecId object) {
    final jsonMap = object.toJson();

    return jsonEncode(jsonMap);
  }
}

class ContentLineageConverter implements JsonConverter<ContentLineage, String> {
  const ContentLineageConverter();

  @override
  ContentLineage fromJson(String json) {
    final contentLineageJson = jsonDecode(json);

    if (contentLineageJson['contentTag'] is String) {
      contentLineageJson['contentTag'] =
          jsonDecode(contentLineageJson['contentTag']);
    }

    return ContentLineage.fromJson(contentLineageJson);
  }

  @override
  String toJson(ContentLineage object) {
    final jsonMap = object.toJson();

    return jsonEncode(jsonMap);
  }
}
