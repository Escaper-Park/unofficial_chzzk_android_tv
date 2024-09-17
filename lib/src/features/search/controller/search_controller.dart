import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/dio/dio_client.dart';
import '../../channel/model/channel.dart';
import '../../live/model/live.dart';
import '../../live/repository/live_repository.dart';
import '../repository/search_repository.dart';

part 'search_controller.g.dart';

@riverpod
class SearchChannelController extends _$SearchChannelController {
  late SearchRepository _repository;

  @override
  Future<List<Channel>?> build({required String keyword}) async {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = SearchRepository(dio);

    return await searchChannel(keyword);
  }

  Future<List<Channel>?> searchChannel(String keyword) async {
    final searchResponse =
        await _repository.getSearchChannelResults(keyword: keyword);

    if (searchResponse != null && searchResponse.data.isNotEmpty) {
      final channelListResponse = searchResponse.data;

      // Check privateUserBlock
      final results = channelListResponse
          .where((response) {
            final personalData = response.channel.personalData;
            if (personalData == null) return true;

            return personalData.privateUserBlock != true;
          })
          .map((json) => json.channel)
          .toList();

      return results;
    }

    return [];
  }
}

@riverpod
class CurrentSearchChannelController extends _$CurrentSearchChannelController {
  @override
  Channel? build() {
    return null;
  }

  void setCurrentChannel(Channel channel) {
    state = channel;
  }
}

@riverpod
class SearchTagController extends _$SearchTagController {
  late SearchRepository _repository;
  LivePage? _next;

  @override
  FutureOr<List<LiveInfo>?> build({
    required String tag,
    required LiveSortType sortType,
  }) async {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = SearchRepository(dio);

    return await _initSearch();
  }

  Future<List<LiveInfo>?> _initSearch() async {
    final response = await _repository.getSearchTagResults(
      sortType: sortType.value,
      concurrentUserCount: null,
      liveId: null,
      tags: tag,
    );

    _next = response?.next;

    return response?.data;
  }

  Future<void> fetchMore() async {
    if (_next != null) {
      ref
          .read(searchTagLiveFetchMoreLoadingStateProvider.notifier)
          .setState(true);
      final prev = state.value;

      state = await AsyncValue.guard(
        () async {
          final liveResponse = await _repository
              .getSearchTagResults(
            sortType: sortType.value,
            concurrentUserCount: _next!.concurrentUserCount,
            liveId: _next!.liveId,
            tags: tag,
          )
              .catchError((_) {
            ref
                .read(searchTagLiveFetchMoreLoadingStateProvider.notifier)
                .setState(false);
            return null;
          });

          _next = liveResponse?.next;

          if (liveResponse?.data == null || _next == null) {
            return [...prev!];
          }

          ref
              .read(searchTagLiveFetchMoreLoadingStateProvider.notifier)
              .setState(false);
          return [...prev!, ...liveResponse!.data];
        },
      );
    }
  }
}

@riverpod
class SearchTagLiveFetchMoreLoadingState
    extends _$SearchTagLiveFetchMoreLoadingState {
  @override
  bool build() {
    return false;
  }

  void setState(bool value) {
    state = value;
  }
}
