import 'package:freezed_annotation/freezed_annotation.dart';

import '../../channel/model/channel.dart';

part 'all_lives.freezed.dart';
part 'all_lives.g.dart';

@freezed
class AllLivesChannelPage with _$AllLivesChannelPage {
  factory AllLivesChannelPage({
    required int? concurrentUserCount,
    required int? liveId,
  }) = _AllLivesChannelPage;

  factory AllLivesChannelPage.fromJson(Map<String, dynamic> json) =>
      _$AllLivesChannelPageFromJson(json);
}

@freezed
class AllLivesChannelResponse with _$AllLivesChannelResponse {
  const factory AllLivesChannelResponse({
    required List<Channel>? channels,
    required AllLivesChannelPage? page,
  }) = _AllLivesChannelResponse;
}
