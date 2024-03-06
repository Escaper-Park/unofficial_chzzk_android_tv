import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../auth/controller/auth_controller.dart';
import '../../channel/model/channel.dart';
import '../../channel/repository/channel_repository.dart';
import '../../following/model/following.dart';
import '../../following/repository/following_repository.dart';
import '../../settings/controller/settings_controller.dart';
import '../model/live.dart';
import '../repository/live_repository.dart';

part 'live_controller.g.dart';

@riverpod
class FollowingLiveController extends _$FollowingLiveController {
  Options? _options;

  @override
  FutureOr<List<LiveDetail>?> build() async {
    final auth = await ref.watch(authControllerProvider.future);

    _options = auth?.getOptions();

    return _options == null ? null : await fetchFollowingLives();
  }

  Future<List<LiveDetail>?> fetchFollowingLives() async {
    if (_options != null) {
      final List<Following>? followingChannels = await ref
          .watch(followingRepositoryProvider)
          .getFollowingLiveChannels(options: _options);

      if (followingChannels != null) {
        List<LiveDetail> liveDetails = [];

        for (Following following in followingChannels) {
          final LiveDetail? liveDetail =
              await ref.watch(liveRepositoryProvider).getLiveDetail(
                    channelId: following.channel.channelId,
                    options: _options,
                  );

          if (liveDetail != null) liveDetails.add(liveDetail);
        }

        return liveDetails;
      }
    }

    return null;
  }
}

// Home Popular Controller
@riverpod
class PopularLiveController extends _$PopularLiveController {
  Options? _options;
  PopularChannelPage? _next;

  @override
  FutureOr<List<LiveDetail>?> build() async {
    final auth = await ref.watch(authControllerProvider.future);

    _options = auth?.getOptions();

    final int size = ref
        .read(settingsControllerProvider.notifier)
        .getPopularChannelsLength();

    return await _initFetch(size: size);
  }

  Future<List<LiveDetail>?> _initFetch({required int size}) async {
    final PopularChannelResponse? channelResponse =
        await ref.watch(channelRepositoryProvider).getPopularChannelResponse(
              options: _options,
              concurrentUserCount: null,
              liveId: null,
              size: size,
            );

    _next = channelResponse?.page;

    if (channelResponse?.channels != null) {
      List<LiveDetail> liveDetails = [];

      for (Channel channel in channelResponse!.channels!) {
        final LiveDetail? liveDetail =
            await ref.watch(liveRepositoryProvider).getLiveDetail(
                  channelId: channel.channelId,
                  options: _options,
                );

        if (liveDetail != null) liveDetails.add(liveDetail);
      }

      return liveDetails;
    }

    return null;
  }

  Future<void> fetchMore() async {
    if (_next != null) {
      final prev = state.value;

      state = await AsyncValue.guard(() async {
        final response = await ref
            .watch(channelRepositoryProvider)
            .getPopularChannelResponse(
              options: _options,
              concurrentUserCount: _next?.concurrentUserCount,
              liveId: _next?.liveId,
            );

        _next = response?.page;

        if (response?.channels == null || _next == null) {
          return [...prev!];
        } else {
          List<LiveDetail> liveDetails = [];

          for (Channel channel in response!.channels!) {
            final LiveDetail? liveDetail =
                await ref.watch(liveRepositoryProvider).getLiveDetail(
                      channelId: channel.channelId,
                      options: _options,
                    );

            if (liveDetail != null) liveDetails.add(liveDetail);
          }

          return [...prev!, ...liveDetails];
        }
      });
    }
  }
}
