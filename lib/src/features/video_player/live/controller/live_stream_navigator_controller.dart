import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../utils/dio/dio_client.dart';
import '../../../category/repository/category_repository.dart';
import '../../../following/model/following.dart';
import '../../../following/repository/following_repository.dart';
import '../../../live/controller/live_controller.dart';
import '../../../live/model/live.dart';
import '../../../live/repository/live_repository.dart';

part 'live_stream_navigator_controller.g.dart';

@riverpod
class LiveStreamFollowingLivesController
    extends _$LiveStreamFollowingLivesController {
  late FollowingRepository _repository;

  /// Get List of following channel's live streams.
  ///
  /// [Following] has [LiveInfo].
  @override
  FutureOr<List<Following>?> build() async {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = FollowingRepository(dio);

    return await _fetchFollowingLives();
  }

  Future<List<Following>?> _fetchFollowingLives() async {
    final followingResponse = await _repository.getFollowingLives();

    return followingResponse?.followingList;
  }
}

@riverpod
class LiveStreamCategoryLivesController
    extends _$LiveStreamCategoryLivesController {
  late CategoryRepository _repository;
  late String? _categoryType;
  late String? _categoryId;
  LivePage? _next;

  @override
  FutureOr<List<LiveInfo>?> build({required String channelId}) async {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = CategoryRepository(dio);

    final liveStatus = await ref
        .watch(liveControllerProvider.notifier)
        .getLiveStatus(channelId: channelId);

    _categoryType = liveStatus?.categoryType;
    _categoryId = liveStatus?.liveCategory;

    return await _initFetch();
  }

  Future<List<LiveInfo>?> _initFetch() async {
    if (_categoryType != null && _categoryId!.isNotEmpty) {
      final LiveResponse? liveResponse = await _repository.getCategoryLives(
        categoryType: _categoryType!,
        categoryId: _categoryId!,
        size: 18,
        concurrentUserCount: null,
        liveId: null,
      );

      _next = liveResponse?.next;

      return liveResponse?.data;
    }

    return null;
  }

  Future<void> fetchMore() async {
    if (_next != null) {
      final prev = state.value;

      state = await AsyncValue.guard(() async {
        final liveRespnse = await _repository
            .getCategoryLives(
          categoryType: _categoryType!,
          categoryId: _categoryId!,
          size: 18,
          concurrentUserCount: _next!.concurrentUserCount,
          liveId: _next!.liveId,
        )
            .catchError((_) {
          return null;
        });

        _next = liveRespnse?.next;

        if (liveRespnse?.data == null || _next == null) {
          return [...prev!];
        }

        return [...prev!, ...liveRespnse!.data];
      });
    }
  }
}

@riverpod
class LiveStreamPopularLivesController
    extends _$LiveStreamPopularLivesController {
  late LiveRepository _repository;

  /// For infinite scrolling
  LivePage? _next;

  /// All Lives sort by LiveSortType
  @override
  FutureOr<List<LiveInfo>?> build() async {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = LiveRepository(dio);

    return await _initFetch();
  }

  Future<List<LiveInfo>?> _initFetch() async {
    final response = await _repository.getLiveResponse(
      size: 18,
      sortType: LiveSortType.popular.value,
      concurrentUserCount: null,
      liveId: null,
    );

    _next = response?.next;

    return response?.data;
  }

  Future<void> fetchMore() async {
    if (_next != null) {
      final prev = state.value;

      state = await AsyncValue.guard(() async {
        final liveRespnse = await _repository
            .getLiveResponse(
          size: 18,
          sortType: LiveSortType.popular.value,
          concurrentUserCount: _next!.concurrentUserCount,
          liveId: _next!.liveId,
        )
            .catchError((_) {
          return null;
        });

        _next = liveRespnse?.next;

        if (liveRespnse?.data == null || _next == null) {
          return [...prev!];
        }

        return [...prev!, ...liveRespnse!.data];
      });
    }
  }
}
