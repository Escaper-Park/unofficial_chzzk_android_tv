import 'package:freezed_annotation/freezed_annotation.dart';

part 'live_dtos.freezed.dart';
part 'live_dtos.g.dart';

@freezed
abstract class LiveListDto with _$LiveListDto {
  const factory LiveListDto({
    @Default(<LiveDto>[]) List<LiveDto> data,
    LivePageDto? page,
    @Default(0) int size,
  }) = _LiveListDto;

  factory LiveListDto.fromJson(Map<String, dynamic> json) =>
      _$LiveListDtoFromJson(json);
}

@freezed
abstract class LivePageDto with _$LivePageDto {
  const factory LivePageDto({
    LivePageNextDto? next,
  }) = _LivePageDto;

  factory LivePageDto.fromJson(Map<String, dynamic> json) =>
      _$LivePageDtoFromJson(json);
}

@freezed
abstract class LivePageNextDto with _$LivePageNextDto {
  const factory LivePageNextDto({
    int? concurrentUserCount,
    int? liveId,
  }) = _LivePageNextDto;

  factory LivePageNextDto.fromJson(Map<String, dynamic> json) =>
      _$LivePageNextDtoFromJson(json);
}

@freezed
abstract class LiveDto with _$LiveDto {
  const factory LiveDto({
    @Default(0) int liveId,
    @Default('') String liveTitle,
    String? liveImageUrl,
    String? defaultThumbnailImageUrl,
    @Default(0) int concurrentUserCount,
    String? openDate,
    @Default(false) bool adult,
    @Default(<String>[]) List<String> tags,
    String? liveCategoryValue,
    LiveChannelDto? channel,
    String? blindType,
    String? watchPartyTag,
    String? watchPartyType,
    String? membershipBenefitType,
    Map<String, dynamic>? party,
  }) = _LiveDto;

  factory LiveDto.fromJson(Map<String, dynamic> json) =>
      _$LiveDtoFromJson(json);
}

@freezed
abstract class LiveStatusDto with _$LiveStatusDto {
  const factory LiveStatusDto({
    @Default('') String liveTitle,
    @Default('') String status,
    @Default(0) int concurrentUserCount,
    @Default(false) bool adult,
    String? openDate,
    String? chatChannelId,
    @Default(<String>[]) List<String> tags,
    String? liveCategoryValue,
    String? categoryType,
    String? liveCategory,
    String? userAdultStatus,
    String? blindType,
    String? watchPartyTag,
    String? watchPartyType,
    String? channelId,
    @Default(false) bool krOnlyViewing,
    @Default(false) bool timeMachineActive,
    String? membershipBenefitType,
    List<String>? liveTokenList,
  }) = _LiveStatusDto;

  factory LiveStatusDto.fromJson(Map<String, dynamic> json) =>
      _$LiveStatusDtoFromJson(json);
}

@freezed
abstract class LiveDetailDto with _$LiveDetailDto {
  const factory LiveDetailDto({
    @Default(0) int liveId,
    @Default('') String liveTitle,
    @Default('') String status,
    String? liveImageUrl,
    String? defaultThumbnailImageUrl,
    @Default(0) int concurrentUserCount,
    String? openDate,
    @Default(false) bool adult,
    @Default(<String>[]) List<String> tags,
    String? chatChannelId,
    String? liveCategoryValue,
    String? categoryType,
    String? liveCategory,
    String? livePlaybackJson,
    LiveChannelDto? channel,
    String? userAdultStatus,
    String? blindType,
    String? watchPartyTag,
    String? watchPartyType,
    @Default(false) bool timeMachineActive,
    @Default(false) bool timeMachinePlayback,
    String? membershipBenefitType,
    Map<String, dynamic>? party,
  }) = _LiveDetailDto;

  factory LiveDetailDto.fromJson(Map<String, dynamic> json) =>
      _$LiveDetailDtoFromJson(json);
}

@freezed
abstract class LiveChannelDto with _$LiveChannelDto {
  const factory LiveChannelDto({
    @Default('') String channelId,
    @Default('') String channelName,
    String? channelImageUrl,
    @Default(false) bool verifiedMark,
    @Default(<String>[]) List<String> activatedChannelBadgeIds,
    LiveChannelPersonalDataDto? personalData,
  }) = _LiveChannelDto;

  factory LiveChannelDto.fromJson(Map<String, dynamic> json) =>
      _$LiveChannelDtoFromJson(json);
}

@freezed
abstract class LiveChannelPersonalDataDto with _$LiveChannelPersonalDataDto {
  const factory LiveChannelPersonalDataDto({
    LiveChannelPersonalFollowingDto? following,
    @Default(false) bool privateUserBlock,
  }) = _LiveChannelPersonalDataDto;

  factory LiveChannelPersonalDataDto.fromJson(Map<String, dynamic> json) =>
      _$LiveChannelPersonalDataDtoFromJson(json);
}

@freezed
abstract class LiveChannelPersonalFollowingDto
    with _$LiveChannelPersonalFollowingDto {
  const factory LiveChannelPersonalFollowingDto({
    @Default(false) bool following,
    @Default(false) bool notification,
    String? followDate,
  }) = _LiveChannelPersonalFollowingDto;

  factory LiveChannelPersonalFollowingDto.fromJson(Map<String, dynamic> json) =>
      _$LiveChannelPersonalFollowingDtoFromJson(json);
}
