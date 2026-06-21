import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_results.freezed.dart';

@freezed
abstract class SearchChannelResultsPage with _$SearchChannelResultsPage {
  const factory SearchChannelResultsPage({
    @Default(<SearchChannelResult>[]) List<SearchChannelResult> items,
    SearchCursor? cursor,
    @Default(0) int size,
    @Default(0) int totalCount,
    @Default(0) int totalPages,
  }) = _SearchChannelResultsPage;
}

@freezed
abstract class SearchVideoResultsPage with _$SearchVideoResultsPage {
  const factory SearchVideoResultsPage({
    @Default(<SearchVideoResult>[]) List<SearchVideoResult> items,
    SearchCursor? cursor,
    @Default(0) int size,
    @Default(0) int totalCount,
    @Default(0) int totalPages,
  }) = _SearchVideoResultsPage;
}

@freezed
abstract class SearchLiveResultsPage with _$SearchLiveResultsPage {
  const factory SearchLiveResultsPage({
    @Default(<SearchLiveResult>[]) List<SearchLiveResult> items,
    SearchCursor? cursor,
    @Default(0) int size,
    @Default(0) int totalCount,
    @Default(0) int totalPages,
  }) = _SearchLiveResultsPage;
}

@freezed
abstract class SearchCursor with _$SearchCursor {
  const factory SearchCursor({
    int? offset,
  }) = _SearchCursor;
}

@freezed
abstract class SearchChannelResult with _$SearchChannelResult {
  const factory SearchChannelResult({
    SearchChannel? channel,
    SearchChannelContent? content,
  }) = _SearchChannelResult;
}

@freezed
abstract class SearchVideoResult with _$SearchVideoResult {
  const factory SearchVideoResult({
    SearchChannel? channel,
    SearchVideo? video,
  }) = _SearchVideoResult;
}

@freezed
abstract class SearchLiveResult with _$SearchLiveResult {
  const factory SearchLiveResult({
    SearchChannel? channel,
    SearchLive? live,
  }) = _SearchLiveResult;
}

@freezed
abstract class SearchChannelContent with _$SearchChannelContent {
  const factory SearchChannelContent({
    SearchLive? live,
    @Default(<SearchVideo>[]) List<SearchVideo> videos,
  }) = _SearchChannelContent;
}

@freezed
abstract class SearchChannel with _$SearchChannel {
  const factory SearchChannel({
    required String channelId,
    required String channelName,
    String? channelImageUrl,
    required bool verifiedMark,
    required int followerCount,
    required String description,
    required bool openLive,
  }) = _SearchChannel;
}

@freezed
abstract class SearchLive with _$SearchLive {
  const factory SearchLive({
    required int liveId,
    required String title,
    String? thumbnailImageUrl,
    String? defaultThumbnailImageUrl,
    required int concurrentUserCount,
    String? openDate,
    required bool adult,
    @Default(<String>[]) List<String> tags,
    String? chatChannelId,
    String? categoryValue,
    String? watchPartyTag,
    String? watchPartyType,
    String? channelId,
  }) = _SearchLive;
}

@freezed
abstract class SearchVideo with _$SearchVideo {
  const factory SearchVideo({
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
    String? blindType,
    int? watchTimeline,
  }) = _SearchVideo;
}
