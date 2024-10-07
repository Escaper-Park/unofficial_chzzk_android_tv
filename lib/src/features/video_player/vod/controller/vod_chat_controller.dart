import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_player/video_player.dart';

import '../../../../utils/dio/dio_client.dart';
import '../../../vod/model/vod_chat.dart';
import '../../../vod/repository/vod_repository.dart';
import 'vod_playlist_controller.dart';

part 'vod_chat_controller.g.dart';

@Riverpod(keepAlive: true)
class VodChatQueue extends _$VodChatQueue {
  late VodRepository _repository;
  late int _videoNo;

  final int _previousVideoChatSize = 50;
  int? _nextPlayerMessageTime;

  @override
  FutureOr<VodChatResponse?> build() async {
    final dio = ref.watch(dioClientProvider);
    _repository = VodRepository(dio);

    return null;
  }

  Future<void> reset() async {
    state = await AsyncValue.guard(
      () async => null,
    );
  }

  Future<void> fetchVodChatsWithPrevChatSize({
    required int playerMessageTime,
  }) async {
    _videoNo = ref.read(vodPlaylistControllerProvider)!.$1.videoNo;

    state = await AsyncValue.guard(
      () async {
        final response = await _repository.getVodChat(
          videoNo: _videoNo,
          playerMessageTime: playerMessageTime,
          previousVideoChatSize: _previousVideoChatSize,
        );

        _nextPlayerMessageTime = response?.nextPlayerMessageTime;

        return response;
      },
    );
  }

  Future<void> autoFetch() async {
    if (_nextPlayerMessageTime != null) {
      state = await AsyncValue.guard(
        () async {
          final response = await _repository.getVodChat(
            videoNo: _videoNo,
            playerMessageTime: _nextPlayerMessageTime!,
            previousVideoChatSize: null,
          );

          _nextPlayerMessageTime = response?.nextPlayerMessageTime;

          return response;
        },
      );
    }
  }
}

@riverpod
class VodChatController extends _$VodChatController {
  late int _queueIndex;
  late int _lastChatIndex;
  late int _videoChatLength;
  late VodChatResponse? _queue;

  final int _previousVideoChatSize = 50;

  @override
  FutureOr<List<VodChat>> build({
    required VideoPlayerController controller,
  }) {
    _addListener();
    _resetQueueValue();

    return [];
  }

  void _addListener() => controller.addListener(_addChatFromQueue);
  void removeListener() => controller.removeListener(_addChatFromQueue);

  void _addChatFromQueue() async {
    if (_queue != null && _videoChatLength > _queueIndex) {
      final pos = controller.value.position.inMilliseconds;

      // Add Batch
      final List<VodChat> newChats = [];
      while (_queueIndex < _videoChatLength &&
          _queue!.videoChats![_queueIndex].playerMessageTime <= pos) {
        newChats.add(_queue!.videoChats![_queueIndex]);
        _queueIndex += 1;
      }

      if (newChats.isNotEmpty) {
        final prev = state.value!;
        state = AsyncData(
            [...newChats.reversed, ...prev, ..._queue!.previousVideoChats!]);
      }

      if (_queueIndex == _lastChatIndex + 1) {
        // if next is null stop
        if (_queue?.nextPlayerMessageTime == null) {
          removeListener();
        }
        // if next is not null, fetch more
        else {
          await ref.read(vodChatQueueProvider.notifier).autoFetch();
          _resetQueueValue();
        }
      }
    }
  }

  void _resetQueueValue() {
    _queueIndex = 0;
    _queue = ref.read(vodChatQueueProvider).value;
    // Error
    if (_queue == null) {
      removeListener();
    }
    // reset values
    else {
      _videoChatLength = _queue!.videoChats!.length;
      _lastChatIndex = _videoChatLength - 1;
    }
  }

  Future<void> vodChatBackwardSeekTo() async {
    removeListener();

    final newPos = controller.value.position.inMilliseconds;
    state = const AsyncValue.loading();

    // fetch
    await ref
        .read(vodChatQueueProvider.notifier)
        .fetchVodChatsWithPrevChatSize(playerMessageTime: newPos);

    _resetQueueValue();
    state = AsyncValue.data(
        [..._queue?.previousVideoChats?.reversed.toList() ?? []]);

    _addListener();
  }

  Future<void> vodChatForwardSeekTo() async {
    final pos = controller.value.position.inMilliseconds;

    // temp stop listener
    removeListener();
    // Find nearest
    if (pos < _queue!.videoChats!.last.playerMessageTime) {
      state = const AsyncValue.loading();
      _queueIndex = _findNearestChatByBinarySearch(pos);

      // Get new elements with prev 50
      int startIndex = (_queueIndex - _previousVideoChatSize < 0)
          ? 0
          : _queueIndex - _previousVideoChatSize;

      final prev = _queue!.videoChats!
          .sublist(startIndex, _queueIndex)
          .reversed
          .toList();

      state = AsyncValue.data(prev);
    }
    // fetch new
    else {
      // if next null is null, stop loading chat
      if (_queue!.nextPlayerMessageTime == null) {
        removeListener();
      }
      // fetch new
      else {
        state = const AsyncValue.loading();
        await ref
            .read(vodChatQueueProvider.notifier)
            .fetchVodChatsWithPrevChatSize(playerMessageTime: pos);
        // reset queue
        _resetQueueValue();
      }
    }
    // add Listener again
    _addListener();
  }

  int _findNearestChatByBinarySearch(int pos) {
    final queue = ref.read(vodChatQueueProvider).value;
    final videoChats = queue!.videoChats!;

    int left = 0;
    int right = videoChats.length - 1;
    int closestIndex = 0;

    while (left <= right) {
      int mid = (left + right) ~/ 2;
      if (videoChats[mid].playerMessageTime <= pos) {
        closestIndex = mid;
        left = mid + 1;
      } else {
        right = mid - 1;
      }
    }

    return closestIndex;
  }
}
