import 'package:freezed_annotation/freezed_annotation.dart';

import 'channel_detail.dart';

part 'channel_my_info.freezed.dart';

@freezed
abstract class ChannelMyInfo with _$ChannelMyInfo {
  const factory ChannelMyInfo({
    required String channelId,
    ChannelPersonalFollowing? following,
    required bool cheatKey,
    required bool naverMembership,
  }) = _ChannelMyInfo;
}
