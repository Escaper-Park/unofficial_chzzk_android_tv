import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_video.freezed.dart';

@freezed
abstract class CategoryVideoPage with _$CategoryVideoPage {
  const factory CategoryVideoPage({
    @Default(<CategoryVideo>[]) List<CategoryVideo> items,
    CategoryVideoCursor? cursor,
    @Default(0) int size,
  }) = _CategoryVideoPage;
}

@freezed
abstract class CategoryVideoCursor with _$CategoryVideoCursor {
  const factory CategoryVideoCursor({
    int? publishDateAt,
    int? readCount,
  }) = _CategoryVideoCursor;
}

@freezed
abstract class CategoryVideo with _$CategoryVideo {
  const factory CategoryVideo({
    required int videoNo,
    String? videoId,
    required String title,
    required String videoType,
    required String publishDate,
    String? thumbnailImageUrl,
    required int duration,
    required int readCount,
    required int publishDateAt,
    String? categoryValue,
    @Default(false) bool adult,
    @Default(0) int livePv,
    @Default(<String>[]) List<String> tags,
    CategoryVideoChannel? channel,
    String? blindType,
    int? watchTimeline,
  }) = _CategoryVideo;
}

@freezed
abstract class CategoryVideoChannel with _$CategoryVideoChannel {
  const factory CategoryVideoChannel({
    required String channelId,
    required String channelName,
    String? channelImageUrl,
    @Default(false) bool verifiedMark,
  }) = _CategoryVideoChannel;
}
