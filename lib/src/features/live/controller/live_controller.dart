import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/dio/dio_client.dart';
import '../model/live.dart';
import '../repository/live_repository.dart';

part 'live_controller.g.dart';

@riverpod
class LiveController extends _$LiveController {
  late LiveRepository _repository;

  @override
  void build() {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = LiveRepository(dio);

    return;
  }

  /// Get [LiveDetail] using [LiveInfo] data at [LiveContainer].
  Future<LiveDetail?> getLiveDetail({required String channelId}) async {
    return await _repository.getLiveDetail(channelId: channelId);
  }

  /// Get [LiveStatus] when watching a live stream.
  Future<LiveStatus?> getLiveStatus({required String channelId}) async {
    return await _repository.getLiveStatus(channelId: channelId);
  }
}

@riverpod
class AllLivesController extends _$AllLivesController {
  late LiveRepository _repository;

  /// For infinite scrolling
  LivePage? _next;

  /// All Lives sort by LiveSortType
  @override
  FutureOr<List<LiveInfo>?> build({required LiveSortType sortType}) async {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = LiveRepository(dio);

    return await _initFetch();
  }

  Future<List<LiveInfo>?> _initFetch() async {
    final response = await _repository.getLiveResponse(
      size: 18,
      sortType: sortType.value,
      concurrentUserCount: null,
      liveId: null,
    );

    _next = response?.next;

    return response?.data;
  }

  Future<void> fetchMore() async {
    if (_next != null) {
      ref.read(liveFetchMoreLoadingStateProvider.notifier).setState(true);
      final prev = state.value;

      state = await AsyncValue.guard(() async {
        final liveRespnse = await _repository.getLiveResponse(
          size: 18,
          sortType: sortType.value,
          concurrentUserCount: _next!.concurrentUserCount,
          liveId: _next!.liveId,
        );

        _next = liveRespnse?.next;

        if (liveRespnse?.data == null || _next == null) {
          return [...prev!];
        }

        ref.read(liveFetchMoreLoadingStateProvider.notifier).setState(false);
        return [...prev!, ...liveRespnse!.data];
      });
    }
  }
}

@riverpod
class HomePopularLivesController extends _$HomePopularLivesController {
  late LiveRepository _repository;

  /// Home screen popular lives
  @override
  FutureOr<List<LiveInfo>?> build() async {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = LiveRepository(dio);

    return await _initFetch();
  }

  Future<List<LiveInfo>?> _initFetch() async {
    final response = await _repository.getLiveResponse(
      size: 20,
      sortType: LiveSortType.popular.value,
      concurrentUserCount: null,
      liveId: null,
    );

    return response?.data;
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(
      () async {
        return await _initFetch();
      },
    );
  }
}

@riverpod
class LiveFetchMoreLoadingState extends _$LiveFetchMoreLoadingState {
  /// To show 'Loading...' msg in video gridview screen's sidebar.
  @override
  bool build() {
    return false;
  }

  void setState(bool value) {
    state = value;
  }
}
