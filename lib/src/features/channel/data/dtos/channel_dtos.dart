import 'package:freezed_annotation/freezed_annotation.dart';

part 'channel_dtos.freezed.dart';
part 'channel_dtos.g.dart';

@freezed
abstract class ChannelDetailDto with _$ChannelDetailDto {
  const factory ChannelDetailDto({
    required String channelId,
    required String channelName,
    String? channelImageUrl,
    @Default(false) bool verifiedMark,
    @Default(0) int followerCount,
    @Default('') String channelDescription,
    @Default(<String>[]) List<String> activatedChannelBadgeIds,
    @Default(false) bool openLive,
    ChannelPersonalDataDto? personalData,
  }) = _ChannelDetailDto;

  factory ChannelDetailDto.fromJson(Map<String, dynamic> json) =>
      _$ChannelDetailDtoFromJson(json);
}

@freezed
abstract class ChannelMyInfoDto with _$ChannelMyInfoDto {
  const factory ChannelMyInfoDto({
    required String channelId,
    ChannelPersonalFollowingDto? following,
    @Default(false) bool cheatKey,
    @Default(false) bool naverMembership,
  }) = _ChannelMyInfoDto;

  factory ChannelMyInfoDto.fromJson(Map<String, dynamic> json) =>
      _$ChannelMyInfoDtoFromJson(json);
}

@freezed
abstract class ChannelVideoListDto with _$ChannelVideoListDto {
  const factory ChannelVideoListDto({
    @Default(<ChannelVideoDto>[]) List<ChannelVideoDto> data,
    @Default(0) int page,
    @Default(0) int size,
    @Default(0) int totalCount,
    @Default(0) int totalPages,
  }) = _ChannelVideoListDto;

  factory ChannelVideoListDto.fromJson(Map<String, dynamic> json) =>
      _$ChannelVideoListDtoFromJson(json);
}

@freezed
abstract class ChannelVideoDto with _$ChannelVideoDto {
  const factory ChannelVideoDto({
    @Default(0) int videoNo,
    String? videoId,
    @Default('') String videoTitle,
    @Default('') String videoType,
    @Default('') String publishDate,
    String? thumbnailImageUrl,
    @Default(0) int duration,
    @Default(0) int readCount,
    @Default(0) int publishDateAt,
    String? videoCategoryValue,
    @Default(false) bool adult,
    @Default(0) int livePv,
    @Default(<String>[]) List<String> tags,
    ChannelNestedDto? channel,
    String? blindType,
    int? watchTimeline,
  }) = _ChannelVideoDto;

  factory ChannelVideoDto.fromJson(Map<String, dynamic> json) =>
      _$ChannelVideoDtoFromJson(json);
}

@freezed
abstract class ChannelNestedDto with _$ChannelNestedDto {
  const factory ChannelNestedDto({
    @Default('') String channelId,
    @Default('') String channelName,
    String? channelImageUrl,
    @Default(false) bool verifiedMark,
    @Default(<String>[]) List<String> activatedChannelBadgeIds,
    ChannelPersonalDataDto? personalData,
  }) = _ChannelNestedDto;

  factory ChannelNestedDto.fromJson(Map<String, dynamic> json) =>
      _$ChannelNestedDtoFromJson(json);
}

@freezed
abstract class ChannelPersonalDataDto with _$ChannelPersonalDataDto {
  const factory ChannelPersonalDataDto({
    ChannelPersonalFollowingDto? following,
    @Default(false) bool privateUserBlock,
  }) = _ChannelPersonalDataDto;

  factory ChannelPersonalDataDto.fromJson(Map<String, dynamic> json) =>
      _$ChannelPersonalDataDtoFromJson(json);
}

@freezed
abstract class ChannelPersonalFollowingDto with _$ChannelPersonalFollowingDto {
  const factory ChannelPersonalFollowingDto({
    @Default(false) bool following,
    @Default(false) bool notification,
    String? followDate,
  }) = _ChannelPersonalFollowingDto;

  factory ChannelPersonalFollowingDto.fromJson(Map<String, dynamic> json) =>
      _$ChannelPersonalFollowingDtoFromJson(json);
}
