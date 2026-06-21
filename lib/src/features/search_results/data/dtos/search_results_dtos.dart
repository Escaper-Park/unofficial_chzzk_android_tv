import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_results_dtos.freezed.dart';
part 'search_results_dtos.g.dart';

@freezed
abstract class SearchChannelListDto with _$SearchChannelListDto {
  const factory SearchChannelListDto({
    @Default(<SearchChannelResultDto>[]) List<SearchChannelResultDto> data,
    SearchPageDto? page,
    @Default(0) int size,
    @Default(0) int totalCount,
    @Default(0) int totalPages,
  }) = _SearchChannelListDto;

  factory SearchChannelListDto.fromJson(Map<String, dynamic> json) =>
      _$SearchChannelListDtoFromJson(json);
}

@freezed
abstract class SearchVideoListDto with _$SearchVideoListDto {
  const factory SearchVideoListDto({
    @Default(<SearchVideoResultDto>[]) List<SearchVideoResultDto> data,
    SearchPageDto? page,
    @Default(0) int size,
    @Default(0) int totalCount,
    @Default(0) int totalPages,
  }) = _SearchVideoListDto;

  factory SearchVideoListDto.fromJson(Map<String, dynamic> json) =>
      _$SearchVideoListDtoFromJson(json);
}

@freezed
abstract class SearchLiveListDto with _$SearchLiveListDto {
  const factory SearchLiveListDto({
    @Default(<SearchLiveResultDto>[]) List<SearchLiveResultDto> data,
    SearchPageDto? page,
    @Default(0) int size,
    @Default(0) int totalCount,
    @Default(0) int totalPages,
  }) = _SearchLiveListDto;

  factory SearchLiveListDto.fromJson(Map<String, dynamic> json) =>
      _$SearchLiveListDtoFromJson(json);
}

@freezed
abstract class SearchPageDto with _$SearchPageDto {
  const factory SearchPageDto({
    SearchPageNextDto? next,
  }) = _SearchPageDto;

  factory SearchPageDto.fromJson(Map<String, dynamic> json) =>
      _$SearchPageDtoFromJson(json);
}

@freezed
abstract class SearchPageNextDto with _$SearchPageNextDto {
  const factory SearchPageNextDto({
    int? offset,
  }) = _SearchPageNextDto;

  factory SearchPageNextDto.fromJson(Map<String, dynamic> json) =>
      _$SearchPageNextDtoFromJson(json);
}

@freezed
abstract class SearchChannelResultDto with _$SearchChannelResultDto {
  const factory SearchChannelResultDto({
    SearchChannelDto? channel,
    SearchChannelContentDto? content,
  }) = _SearchChannelResultDto;

  factory SearchChannelResultDto.fromJson(Map<String, dynamic> json) =>
      _$SearchChannelResultDtoFromJson(json);
}

@freezed
abstract class SearchVideoResultDto with _$SearchVideoResultDto {
  const factory SearchVideoResultDto({
    SearchChannelDto? channel,
    SearchVideoDto? video,
  }) = _SearchVideoResultDto;

  factory SearchVideoResultDto.fromJson(Map<String, dynamic> json) =>
      _$SearchVideoResultDtoFromJson(json);
}

@freezed
abstract class SearchLiveResultDto with _$SearchLiveResultDto {
  const factory SearchLiveResultDto({
    SearchChannelDto? channel,
    SearchLiveDto? live,
  }) = _SearchLiveResultDto;

  factory SearchLiveResultDto.fromJson(Map<String, dynamic> json) =>
      _$SearchLiveResultDtoFromJson(json);
}

@freezed
abstract class SearchChannelContentDto with _$SearchChannelContentDto {
  const factory SearchChannelContentDto({
    SearchLiveDto? live,
    @Default(<SearchVideoDto>[]) List<SearchVideoDto> videos,
  }) = _SearchChannelContentDto;

  factory SearchChannelContentDto.fromJson(Map<String, dynamic> json) =>
      _$SearchChannelContentDtoFromJson(json);
}

@freezed
abstract class SearchLiveDto with _$SearchLiveDto {
  const factory SearchLiveDto({
    @Default(0) int liveId,
    @Default('') String liveTitle,
    String? liveImageUrl,
    String? defaultThumbnailImageUrl,
    @Default(0) int concurrentUserCount,
    String? openDate,
    @Default(false) bool adult,
    @Default(<String>[]) List<String> tags,
    String? chatChannelId,
    String? liveCategoryValue,
    String? watchPartyTag,
    String? watchPartyType,
    String? channelId,
    String? livePlaybackJson,
    Map<String, dynamic>? party,
  }) = _SearchLiveDto;

  factory SearchLiveDto.fromJson(Map<String, dynamic> json) =>
      _$SearchLiveDtoFromJson(json);
}

@freezed
abstract class SearchVideoDto with _$SearchVideoDto {
  const factory SearchVideoDto({
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
    SearchChannelDto? channel,
    String? blindType,
    int? watchTimeline,
  }) = _SearchVideoDto;

  factory SearchVideoDto.fromJson(Map<String, dynamic> json) =>
      _$SearchVideoDtoFromJson(json);
}

@freezed
abstract class SearchChannelDto with _$SearchChannelDto {
  const factory SearchChannelDto({
    @Default('') String channelId,
    @Default('') String channelName,
    String? channelImageUrl,
    @Default(false) bool verifiedMark,
    @Default(0) int followerCount,
    @Default('') String channelDescription,
    @Default(<String>[]) List<String> activatedChannelBadgeIds,
    @Default(false) bool openLive,
    SearchChannelPersonalDataDto? personalData,
  }) = _SearchChannelDto;

  factory SearchChannelDto.fromJson(Map<String, dynamic> json) =>
      _$SearchChannelDtoFromJson(json);
}

@freezed
abstract class SearchChannelPersonalDataDto
    with _$SearchChannelPersonalDataDto {
  const factory SearchChannelPersonalDataDto({
    SearchChannelPersonalFollowingDto? following,
    @Default(false) bool privateUserBlock,
  }) = _SearchChannelPersonalDataDto;

  factory SearchChannelPersonalDataDto.fromJson(Map<String, dynamic> json) =>
      _$SearchChannelPersonalDataDtoFromJson(json);
}

@freezed
abstract class SearchChannelPersonalFollowingDto
    with _$SearchChannelPersonalFollowingDto {
  const factory SearchChannelPersonalFollowingDto({
    @Default(false) bool following,
    @Default(false) bool notification,
    String? followDate,
  }) = _SearchChannelPersonalFollowingDto;

  factory SearchChannelPersonalFollowingDto.fromJson(
    Map<String, dynamic> json,
  ) => _$SearchChannelPersonalFollowingDtoFromJson(json);
}
