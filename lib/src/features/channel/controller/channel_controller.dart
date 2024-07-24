import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/dio/dio_client.dart';
import '../../live/model/live.dart';
import '../../live/repository/live_repository.dart';
import '../../vod/model/vod.dart';
import '../../vod/repository/vod_repository.dart';
import '../model/channel.dart';
import '../repository/channel_repository.dart';

part 'channel_controller.g.dart';

/// Channel screen's current selected channel.
@riverpod
class ChannelController extends _$ChannelController {
  late ChannelRepository _repository;

  @override
  FutureOr<Channel?> build() async {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = ChannelRepository(dio);

    return null;
  }

  /// Select channel to show details at the [ChannelScreen].
  Future<void> selectChannel(String channelId) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final channel = _repository.getChannel(channelId: channelId);

      return channel;
    });
  }

  /// Follow channel and get success or failure results.
  Future<bool> follow(String channelId) async {
    final response = await _repository
        .follow(channelId: channelId)
        .then((_) => true)
        .catchError((_) => false);

    return response;
  }

  /// Unfollow channel and get success or failure results.
  Future<bool> unFollow(String channelId) async {
    final response = await _repository
        .unFollow(channelId: channelId)
        .then((_) => true)
        .catchError((_) => false);

    return response;
  }
}

@riverpod
class ChannelLiveController extends _$ChannelLiveController {
  late LiveRepository _repository;

  /// Use [LiveDetail] instead of [LiveInfo] because can't get
  /// [LiveInfo] directly for a specific channel.
  @override
  FutureOr<LiveDetail?> build({required String channelId}) async {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = LiveRepository(dio);

    return await fetchLiveDetail();
  }

  Future<LiveDetail?> fetchLiveDetail() async {
    final liveDetail = await _repository.getLiveDetail(channelId: channelId);

    return liveDetail;
  }
}

@riverpod
class ChannelVodController extends _$ChannelVodController {
  late VodRepository _repository;

  // For infinite scrolling
  int _next = 0;
  int _totalPages = 0;

  @override
  FutureOr<List<Vod>?> build({
    required String channelId,
    required VodSortType sortType,
  }) {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = VodRepository(dio);

    return _initFetch();
  }

  Future<List<Vod>?> _initFetch({
    String pagingType = 'PAGE',
    int page = 0,
    int size = 18,
  }) async {
    final channelVodResponse = await _repository.getChannelVods(
      channelId: channelId,
      sortType: sortType.value,
      pagingType: pagingType,
      page: page,
      size: size,
    );

    if (channelVodResponse != null) {
      _totalPages = channelVodResponse.totalPages;
      _next = 1;
    }

    return channelVodResponse?.data;
  }

  Future<void> fetchMore() async {
    if (_next < _totalPages) {
      ref.read(channelFetchMoreLoadingStateProvider.notifier).setState(true);
      final prev = state.value;

      state = await AsyncValue.guard(() async {
        final channelVodResponse = await _repository.getChannelVods(
          channelId: channelId,
          sortType: sortType.value,
          pagingType: 'PAGE',
          page: _next,
          size: 18,
        );

        _next += 1;

        if (channelVodResponse?.data == null ||
            channelVodResponse!.data.isEmpty) {
          return [...prev!];
        }

        ref.read(channelFetchMoreLoadingStateProvider.notifier).setState(false);
        return [...prev!, ...channelVodResponse.data];
      });
    }
  }
}

@riverpod
class ChannelFetchMoreLoadingState extends _$ChannelFetchMoreLoadingState {
  /// To show 'Loading...' msg in video gridview screen's sidebar.
  @override
  bool build() {
    return false;
  }

  void setState(bool value) {
    state = value;
  }
}
