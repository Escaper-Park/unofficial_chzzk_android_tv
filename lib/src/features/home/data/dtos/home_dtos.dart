import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_dtos.freezed.dart';
part 'home_dtos.g.dart';

@freezed
abstract class HomeMainDto with _$HomeMainDto {
  const factory HomeMainDto({
    @Default(<HomeLiveDto>[]) List<HomeLiveDto> topLives,
  }) = _HomeMainDto;

  factory HomeMainDto.fromJson(Map<String, dynamic> json) =>
      _$HomeMainDtoFromJson(json);
}

@freezed
abstract class HomeLiveDto with _$HomeLiveDto {
  const factory HomeLiveDto({
    @Default(0) int liveId,
    @Default('') String liveTitle,
    String? liveImageUrl,
    String? defaultThumbnailImageUrl,
    @Default(0) int concurrentUserCount,
    @Default(false) bool adult,
    @Default(<String>[]) List<String> tags,
    String? openDate,
    String? liveCategoryValue,
    HomeChannelDto? channel,
    String? blindType,
    String? watchPartyTag,
    String? watchPartyType,
    String? membershipBenefitType,
    Map<String, dynamic>? party,
  }) = _HomeLiveDto;

  factory HomeLiveDto.fromJson(Map<String, dynamic> json) =>
      _$HomeLiveDtoFromJson(json);
}

@freezed
abstract class HomeChannelDto with _$HomeChannelDto {
  const factory HomeChannelDto({
    @Default('') String channelId,
    @Default('') String channelName,
    String? channelImageUrl,
    @Default(false) bool verifiedMark,
    @Default(<String>[]) List<String> activatedChannelBadgeIds,
    HomeChannelPersonalDataDto? personalData,
  }) = _HomeChannelDto;

  factory HomeChannelDto.fromJson(Map<String, dynamic> json) =>
      _$HomeChannelDtoFromJson(json);
}

@freezed
abstract class HomeChannelPersonalDataDto with _$HomeChannelPersonalDataDto {
  const factory HomeChannelPersonalDataDto({
    HomeChannelPersonalFollowingDto? following,
    @Default(false) bool privateUserBlock,
  }) = _HomeChannelPersonalDataDto;

  factory HomeChannelPersonalDataDto.fromJson(Map<String, dynamic> json) =>
      _$HomeChannelPersonalDataDtoFromJson(json);
}

@freezed
abstract class HomeChannelPersonalFollowingDto
    with _$HomeChannelPersonalFollowingDto {
  const factory HomeChannelPersonalFollowingDto({
    @Default(false) bool following,
    @Default(false) bool notification,
    String? followDate,
  }) = _HomeChannelPersonalFollowingDto;

  factory HomeChannelPersonalFollowingDto.fromJson(Map<String, dynamic> json) =>
      _$HomeChannelPersonalFollowingDtoFromJson(json);
}
