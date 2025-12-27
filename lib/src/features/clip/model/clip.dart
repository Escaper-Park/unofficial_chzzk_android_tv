import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'clip.freezed.dart';
part 'clip.g.dart';

@freezed
class NaverClip with _$NaverClip {
  const factory NaverClip({
    required String clipUID,
    String? videoId,
    required String clipTitle,
    required String ownerChannelId,
    OwnerChannel? ownerChannel,
    String? thumbnailImageUrl,
    required int duration,
    required bool adult,
    String? blindType,
    String? categoryType,
    String? clipCategory,
    String? categoryValue,
    required String createdDate,
    required int readCount,
    @RecIdConverter() RecId? recId,
    @ContentLineageConverter() ContentLineage? contentLineage,
    bool? privateUserBlock,
  }) = _NaverClip;

  factory NaverClip.fromJson(Map<String, dynamic> json) =>
      _$NaverClipFromJson(json);
}

@freezed
class OwnerChannel with _$OwnerChannel {
  const factory OwnerChannel({
    required String channelId,
    required String channelName,
    String? channelImageUrl,
    required bool verifiedMark,
  }) = _OwnerChannel;

  factory OwnerChannel.fromJson(Map<String, dynamic> json) =>
      _$OwnerChannelFromJson(json);
}

@freezed
class RecId with _$RecId {
  const factory RecId({
    String? seedClipUID,
    String? fromType,
    String? listType,
    String? orderType,
    String? filterType,
    String? recommendRecId,
  }) = _RecId;

  factory RecId.fromJson(Map<String, dynamic> json) => _$RecIdFromJson(json);
}

@freezed
class ContentLineage with _$ContentLineage {
  const factory ContentLineage({
    String? contentSource,
    String? contentType,
    ContentTag? contentTag,
  }) = _ContentLineage;

  factory ContentLineage.fromJson(Map<String, dynamic> json) =>
      _$ContentLineageFromJson(json);
}

@freezed
class ContentTag with _$ContentTag {
  const factory ContentTag({
    String? internal,
    @JsonKey(name: 'external') External? externalTag,
  }) = _ContentTag;

  factory ContentTag.fromJson(Map<String, dynamic> json) =>
      _$ContentTagFromJson(json);
}

@freezed
class External with _$External {
  const factory External({
    String? rqt,
    String? apiRequestKey,
  }) = _External;

  factory External.fromJson(Map<String, dynamic> json) =>
      _$ExternalFromJson(json);
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
