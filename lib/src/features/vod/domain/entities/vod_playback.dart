import 'package:freezed_annotation/freezed_annotation.dart';

part 'vod_playback.freezed.dart';

@freezed
abstract class VodPlayback with _$VodPlayback {
  const factory VodPlayback({
    String? masterPlaylistUrl,
    VodSeekThumbnail? seekThumbnail,
  }) = _VodPlayback;
}

enum VodSeekThumbnailIndexMode {
  ratio,
  absoluteTimestamp,
}

@freezed
abstract class VodSeekThumbnail with _$VodSeekThumbnail {
  const factory VodSeekThumbnail({
    required String source,
    @Default('sequence_pattern') String sourcePatternType,
    @Default('#') String indexPlaceholder,
    @Default(VodSeekThumbnailIndexMode.ratio)
    VodSeekThumbnailIndexMode indexMode,
    @Default(0) int totalPage,
    @Default(0) int rowCount,
    @Default(0) int columnCount,
    @Default(0) int intervalMilliseconds,
    @Default(0) int thumbnailWidth,
    @Default(0) int thumbnailHeight,
    @Default(0) int allThumbnailCount,
    int? baseTimeMilliseconds,
  }) = _VodSeekThumbnail;
}
