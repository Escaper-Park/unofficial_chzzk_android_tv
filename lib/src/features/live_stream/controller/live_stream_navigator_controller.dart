import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/constants/enums.dart' show VideoSortType;
import '../../../utils/dio/dio_client.dart';
import '../../category/repository/category_repository.dart';
import '../../channel/model/channel.dart';
import '../../following/model/following.dart';
import '../../following/repository/following_repository.dart';
import '../../group/controller/group_controller.dart';
import '../../group/controller/group_detail_controller.dart';
import '../../group/model/group.dart';
import '../../live/controller/live_controller.dart';
import '../../live/model/live_detail.dart';
import '../../live/model/live_info.dart';
import '../../live/model/live_response.dart';
import '../../live/repository/live_repository.dart';

part 'live_stream_navigator_controller.g.dart';

@riverpod
class LiveStreamFollowingLivesController
    extends _$LiveStreamFollowingLivesController {
  late FollowingRepository _repository;

  @override
  FutureOr<List<Following>?> build() async {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = FollowingRepository(dio);

    return await _fetchFollowingLives();
  }

  Future<List<Following>?> _fetchFollowingLives() async {
    final followingResponse = await _repository.getFollowingLives(
      sortType: VideoSortType.popular.value,
    );

    return followingResponse?.followingList;
  }
}

@riverpod
class LiveStreamCategoryLivesController
    extends _$LiveStreamCategoryLivesController {
  late CategoryRepository _repository;
  late String? _categoryType;
  late String? _categoryId;

  LiveNext? _next;

  @override
  FutureOr<List<LiveInfo>?> build({required String channelId}) async {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = CategoryRepository(dio);

    final liveStatus = await ref
        .read(liveControllerProvider.notifier)
        .getLiveStatus(channelId: channelId);

    _categoryType = liveStatus?.categoryType;
    _categoryId = liveStatus?.liveCategory;

    return await _fetch();
  }

  Future<List<LiveInfo>?> _fetch() async {
    if (_categoryType == null || _categoryId == null) return null;

    final response = await _repository.getCategoryLives(
      categoryType: _categoryType!,
      categoryId: _categoryId!,
      concurrentUserCount: null,
      liveId: null,
      size: 18,
    );

    _next = response?.page?.next;

    return response?.data;
  }

  Future<void> fetchMore() async {
    if (_next == null) return;

    final prev = state.value;

    state = await AsyncValue.guard(
      () async {
        final response = await _repository.getCategoryLives(
          categoryType: _categoryType!,
          categoryId: _categoryId!,
          concurrentUserCount: _next!.concurrentUserCount,
          liveId: _next!.liveId,
          size: 18,
        );

        _next = response?.page?.next;

        if (response?.data == null) return [...prev!];

        return [...prev!, ...response!.data];
      },
    );
  }
}

@riverpod
class LiveStreamPopularLivesController
    extends _$LiveStreamPopularLivesController {
  late LiveRepository _repository;

  LiveNext? _next;

  @override
  FutureOr<List<LiveInfo>?> build() async {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = LiveRepository(dio);

    return await _fetch();
  }

  Future<List<LiveInfo>?> _fetch() async {
    final response = await _repository.getLiveResponse(
      size: 20,
      sortType: VideoSortType.popular.value,
      concurrentUserCount: null,
      liveId: null,
    );

    _next = response?.page?.next;

    return response?.data;
  }

  Future<void> fetchMore() async {
    if (_next == null) return;

    final prev = state.value;

    state = await AsyncValue.guard(() async {
      final response = await _repository.getLiveResponse(
        size: 20,
        sortType: VideoSortType.popular.value,
        concurrentUserCount: _next!.concurrentUserCount,
        liveId: _next!.liveId,
      );

      _next = response?.page?.next;

      if (response?.data == null) return [...prev!];

      return [...prev!, ...response!.data];
    });
  }
}

@riverpod
class LiveStreamGroupLivesController extends _$LiveStreamGroupLivesController {
  late LiveRepository _repository;
  late Group? _group;
  late List<Channel>? _channelsInGroup;

  @override
  FutureOr<List<LiveDetail>?> build() async {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = LiveRepository(dio);

    return await _init();
  }

  Future<List<LiveDetail>?> _init() async {
    _group =
        ref.read(groupControllerProvider.notifier).getCurrentActivatedGroup();

    if (_group == null) return null;

    _channelsInGroup = await ref
        .read(groupDetailControllerProvider(group: _group!).notifier)
        .getChannels(_group);

    if (_channelsInGroup == null || _channelsInGroup!.isEmpty) return null;

    List<Future<LiveDetail?>> liveDetailFutures = [];
    
    for (int i = 0; i < _channelsInGroup!.length; i++) {
      if (_channelsInGroup![i].openLive == true) {
        final future = _repository.getLiveDetail(
          channelId: _channelsInGroup![i].channelId,
        );
        liveDetailFutures.add(future);
      }
    }

    final allLiveDetails = await Future.wait(liveDetailFutures);

    final nonNullDetails = allLiveDetails.whereType<LiveDetail>().toList();
    nonNullDetails.sort(
      (a, b) => b.concurrentUserCount.compareTo(a.concurrentUserCount),
    );

    return nonNullDetails.isEmpty ? [] : nonNullDetails;
  }
}
