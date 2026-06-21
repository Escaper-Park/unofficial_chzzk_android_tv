part of 'vod_dtos.dart';

@freezed
abstract class VodPlaybackDto with _$VodPlaybackDto {
  const factory VodPlaybackDto({
    @JsonKey(name: r'$version') String? version,
    @JsonKey(name: 'MPD')
    @Default(<VodPlaybackMpdDto>[])
    List<VodPlaybackMpdDto> mpd,
  }) = _VodPlaybackDto;

  factory VodPlaybackDto.fromJson(Map<String, dynamic> json) =>
      _$VodPlaybackDtoFromJson(json);
}

@freezed
abstract class VodPlaybackMpdDto with _$VodPlaybackMpdDto {
  const factory VodPlaybackMpdDto({
    @JsonKey(name: 'Period')
    @Default(<VodPlaybackPeriodDto>[])
    List<VodPlaybackPeriodDto> period,
  }) = _VodPlaybackMpdDto;

  factory VodPlaybackMpdDto.fromJson(Map<String, dynamic> json) =>
      _$VodPlaybackMpdDtoFromJson(json);
}

@freezed
abstract class VodPlaybackPeriodDto with _$VodPlaybackPeriodDto {
  const factory VodPlaybackPeriodDto({
    @JsonKey(name: 'AdaptationSet')
    @Default(<VodPlaybackAdaptationSetDto>[])
    List<VodPlaybackAdaptationSetDto> adaptationSet,
    @JsonKey(name: 'SupplementalProperty')
    @Default(<VodPlaybackSupplementalPropertyDto>[])
    List<VodPlaybackSupplementalPropertyDto> supplementalProperty,
  }) = _VodPlaybackPeriodDto;

  factory VodPlaybackPeriodDto.fromJson(Map<String, dynamic> json) =>
      _$VodPlaybackPeriodDtoFromJson(json);
}

@freezed
abstract class VodPlaybackSupplementalPropertyDto
    with _$VodPlaybackSupplementalPropertyDto {
  const factory VodPlaybackSupplementalPropertyDto({
    @JsonKey(name: 'nvod:Thumbnails')
    @Default(<VodPlaybackThumbnailsDto>[])
    List<VodPlaybackThumbnailsDto> thumbnails,
  }) = _VodPlaybackSupplementalPropertyDto;

  factory VodPlaybackSupplementalPropertyDto.fromJson(
    Map<String, dynamic> json,
  ) => _$VodPlaybackSupplementalPropertyDtoFromJson(json);
}

@freezed
abstract class VodPlaybackThumbnailsDto with _$VodPlaybackThumbnailsDto {
  const factory VodPlaybackThumbnailsDto({
    @JsonKey(name: 'nvod:SeekingThumbnail')
    @Default(<VodPlaybackSeekingThumbnailDto>[])
    List<VodPlaybackSeekingThumbnailDto> seekingThumbnail,
  }) = _VodPlaybackThumbnailsDto;

  factory VodPlaybackThumbnailsDto.fromJson(Map<String, dynamic> json) =>
      _$VodPlaybackThumbnailsDtoFromJson(json);
}

@freezed
abstract class VodPlaybackSeekingThumbnailDto
    with _$VodPlaybackSeekingThumbnailDto {
  const factory VodPlaybackSeekingThumbnailDto({
    @JsonKey(name: '@type') String? type,
    @JsonKey(name: 'nvod:Page')
    @Default(<VodPlaybackThumbnailPageDto>[])
    List<VodPlaybackThumbnailPageDto> page,
    @JsonKey(name: 'nvod:Piece')
    @Default(<VodPlaybackThumbnailPieceDto>[])
    List<VodPlaybackThumbnailPieceDto> piece,
    @JsonKey(name: 'nvod:Source')
    @Default(<VodPlaybackThumbnailSourceDto>[])
    List<VodPlaybackThumbnailSourceDto> source,
  }) = _VodPlaybackSeekingThumbnailDto;

  factory VodPlaybackSeekingThumbnailDto.fromJson(
    Map<String, dynamic> json,
  ) => _$VodPlaybackSeekingThumbnailDtoFromJson(json);
}

@freezed
abstract class VodPlaybackThumbnailPageDto with _$VodPlaybackThumbnailPageDto {
  const factory VodPlaybackThumbnailPageDto({
    @JsonKey(name: '@total') String? total,
    @JsonKey(name: '@row') String? row,
    @JsonKey(name: '@column') String? column,
    @JsonKey(name: '@totalPieceSize') String? totalPieceSize,
  }) = _VodPlaybackThumbnailPageDto;

  factory VodPlaybackThumbnailPageDto.fromJson(Map<String, dynamic> json) =>
      _$VodPlaybackThumbnailPageDtoFromJson(json);
}

@freezed
abstract class VodPlaybackThumbnailPieceDto
    with _$VodPlaybackThumbnailPieceDto {
  const factory VodPlaybackThumbnailPieceDto({
    @JsonKey(name: '@intervalType') String? intervalType,
    @JsonKey(name: '@interval') String? interval,
    @JsonKey(name: '@width') String? width,
    @JsonKey(name: '@height') String? height,
  }) = _VodPlaybackThumbnailPieceDto;

  factory VodPlaybackThumbnailPieceDto.fromJson(Map<String, dynamic> json) =>
      _$VodPlaybackThumbnailPieceDtoFromJson(json);
}

@freezed
abstract class VodPlaybackThumbnailSourceDto
    with _$VodPlaybackThumbnailSourceDto {
  const factory VodPlaybackThumbnailSourceDto({
    @JsonKey(name: '@patternType') String? patternType,
    @JsonKey(name: '#text') String? text,
  }) = _VodPlaybackThumbnailSourceDto;

  factory VodPlaybackThumbnailSourceDto.fromJson(Map<String, dynamic> json) =>
      _$VodPlaybackThumbnailSourceDtoFromJson(json);
}

@freezed
abstract class VodPlaybackAdaptationSetDto with _$VodPlaybackAdaptationSetDto {
  const factory VodPlaybackAdaptationSetDto({
    @JsonKey(name: '@nvod:m3u') String? naverVodM3u,
  }) = _VodPlaybackAdaptationSetDto;

  factory VodPlaybackAdaptationSetDto.fromJson(Map<String, dynamic> json) =>
      _$VodPlaybackAdaptationSetDtoFromJson(json);
}
