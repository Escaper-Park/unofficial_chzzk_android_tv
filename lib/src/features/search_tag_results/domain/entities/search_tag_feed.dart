import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_tag_feed.freezed.dart';

@freezed
abstract class SearchTagLivePage with _$SearchTagLivePage {
  const factory SearchTagLivePage({
    @Default(<SearchTagLive>[]) List<SearchTagLive> items,
    SearchTagLiveCursor? cursor,
    @Default(0) int size,
  }) = _SearchTagLivePage;
}

@freezed
abstract class SearchTagVideoPage with _$SearchTagVideoPage {
  const factory SearchTagVideoPage({
    @Default(<SearchTagVideo>[]) List<SearchTagVideo> items,
    SearchTagVideoCursor? cursor,
    @Default(0) int size,
  }) = _SearchTagVideoPage;
}

@freezed
abstract class SearchTagLiveCursor with _$SearchTagLiveCursor {
  const factory SearchTagLiveCursor({
    int? concurrentUserCount,
    int? liveId,
  }) = _SearchTagLiveCursor;
}

@freezed
abstract class SearchTagVideoCursor with _$SearchTagVideoCursor {
  const factory SearchTagVideoCursor({
    int? start,
  }) = _SearchTagVideoCursor;
}

@freezed
abstract class SearchTagLive with _$SearchTagLive {
  const factory SearchTagLive({
    required int liveId,
    required String title,
    String? thumbnailImageUrl,
    String? defaultThumbnailImageUrl,
    required int concurrentUserCount,
    String? openDate,
    required bool adult,
    @Default(<String>[]) List<String> tags,
    String? categoryValue,
    SearchTagChannel? channel,
    String? blindType,
    String? watchPartyTag,
    String? watchPartyType,
  }) = _SearchTagLive;
}

@freezed
abstract class SearchTagVideo with _$SearchTagVideo {
  const factory SearchTagVideo({
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
    required bool adult,
    required int livePv,
    @Default(<String>[]) List<String> tags,
    SearchTagChannel? channel,
    String? blindType,
    int? watchTimeline,
  }) = _SearchTagVideo;
}

@freezed
abstract class SearchTagChannel with _$SearchTagChannel {
  const factory SearchTagChannel({
    required String channelId,
    required String channelName,
    String? channelImageUrl,
    required bool verifiedMark,
  }) = _SearchTagChannel;
}
