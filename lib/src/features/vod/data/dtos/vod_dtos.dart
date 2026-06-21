import 'package:freezed_annotation/freezed_annotation.dart';

part 'vod_dtos.freezed.dart';
part 'vod_dtos.g.dart';
part 'vod_playback_dtos.dart';

@freezed
abstract class VodListDto with _$VodListDto {
  const factory VodListDto({
    @Default(<VodDto>[]) List<VodDto> data,
    VodPageDto? page,
    @Default(0) int size,
  }) = _VodListDto;

  factory VodListDto.fromJson(Map<String, dynamic> json) =>
      _$VodListDtoFromJson(json);
}

@freezed
abstract class FollowingVodListDto with _$FollowingVodListDto {
  const factory FollowingVodListDto({
    @Default(<VodDto>[]) List<VodDto> data,
    FollowingVodPageDto? page,
    @Default(0) int size,
  }) = _FollowingVodListDto;

  factory FollowingVodListDto.fromJson(Map<String, dynamic> json) =>
      _$FollowingVodListDtoFromJson(json);
}

@freezed
abstract class VodPageDto with _$VodPageDto {
  const factory VodPageDto({
    VodPageNextDto? next,
  }) = _VodPageDto;

  factory VodPageDto.fromJson(Map<String, dynamic> json) =>
      _$VodPageDtoFromJson(json);
}

@freezed
abstract class VodPageNextDto with _$VodPageNextDto {
  const factory VodPageNextDto({
    int? publishDateAt,
    int? readCount,
  }) = _VodPageNextDto;

  factory VodPageNextDto.fromJson(Map<String, dynamic> json) =>
      _$VodPageNextDtoFromJson(json);
}

@freezed
abstract class FollowingVodPageDto with _$FollowingVodPageDto {
  const factory FollowingVodPageDto({
    FollowingVodPageNextDto? next,
  }) = _FollowingVodPageDto;

  factory FollowingVodPageDto.fromJson(Map<String, dynamic> json) =>
      _$FollowingVodPageDtoFromJson(json);
}

@freezed
abstract class FollowingVodPageNextDto with _$FollowingVodPageNextDto {
  const factory FollowingVodPageNextDto({
    String? nextNo,
  }) = _FollowingVodPageNextDto;

  factory FollowingVodPageNextDto.fromJson(Map<String, dynamic> json) =>
      _$FollowingVodPageNextDtoFromJson(json);
}

@freezed
abstract class VodDto with _$VodDto {
  const factory VodDto({
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
    VodChannelDto? channel,
    String? blindType,
    int? watchTimeline,
    String? userAdultStatus,
    String? membershipBenefitType,
  }) = _VodDto;

  factory VodDto.fromJson(Map<String, dynamic> json) => _$VodDtoFromJson(json);
}

@freezed
abstract class VodDetailDto with _$VodDetailDto {
  const factory VodDetailDto({
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
    @Default(false) bool chapterActive,
    @Default(<VodChapterDto>[]) List<VodChapterDto> chapters,
    VodChannelDto? channel,
    String? blindType,
    int? watchTimeline,
    String? inKey,
    String? liveOpenDate,
    String? liveRewindPlaybackJson,
    String? userAdultStatus,
    @Default(false) bool videoChatEnabled,
    String? videoChatChannelId,
    String? membershipBenefitType,
  }) = _VodDetailDto;

  factory VodDetailDto.fromJson(Map<String, dynamic> json) =>
      _$VodDetailDtoFromJson(json);
}

@freezed
abstract class VodChapterDto with _$VodChapterDto {
  const factory VodChapterDto({
    @Default('') String title,
    @Default(0) int startTime,
    @Default(0) int endTime,
    String? thumbnailUrl,
  }) = _VodChapterDto;

  factory VodChapterDto.fromJson(Map<String, dynamic> json) =>
      _$VodChapterDtoFromJson(json);
}

@freezed
abstract class VodChannelDto with _$VodChannelDto {
  const factory VodChannelDto({
    @Default('') String channelId,
    @Default('') String channelName,
    String? channelImageUrl,
    @Default(false) bool verifiedMark,
    @Default(<String>[]) List<String> activatedChannelBadgeIds,
    VodChannelPersonalDataDto? personalData,
  }) = _VodChannelDto;

  factory VodChannelDto.fromJson(Map<String, dynamic> json) =>
      _$VodChannelDtoFromJson(json);
}

@freezed
abstract class VodChannelPersonalDataDto with _$VodChannelPersonalDataDto {
  const factory VodChannelPersonalDataDto({
    VodChannelPersonalFollowingDto? following,
    @Default(false) bool privateUserBlock,
  }) = _VodChannelPersonalDataDto;

  factory VodChannelPersonalDataDto.fromJson(Map<String, dynamic> json) =>
      _$VodChannelPersonalDataDtoFromJson(json);
}

@freezed
abstract class VodChannelPersonalFollowingDto
    with _$VodChannelPersonalFollowingDto {
  const factory VodChannelPersonalFollowingDto({
    @Default(false) bool following,
    @Default(false) bool notification,
    String? followDate,
  }) = _VodChannelPersonalFollowingDto;

  factory VodChannelPersonalFollowingDto.fromJson(Map<String, dynamic> json) =>
      _$VodChannelPersonalFollowingDtoFromJson(json);
}
