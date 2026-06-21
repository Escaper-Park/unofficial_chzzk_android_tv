import 'package:freezed_annotation/freezed_annotation.dart';

part 'channel_video.freezed.dart';

@freezed
abstract class ChannelVideoPage with _$ChannelVideoPage {
  const factory ChannelVideoPage({
    @Default(<ChannelVideo>[]) List<ChannelVideo> items,
    @Default(0) int page,
    @Default(0) int size,
    @Default(0) int totalCount,
    @Default(0) int totalPages,
  }) = _ChannelVideoPage;
}

@freezed
abstract class ChannelVideo with _$ChannelVideo {
  const factory ChannelVideo({
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
  }) = _ChannelVideo;
}
