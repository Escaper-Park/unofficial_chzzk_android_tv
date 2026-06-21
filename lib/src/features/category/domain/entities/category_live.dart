import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_live.freezed.dart';

@freezed
abstract class CategoryLivePage with _$CategoryLivePage {
  const factory CategoryLivePage({
    @Default(<CategoryLive>[]) List<CategoryLive> items,
    CategoryLiveCursor? cursor,
    @Default(0) int size,
  }) = _CategoryLivePage;
}

@freezed
abstract class CategoryLiveCursor with _$CategoryLiveCursor {
  const factory CategoryLiveCursor({
    int? concurrentUserCount,
    int? liveId,
  }) = _CategoryLiveCursor;
}

@freezed
abstract class CategoryLive with _$CategoryLive {
  const factory CategoryLive({
    required int liveId,
    required String title,
    String? thumbnailImageUrl,
    String? defaultThumbnailImageUrl,
    required int concurrentUserCount,
    String? openDate,
    @Default(false) bool adult,
    @Default(<String>[]) List<String> tags,
    String? categoryValue,
    CategoryLiveChannel? channel,
    String? blindType,
    String? watchPartyTag,
    String? watchPartyType,
  }) = _CategoryLive;
}

@freezed
abstract class CategoryLiveChannel with _$CategoryLiveChannel {
  const factory CategoryLiveChannel({
    required String channelId,
    required String channelName,
    String? channelImageUrl,
    @Default(false) bool verifiedMark,
  }) = _CategoryLiveChannel;
}
