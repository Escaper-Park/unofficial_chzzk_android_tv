import '../../../../core/network/network.dart';
import '../../../vod/domain/entities/vod_sort.dart';
import '../../domain/entities/channel_detail.dart';
import '../../domain/entities/channel_my_info.dart';
import '../../domain/entities/channel_video.dart';
import '../../domain/failures/channel_failure.dart';
import '../../domain/repositories/channel_repository.dart';
import '../data_sources/channel_api.dart';
import '../data_sources/channel_api_contract.dart';
import '../mappers/channel_mapper.dart';

final class ChzzkChannelRepository implements ChannelRepository {
  const ChzzkChannelRepository({
    required this.api,
  });

  final ChannelApi api;

  @override
  Future<ChannelDetail> getChannel({
    required String channelId,
  }) async {
    try {
      final response = await api.getChannel(channelId: channelId);
      final content = response.requireContent();

      return channelDetailFromDto(content);
    } on Object catch (_, stackTrace) {
      Error.throwWithStackTrace(const ChannelLoadFailure(), stackTrace);
    }
  }

  @override
  Future<ChannelMyInfo> getMyInfo({
    required String channelId,
  }) async {
    try {
      final response = await api.getMyInfo(channelId: channelId);
      final content = response.requireContent();

      return channelMyInfoFromDto(content);
    } on Object catch (_, stackTrace) {
      Error.throwWithStackTrace(const ChannelLoadFailure(), stackTrace);
    }
  }

  @override
  Future<ChannelVideoPage> getChannelVideos({
    required String channelId,
    VodSort? sortType,
    int? page,
    int? size,
    String? publishDateAt,
    String? videoType,
  }) async {
    try {
      final response = await api.getChannelVideos(
        channelId: channelId,
        sortType: _channelVideoSortType(sortType ?? VodSort.latest),
        page: page ?? ChannelApiDefaults.videoPage,
        size: size ?? ChannelApiDefaults.videoPageSize,
        publishDateAt: publishDateAt ?? ChannelApiDefaults.publishDateAt,
        videoType: videoType ?? ChannelApiDefaults.videoType,
      );
      final content = response.requireContent();

      return channelVideoPageFromDto(content);
    } on Object catch (_, stackTrace) {
      Error.throwWithStackTrace(const ChannelLoadFailure(), stackTrace);
    }
  }

  @override
  Future<void> followChannel({
    required String channelId,
  }) async {
    try {
      await api.followChannel(channelId: channelId);
      await api.disableChannelNotification(channelId: channelId);
    } on Object catch (_, stackTrace) {
      Error.throwWithStackTrace(const ChannelMutationFailure(), stackTrace);
    }
  }

  @override
  Future<void> unfollowChannel({
    required String channelId,
  }) async {
    try {
      await api.unfollowChannel(channelId: channelId);
    } on Object catch (_, stackTrace) {
      Error.throwWithStackTrace(const ChannelMutationFailure(), stackTrace);
    }
  }

  @override
  Future<void> enableChannelNotification({
    required String channelId,
  }) async {
    try {
      await api.enableChannelNotification(channelId: channelId);
    } on Object catch (_, stackTrace) {
      Error.throwWithStackTrace(const ChannelMutationFailure(), stackTrace);
    }
  }

  @override
  Future<void> disableChannelNotification({
    required String channelId,
  }) async {
    try {
      await api.disableChannelNotification(channelId: channelId);
    } on Object catch (_, stackTrace) {
      Error.throwWithStackTrace(const ChannelMutationFailure(), stackTrace);
    }
  }
}

String _channelVideoSortType(VodSort sort) {
  return switch (sort) {
    VodSort.popular => ChannelApiDefaults.videoSortTypePopular,
    VodSort.latest => ChannelApiDefaults.videoSortTypeLatest,
  };
}
