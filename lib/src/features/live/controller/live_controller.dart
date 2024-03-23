import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../auth/controller/auth_controller.dart';
import '../../channel/model/channel.dart';
import '../../following/model/following.dart';
import '../../following/repository/following_repository.dart';
import '../../settings/controller/settings_controller.dart';
import '../model/all_lives.dart';
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

@riverpod
class PopularLivesController extends _$PopularLivesController {
  Options? _options;
  AllLivesChannelPage? _next;

  @override
  FutureOr<List<LiveDetail>?> build() async {
    final auth = await ref.watch(authControllerProvider.future);

    _options = auth?.getOptions();

    final int size = ref
        .read(settingsControllerProvider.notifier)
        .getPopularChannelsLength();

    return _initFetch(size: size, sortType: LiveSortType.popular);
  }

  Future<List<LiveDetail>?> _initFetch({
    required int size,
    required LiveSortType sortType,
  }) async {
    final AllLivesChannelResponse? channelResponse =
        await ref.watch(liveRepositoryProvider).getAllChannelsResponse(
              options: _options,
              concurrentUserCount: null,
              liveId: null,
              size: size,
              sortType: sortType,
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
        final response =
            await ref.watch(liveRepositoryProvider).getAllChannelsResponse(
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

@riverpod
class AllLivesController extends _$AllLivesController {
  Options? _options;
  AllLivesChannelPage? _next;

  @override
  FutureOr<List<LiveDetail>?> build() async {
    final auth = await ref.watch(authControllerProvider.future);

    _options = auth?.getOptions();

    final int size = ref
        .read(settingsControllerProvider.notifier)
        .getPopularChannelsLength();

    final sortType = ref.watch(currentLiveSortTypeProvider);

    return await _initFetch(
      size: size,
      sortType: sortType,
    );
  }

  Future<List<LiveDetail>?> _initFetch({
    required int size,
    required LiveSortType sortType,
  }) async {
    final AllLivesChannelResponse? channelResponse =
        await ref.watch(liveRepositoryProvider).getAllChannelsResponse(
              options: _options,
              concurrentUserCount: null,
              liveId: null,
              size: size,
              sortType: sortType,
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

      // Show loading state in all lives page
      ref.read(allLivesLoadingStateProvider.notifier).setState(true);

      state = await AsyncValue.guard(() async {
        final response =
            await ref.watch(liveRepositoryProvider).getAllChannelsResponse(
                  options: _options,
                  concurrentUserCount: _next?.concurrentUserCount,
                  liveId: _next?.liveId,
                );

        _next = response?.page;

        if (response?.channels == null || _next == null) {
          // Show loading state in all lives page
          ref.read(allLivesLoadingStateProvider.notifier).setState(false);

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

          // Show loading state in all lives page
          ref.read(allLivesLoadingStateProvider.notifier).setState(false);

          return [...prev!, ...liveDetails];
        }
      });
    }
  }
}

@riverpod
class AllLivesLoadingState extends _$AllLivesLoadingState {
  @override
  bool build() {
    return false;
  }

  void setState(bool value) {
    state = value;
  }
}

@riverpod
class CurrentLiveSortType extends _$CurrentLiveSortType {
  @override
  LiveSortType build() {
    return LiveSortType.popular;
  }

  void setState(LiveSortType sortType) {
    if (state != sortType) state = sortType;
  }
}
