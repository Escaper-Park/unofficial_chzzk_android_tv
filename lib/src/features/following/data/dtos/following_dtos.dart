import 'package:freezed_annotation/freezed_annotation.dart';

part 'following_dtos.freezed.dart';
part 'following_dtos.g.dart';

@freezed
abstract class FollowingChannelListDto with _$FollowingChannelListDto {
  const factory FollowingChannelListDto({
    @Default(<FollowingChannelDto>[]) List<FollowingChannelDto> followingList,
    @Default(0) int totalCount,
    @Default(0) int totalPage,
  }) = _FollowingChannelListDto;

  factory FollowingChannelListDto.fromJson(Map<String, dynamic> json) =>
      _$FollowingChannelListDtoFromJson(json);
}

@freezed
abstract class FollowingLiveListDto with _$FollowingLiveListDto {
  const factory FollowingLiveListDto({
    @Default(<FollowingChannelDto>[]) List<FollowingChannelDto> followingList,
    int? totalCount,
    int? totalLiveCount,
    int? totalPage,
  }) = _FollowingLiveListDto;

  factory FollowingLiveListDto.fromJson(Map<String, dynamic> json) =>
      _$FollowingLiveListDtoFromJson(json);
}

@freezed
abstract class FollowingChannelDto with _$FollowingChannelDto {
  const factory FollowingChannelDto({
    FollowingChannelInfoDto? channel,
    @Default('') String channelId,
    FollowingLiveInfoDto? liveInfo,
    FollowingStreamerDto? streamer,
  }) = _FollowingChannelDto;

  factory FollowingChannelDto.fromJson(Map<String, dynamic> json) =>
      _$FollowingChannelDtoFromJson(json);
}

@freezed
abstract class FollowingLiveInfoDto with _$FollowingLiveInfoDto {
  const factory FollowingLiveInfoDto({
    int? liveId,
    String? liveTitle,
    String? liveImageUrl,
    String? defaultThumbnailImageUrl,
    @Default(0) int concurrentUserCount,
    @Default(false) bool adult,
    @Default(<String>[]) List<String> tags,
    String? liveCategoryValue,
    String? blindType,
    String? watchPartyTag,
    String? watchPartyType,
    Map<String, dynamic>? party,
  }) = _FollowingLiveInfoDto;

  factory FollowingLiveInfoDto.fromJson(Map<String, dynamic> json) =>
      _$FollowingLiveInfoDtoFromJson(json);
}

@freezed
abstract class FollowingStreamerDto with _$FollowingStreamerDto {
  const factory FollowingStreamerDto({
    @Default(false) bool openLive,
  }) = _FollowingStreamerDto;

  factory FollowingStreamerDto.fromJson(Map<String, dynamic> json) =>
      _$FollowingStreamerDtoFromJson(json);
}

@freezed
abstract class FollowingChannelInfoDto with _$FollowingChannelInfoDto {
  const factory FollowingChannelInfoDto({
    @Default('') String channelId,
    @Default('') String channelName,
    String? channelImageUrl,
    @Default(false) bool verifiedMark,
    @Default(<String>[]) List<String> activatedChannelBadgeIds,
    FollowingChannelPersonalDataDto? personalData,
  }) = _FollowingChannelInfoDto;

  factory FollowingChannelInfoDto.fromJson(Map<String, dynamic> json) =>
      _$FollowingChannelInfoDtoFromJson(json);
}

@freezed
abstract class FollowingChannelPersonalDataDto
    with _$FollowingChannelPersonalDataDto {
  const factory FollowingChannelPersonalDataDto({
    FollowingChannelPersonalFollowingDto? following,
    @Default(false) bool privateUserBlock,
  }) = _FollowingChannelPersonalDataDto;

  factory FollowingChannelPersonalDataDto.fromJson(
    Map<String, dynamic> json,
  ) => _$FollowingChannelPersonalDataDtoFromJson(json);
}

@freezed
abstract class FollowingChannelPersonalFollowingDto
    with _$FollowingChannelPersonalFollowingDto {
  const factory FollowingChannelPersonalFollowingDto({
    @Default(false) bool following,
    @Default(false) bool notification,
    String? followDate,
  }) = _FollowingChannelPersonalFollowingDto;

  factory FollowingChannelPersonalFollowingDto.fromJson(
    Map<String, dynamic> json,
  ) => _$FollowingChannelPersonalFollowingDtoFromJson(json);
}
