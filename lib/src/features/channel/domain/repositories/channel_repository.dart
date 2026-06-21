import '../../../vod/domain/entities/vod_sort.dart';
import '../entities/channel_detail.dart';
import '../entities/channel_my_info.dart';
import '../entities/channel_video.dart';

abstract interface class ChannelRepository {
  Future<ChannelDetail> getChannel({
    required String channelId,
  });

  Future<ChannelMyInfo> getMyInfo({
    required String channelId,
  });

  Future<ChannelVideoPage> getChannelVideos({
    required String channelId,
    VodSort? sortType,
    int? page,
    int? size,
    String? publishDateAt,
    String? videoType,
  });

  Future<void> followChannel({
    required String channelId,
  });

  Future<void> unfollowChannel({
    required String channelId,
  });

  Future<void> enableChannelNotification({
    required String channelId,
  });

  Future<void> disableChannelNotification({
    required String channelId,
  });
}
