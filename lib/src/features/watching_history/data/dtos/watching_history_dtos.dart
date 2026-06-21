import 'package:freezed_annotation/freezed_annotation.dart';

part 'watching_history_dtos.freezed.dart';
part 'watching_history_dtos.g.dart';

@freezed
abstract class WatchingHistoryListDto with _$WatchingHistoryListDto {
  const factory WatchingHistoryListDto({
    @Default(<WatchingHistoryDto>[]) List<WatchingHistoryDto> data,
    WatchingHistoryPageDto? page,
    @Default(0) int size,
  }) = _WatchingHistoryListDto;

  factory WatchingHistoryListDto.fromJson(Map<String, dynamic> json) =>
      _$WatchingHistoryListDtoFromJson(json);
}

@freezed
abstract class WatchingHistoryPageDto with _$WatchingHistoryPageDto {
  const factory WatchingHistoryPageDto({
    WatchingHistoryPageNextDto? next,
  }) = _WatchingHistoryPageDto;

  factory WatchingHistoryPageDto.fromJson(Map<String, dynamic> json) =>
      _$WatchingHistoryPageDtoFromJson(json);
}

@freezed
abstract class WatchingHistoryPageNextDto with _$WatchingHistoryPageNextDto {
  const factory WatchingHistoryPageNextDto({
    int? lastTime,
  }) = _WatchingHistoryPageNextDto;

  factory WatchingHistoryPageNextDto.fromJson(Map<String, dynamic> json) =>
      _$WatchingHistoryPageNextDtoFromJson(json);
}

@freezed
abstract class WatchingHistoryDto with _$WatchingHistoryDto {
  const factory WatchingHistoryDto({
    @Default('') String historyNo,
    @Default('') String channelId,
    @Default(0) int videoNo,
    @Default(0) int timeline,
    @Default('') String contentType,
    String? date,
    WatchingHistoryVideoDto? videoResponse,
  }) = _WatchingHistoryDto;

  factory WatchingHistoryDto.fromJson(Map<String, dynamic> json) =>
      _$WatchingHistoryDtoFromJson(json);
}

@freezed
abstract class WatchingHistoryVideoDto with _$WatchingHistoryVideoDto {
  const factory WatchingHistoryVideoDto({
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
    WatchingHistoryChannelDto? channel,
    String? blindType,
    int? watchTimeline,
  }) = _WatchingHistoryVideoDto;

  factory WatchingHistoryVideoDto.fromJson(Map<String, dynamic> json) =>
      _$WatchingHistoryVideoDtoFromJson(json);
}

@freezed
abstract class WatchingHistoryChannelDto with _$WatchingHistoryChannelDto {
  const factory WatchingHistoryChannelDto({
    @Default('') String channelId,
    @Default('') String channelName,
    String? channelImageUrl,
    @Default(false) bool verifiedMark,
    @Default(<String>[]) List<String> activatedChannelBadgeIds,
    WatchingHistoryChannelPersonalDataDto? personalData,
  }) = _WatchingHistoryChannelDto;

  factory WatchingHistoryChannelDto.fromJson(Map<String, dynamic> json) =>
      _$WatchingHistoryChannelDtoFromJson(json);
}

@freezed
abstract class WatchingHistoryChannelPersonalDataDto
    with _$WatchingHistoryChannelPersonalDataDto {
  const factory WatchingHistoryChannelPersonalDataDto({
    WatchingHistoryChannelPersonalFollowingDto? following,
    @Default(false) bool privateUserBlock,
  }) = _WatchingHistoryChannelPersonalDataDto;

  factory WatchingHistoryChannelPersonalDataDto.fromJson(
    Map<String, dynamic> json,
  ) => _$WatchingHistoryChannelPersonalDataDtoFromJson(json);
}

@freezed
abstract class WatchingHistoryChannelPersonalFollowingDto
    with _$WatchingHistoryChannelPersonalFollowingDto {
  const factory WatchingHistoryChannelPersonalFollowingDto({
    @Default(false) bool following,
    @Default(false) bool notification,
    String? followDate,
  }) = _WatchingHistoryChannelPersonalFollowingDto;

  factory WatchingHistoryChannelPersonalFollowingDto.fromJson(
    Map<String, dynamic> json,
  ) => _$WatchingHistoryChannelPersonalFollowingDtoFromJson(json);
}
