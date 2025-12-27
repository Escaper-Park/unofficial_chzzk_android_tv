import 'package:freezed_annotation/freezed_annotation.dart';

import 'following.dart';

part 'following_response.g.dart';
part 'following_response.freezed.dart';

@freezed
class FollowingResponse with _$FollowingResponse {
  const factory FollowingResponse({
    int? totalCount,
    int? totalPage,
    required List<Following> followingList,
  }) = _FollowingResponse;

  factory FollowingResponse.fromJson(Map<String, dynamic> json) =>
      _$FollowingResponseFromJson(json);
}
