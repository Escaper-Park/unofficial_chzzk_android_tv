import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:unofficial_chzzk_android_tv/src/features/following/repository/following_repository.dart';

import '../../../constants/api.dart';
import '../../auth/model/auth.dart';
import '../../auth/repository/auth_repository.dart';
import '../../channel/model/channel.dart';
import '../../following/model/following.dart';
import '../../live/model/live.dart';
import '../../live/repository/live_repository.dart';
import '../../popular/model/popular_channel.dart';
import '../../popular/repository/popular_repository.dart';
import '../../recommendation/model/recommendation.dart';
import '../../recommendation/repository/recommendation_repository.dart';
import '../../search/repository/search_repository.dart';
import '../../user/user.dart';
import '../../video/model/video.dart';
import '../../video/repository/video_repository.dart';

part 'client_repository.g.dart';

@riverpod
class ClientRepository extends _$ClientRepository {
  @override
  FutureOr<Auth?> build() async {
    return await ref.watch(authRepositoryProvider).getAuthWithCookies();
  }

  final Dio _dio = Dio();

  Future<User?> getUser() async {
    final Auth? auth = state.value;

    if (auth != null) {
      Options? options = getOptions();

      final response = await _dio.get(
        APIUrl.user,
        options: options,
      );

      return User.fromJson(response.data['content']);
    } else {
      return null;
    }
  }

  Options? getOptions() {
    if (state.value == null) {
      return null;
    } else {
      final Auth auth = state.value!;
      Set headers = {};

      headers = {'NID_AUT=${auth.nidAuth}; NID_SES=${auth.nidSession}'};
      return Options(
        headers: {
          'Cookie': headers,
        },
      );
    }
  }

  Future<LiveDetail?> getLiveDetailFromChannelId(String channelId) async {
    final Options? options = getOptions();

    return await ref.watch(liveRepositoryProvider).getLiveDetail(
          channelId,
          options,
        );
  }

  Future<String?> getVodPath(int videoNo) async {
    final Options? options = getOptions();

    String? vodPath =
        await ref.watch(videoRepositoryProvider).fetchVodPath(videoNo, options);

    return vodPath;
  }

  Future<List<BaseVideo>?> getChannelVideoList(String channelId) async {
    final Options? options = getOptions();

    return await ref.watch(videoRepositoryProvider).fetchChannelVideoList(
          channelId,
          options,
        );
  }

  Future<List<Following>?> getFollowingChannels() async {
    final Options? options = getOptions();

    return await ref
        .watch(followingRepositoryProvider)
        .fetchFollowingChannels(options);
  }

  Future<List<LiveDetail>?> getFollowingLiveChannels() async {
    final Options? options = getOptions();

    List<Following>? channels = await ref
        .watch(followingRepositoryProvider)
        .fetchFollowingLiveChannels(options);

    if (channels != null) {
      List<LiveDetail> liveDetails = [];

      for (Following channel in channels) {
        LiveDetail? liveDetail =
            await ref.watch(liveRepositoryProvider).getLiveDetail(
                  channel.channelId,
                  options,
                );

        if (liveDetail != null) {
          liveDetails.add(liveDetail);
        }
      }

      return liveDetails;
    }
    return null;
  }

  Future<List<LiveDetail>?> getRecommendedLiveDetails() async {
    final Options? options = getOptions();

    List<Recommendation>? channels = await ref
        .watch(recommendationRepositoryProvider)
        .fetchRecommendList(options);

    if (channels != null) {
      List<LiveDetail> liveDetails = [];

      for (Recommendation channel in channels) {
        LiveDetail? liveDetail =
            await ref.watch(liveRepositoryProvider).getLiveDetail(
                  channel.channelId,
                  options,
                );

        if (liveDetail != null) {
          liveDetails.add(liveDetail);
        }
      }

      return liveDetails;
    }
    return null;
  }

  Future<List<PopularChannel>?> getPopularChannels() async {
    final Options? options = getOptions();

    return await ref
        .watch(popularRepositoryProvider)
        .fetchPopularChannels(options);
  }

  Future<List<LiveDetail>?> getPopularChannelsLiveDetails() async {
    final Options? options = getOptions();

    final channels = await getPopularChannels();

    if (channels != null) {
      List<LiveDetail> liveDetails = [];

      for (PopularChannel channel in channels) {
        LiveDetail? liveDetail =
            await ref.watch(liveRepositoryProvider).getLiveDetail(
                  channel.channel.channelId,
                  options,
                );

        if (liveDetail != null) {
          liveDetails.add(liveDetail);
        }
      }

      return liveDetails;
    }

    return null;
  }

  Future<List<Channel>?> search(String keyword) async {
    final Options? options = getOptions();

    return await ref.watch(searchRepositoryProvider).search(keyword, options);
  }

  Future<void> login(Auth? auth) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      await Future.delayed(const Duration(seconds: 1));

      return auth;
    });
  }

  Future<void> logOut() async {
    await ref.watch(authRepositoryProvider).deleteCookies();

    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      await Future.delayed(const Duration(seconds: 1));

      return null;
    });
  }
}
