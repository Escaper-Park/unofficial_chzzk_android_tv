import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../auth/controller/auth_controller.dart';
import '../../live/model/live.dart';
import '../../live/repository/live_repository.dart';
import '../../vod/model/vod.dart';
import '../../vod/repository/vod_repository.dart';
import '../model/channel.dart';
import '../repository/channel_repository.dart';

part 'channel_controller.g.dart';

@riverpod
class ChannelController extends _$ChannelController {
  Options? _options;

  @override
  FutureOr<Channel?> build() async {
    final auth = await ref.watch(authControllerProvider.future);

    _options = auth?.getOptions();

    return null;
  }

  // Following.channel doesn't have followerCount so have to fecth channel data.
  Future<void> selectChannel(String channelId) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final channel = ref.watch(channelRepositoryProvider).getChannel(
            channelId: channelId,
            options: _options,
          );

      return channel;
    });
  }
}

@riverpod
class ChannelLiveController extends _$ChannelLiveController {
  Options? _options;

  @override
  FutureOr<LiveDetail?> build({
    required String channelId,
  }) async {
    final auth = await ref.watch(authControllerProvider.future);

    _options = auth?.getOptions();

    return await fetchLiveDetail();
  }

  Future<LiveDetail?> fetchLiveDetail() async {
    final liveDetail = await ref.watch(liveRepositoryProvider).getLiveDetail(
          channelId: channelId,
          options: _options,
        );

    return liveDetail;
  }
}

@riverpod
class ChannelVodController extends _$ChannelVodController {
  Options? _options;

  @override
  FutureOr<List<Vod>?> build({
    required String channelId,
  }) async {
    final auth = await ref.watch(authControllerProvider.future);

    _options = auth?.getOptions();

    return await fetchChannelVodList();
  }

  Future<List<Vod>?> fetchChannelVodList() async {
    return await ref.watch(vodRepositoryProvider).getChannelVodList(
          channelId: channelId,
          options: _options,
        );
  }

  Future<String?> getVodPath({required int videoNo}) async {
    return await ref.watch(vodRepositoryProvider).getVodPath(
          videoNo: videoNo,
          options: _options,
        );
  }
}
