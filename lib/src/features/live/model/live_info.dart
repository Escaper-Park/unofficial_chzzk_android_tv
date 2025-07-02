import 'package:freezed_annotation/freezed_annotation.dart';

import '../../channel/model/channel.dart';

part 'live_info.g.dart';
part 'live_info.freezed.dart';

@freezed
class LiveInfo with _$LiveInfo {
  const factory LiveInfo({
    int? liveId,
    String? liveTitle,
    String? liveImageUrl,
    String? defaultThumbnailImageUrl,
    @Default(0) int concurrentUserCount,
    int? accumulateCount,
    String? openDate,
    bool? adult,
    List<String>? tags,
    String? categoryType,
    String? liveCategory,
    String? liveCategoryValue,
    String? watchPartyTag,
    Channel? channel,
    String? blindType,
  }) = _LiveInfo;

  factory LiveInfo.fromJson(Map<String, dynamic> json) =>
      _$LiveInfoFromJson(json);
}