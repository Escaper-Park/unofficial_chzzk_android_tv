import 'package:freezed_annotation/freezed_annotation.dart';

import '../../channel/model/channel.dart';

part 'live_info.g.dart';
part 'live_info.freezed.dart';

@freezed
@JsonSerializable()
class LiveInfo with _$LiveInfo {
  final int? liveId;
  final String? liveTitle;
  final String? liveImageUrl;
  final String? defaultThumbnailImageUrl;
  final int concurrentUserCount;
  final int? accumulateCount;
  final String? openDate;
  final bool? adult;
  final List<String>? tags;
  final String? categoryType;
  final String? liveCategory;
  final String? liveCategoryValue;
  final String? watchPartyTag;
  final Channel? channel;
  final String? blindType;

  LiveInfo({
    this.liveId,
    this.liveTitle,
    this.liveImageUrl,
    this.defaultThumbnailImageUrl,
    this.concurrentUserCount = 0,
    this.accumulateCount,
    this.openDate,
    this.adult,
    this.tags,
    this.categoryType,
    this.liveCategory,
    this.liveCategoryValue,
    this.watchPartyTag,
    this.channel,
    this.blindType,
  });

  factory LiveInfo.fromJson(Map<String, dynamic> json) =>
      _$LiveInfoFromJson(json);

  Map<String, Object?> toJson() => _$LiveInfoToJson(this);
}

