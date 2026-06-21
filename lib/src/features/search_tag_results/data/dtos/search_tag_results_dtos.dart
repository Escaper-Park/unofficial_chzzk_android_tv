import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_tag_results_dtos.freezed.dart';
part 'search_tag_results_dtos.g.dart';

@freezed
abstract class SearchTagLiveListDto with _$SearchTagLiveListDto {
  const factory SearchTagLiveListDto({
    @Default(<SearchTagLiveDto>[]) List<SearchTagLiveDto> data,
    SearchTagLivePageDto? page,
    @Default(0) int size,
  }) = _SearchTagLiveListDto;

  factory SearchTagLiveListDto.fromJson(Map<String, dynamic> json) =>
      _$SearchTagLiveListDtoFromJson(json);
}

@freezed
abstract class SearchTagLivePageDto with _$SearchTagLivePageDto {
  const factory SearchTagLivePageDto({
    SearchTagLivePageNextDto? next,
  }) = _SearchTagLivePageDto;

  factory SearchTagLivePageDto.fromJson(Map<String, dynamic> json) =>
      _$SearchTagLivePageDtoFromJson(json);
}

@freezed
abstract class SearchTagLivePageNextDto with _$SearchTagLivePageNextDto {
  const factory SearchTagLivePageNextDto({
    int? concurrentUserCount,
    int? liveId,
  }) = _SearchTagLivePageNextDto;

  factory SearchTagLivePageNextDto.fromJson(Map<String, dynamic> json) =>
      _$SearchTagLivePageNextDtoFromJson(json);
}

@freezed
abstract class SearchTagVideoListDto with _$SearchTagVideoListDto {
  const factory SearchTagVideoListDto({
    @Default(<SearchTagVideoDto>[]) List<SearchTagVideoDto> data,
    SearchTagVideoPageDto? page,
    @Default(0) int size,
  }) = _SearchTagVideoListDto;

  factory SearchTagVideoListDto.fromJson(Map<String, dynamic> json) =>
      _$SearchTagVideoListDtoFromJson(json);
}

@freezed
abstract class SearchTagVideoPageDto with _$SearchTagVideoPageDto {
  const factory SearchTagVideoPageDto({
    SearchTagVideoPageNextDto? next,
  }) = _SearchTagVideoPageDto;

  factory SearchTagVideoPageDto.fromJson(Map<String, dynamic> json) =>
      _$SearchTagVideoPageDtoFromJson(json);
}

@freezed
abstract class SearchTagVideoPageNextDto with _$SearchTagVideoPageNextDto {
  const factory SearchTagVideoPageNextDto({
    int? start,
  }) = _SearchTagVideoPageNextDto;

  factory SearchTagVideoPageNextDto.fromJson(Map<String, dynamic> json) =>
      _$SearchTagVideoPageNextDtoFromJson(json);
}

@freezed
abstract class SearchTagLiveDto with _$SearchTagLiveDto {
  const factory SearchTagLiveDto({
    @Default(0) int liveId,
    @Default('') String liveTitle,
    String? liveImageUrl,
    String? defaultThumbnailImageUrl,
    @Default(0) int concurrentUserCount,
    String? openDate,
    @Default(false) bool adult,
    @Default(<String>[]) List<String> tags,
    String? liveCategoryValue,
    SearchTagChannelDto? channel,
    String? blindType,
    String? watchPartyTag,
    String? watchPartyType,
    Map<String, dynamic>? party,
  }) = _SearchTagLiveDto;

  factory SearchTagLiveDto.fromJson(Map<String, dynamic> json) =>
      _$SearchTagLiveDtoFromJson(json);
}

@freezed
abstract class SearchTagVideoDto with _$SearchTagVideoDto {
  const factory SearchTagVideoDto({
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
    SearchTagChannelDto? channel,
    String? blindType,
    int? watchTimeline,
  }) = _SearchTagVideoDto;

  factory SearchTagVideoDto.fromJson(Map<String, dynamic> json) =>
      _$SearchTagVideoDtoFromJson(json);
}

@freezed
abstract class SearchTagChannelDto with _$SearchTagChannelDto {
  const factory SearchTagChannelDto({
    @Default('') String channelId,
    @Default('') String channelName,
    String? channelImageUrl,
    @Default(false) bool verifiedMark,
    @Default(<String>[]) List<String> activatedChannelBadgeIds,
    SearchTagChannelPersonalDataDto? personalData,
  }) = _SearchTagChannelDto;

  factory SearchTagChannelDto.fromJson(Map<String, dynamic> json) =>
      _$SearchTagChannelDtoFromJson(json);
}

@freezed
abstract class SearchTagChannelPersonalDataDto
    with _$SearchTagChannelPersonalDataDto {
  const factory SearchTagChannelPersonalDataDto({
    SearchTagChannelPersonalFollowingDto? following,
    @Default(false) bool privateUserBlock,
  }) = _SearchTagChannelPersonalDataDto;

  factory SearchTagChannelPersonalDataDto.fromJson(
    Map<String, dynamic> json,
  ) => _$SearchTagChannelPersonalDataDtoFromJson(json);
}

@freezed
abstract class SearchTagChannelPersonalFollowingDto
    with _$SearchTagChannelPersonalFollowingDto {
  const factory SearchTagChannelPersonalFollowingDto({
    @Default(false) bool following,
    @Default(false) bool notification,
    String? followDate,
  }) = _SearchTagChannelPersonalFollowingDto;

  factory SearchTagChannelPersonalFollowingDto.fromJson(
    Map<String, dynamic> json,
  ) => _$SearchTagChannelPersonalFollowingDtoFromJson(json);
}
