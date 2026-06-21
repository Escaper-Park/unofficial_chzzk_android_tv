part of 'category_dtos.dart';

@freezed
abstract class CategoryLiveListDto with _$CategoryLiveListDto {
  const factory CategoryLiveListDto({
    @Default(<CategoryLiveDto>[]) List<CategoryLiveDto> data,
    CategoryLivePageDto? page,
    @Default(0) int size,
  }) = _CategoryLiveListDto;

  factory CategoryLiveListDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryLiveListDtoFromJson(json);
}

@freezed
abstract class CategoryLivePageDto with _$CategoryLivePageDto {
  const factory CategoryLivePageDto({
    CategoryLivePageNextDto? next,
  }) = _CategoryLivePageDto;

  factory CategoryLivePageDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryLivePageDtoFromJson(json);
}

@freezed
abstract class CategoryLivePageNextDto with _$CategoryLivePageNextDto {
  const factory CategoryLivePageNextDto({
    int? concurrentUserCount,
    int? liveId,
  }) = _CategoryLivePageNextDto;

  factory CategoryLivePageNextDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryLivePageNextDtoFromJson(json);
}

@freezed
abstract class CategoryLiveDto with _$CategoryLiveDto {
  const factory CategoryLiveDto({
    @Default(0) int liveId,
    @Default('') String liveTitle,
    String? liveImageUrl,
    String? defaultThumbnailImageUrl,
    @Default(0) int concurrentUserCount,
    String? openDate,
    @Default(false) bool adult,
    @Default(<String>[]) List<String> tags,
    String? liveCategoryValue,
    CategoryChannelDto? channel,
    String? blindType,
    String? watchPartyTag,
    String? watchPartyType,
    Map<String, dynamic>? party,
  }) = _CategoryLiveDto;

  factory CategoryLiveDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryLiveDtoFromJson(json);
}

@freezed
abstract class CategoryVideoListDto with _$CategoryVideoListDto {
  const factory CategoryVideoListDto({
    @Default(<CategoryVideoDto>[]) List<CategoryVideoDto> data,
    CategoryVideoPageDto? page,
    @Default(0) int size,
  }) = _CategoryVideoListDto;

  factory CategoryVideoListDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryVideoListDtoFromJson(json);
}

@freezed
abstract class CategoryVideoPageDto with _$CategoryVideoPageDto {
  const factory CategoryVideoPageDto({
    CategoryVideoPageNextDto? next,
  }) = _CategoryVideoPageDto;

  factory CategoryVideoPageDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryVideoPageDtoFromJson(json);
}

@freezed
abstract class CategoryVideoPageNextDto with _$CategoryVideoPageNextDto {
  const factory CategoryVideoPageNextDto({
    int? publishDateAt,
    int? readCount,
  }) = _CategoryVideoPageNextDto;

  factory CategoryVideoPageNextDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryVideoPageNextDtoFromJson(json);
}

@freezed
abstract class CategoryVideoDto with _$CategoryVideoDto {
  const factory CategoryVideoDto({
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
    CategoryChannelDto? channel,
    String? blindType,
    int? watchTimeline,
  }) = _CategoryVideoDto;

  factory CategoryVideoDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryVideoDtoFromJson(json);
}

@freezed
abstract class CategoryChannelDto with _$CategoryChannelDto {
  const factory CategoryChannelDto({
    @Default('') String channelId,
    @Default('') String channelName,
    String? channelImageUrl,
    @Default(false) bool verifiedMark,
    @Default(<String>[]) List<String> activatedChannelBadgeIds,
    CategoryChannelPersonalDataDto? personalData,
  }) = _CategoryChannelDto;

  factory CategoryChannelDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryChannelDtoFromJson(json);
}

@freezed
abstract class CategoryChannelPersonalDataDto
    with _$CategoryChannelPersonalDataDto {
  const factory CategoryChannelPersonalDataDto({
    CategoryChannelPersonalFollowingDto? following,
    @Default(false) bool privateUserBlock,
  }) = _CategoryChannelPersonalDataDto;

  factory CategoryChannelPersonalDataDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryChannelPersonalDataDtoFromJson(json);
}

@freezed
abstract class CategoryChannelPersonalFollowingDto
    with _$CategoryChannelPersonalFollowingDto {
  const factory CategoryChannelPersonalFollowingDto({
    @Default(false) bool following,
    @Default(false) bool notification,
    String? followDate,
  }) = _CategoryChannelPersonalFollowingDto;

  factory CategoryChannelPersonalFollowingDto.fromJson(
    Map<String, dynamic> json,
  ) => _$CategoryChannelPersonalFollowingDtoFromJson(json);
}
