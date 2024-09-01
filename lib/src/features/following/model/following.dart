import 'package:freezed_annotation/freezed_annotation.dart';

import '../../category/model/category.dart';
import '../../channel/model/channel.dart';
import '../../live/model/live.dart';

part 'following.freezed.dart';
part 'following.g.dart';

@freezed
class Following with _$Following {
  const factory Following({
    required String channelId,
    required Channel channel,
    required Streamer streamer,
    required LiveInfo liveInfo,
  }) = _Following;

  factory Following.fromJson(Map<String, dynamic> json) =>
      _$FollowingFromJson(json);
}

@freezed
class Streamer with _$Streamer {
  const factory Streamer({
    required bool openLive,
  }) = _Streamer;

  factory Streamer.fromJson(Map<String, dynamic> json) =>
      _$StreamerFromJson(json);
}

@freezed
class FollowingResponse with _$FollowingResponse {
  const factory FollowingResponse({
    required int totalCount,
    required int? totalPage,
    required List<Following> followingList,
  }) = _FollowingResponse;

  factory FollowingResponse.fromJson(Map<String, dynamic> json) =>
      _$FollowingResponseFromJson(json);
}

@freezed
class FollowingCategoryResponse with _$FollowingCategoryResponse {
  const factory FollowingCategoryResponse({
    required List<Category>? followingList,
  }) = _FollowingCategoryResponse;

  factory FollowingCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$FollowingCategoryResponseFromJson(json);
}
