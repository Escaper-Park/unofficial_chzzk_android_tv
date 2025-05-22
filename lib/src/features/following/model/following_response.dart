import 'package:freezed_annotation/freezed_annotation.dart';

import 'following.dart';

part 'following_response.g.dart';
part 'following_response.freezed.dart';

@freezed
@JsonSerializable()
class FollowingResponse with _$FollowingResponse {
  final int? totalCount;
  final int? totalPage;
  final List<Following> followingList;

  factory FollowingResponse.fromJson(Map<String, dynamic> json) =>
      _$FollowingResponseFromJson(json);

  FollowingResponse({
    this.totalCount,
    this.totalPage,
    required this.followingList,
  });
}
