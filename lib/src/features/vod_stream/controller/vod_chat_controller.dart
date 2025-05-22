import 'dart:async';
import 'dart:collection';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_player/video_player.dart';

import '../../../common/constants/enums.dart' show PlaybackDirection;
import '../../../utils/dio/dio_client.dart';
import '../../vod/model/vod_chat.dart';
import '../../vod/repository/vod_repository.dart';
import 'vod_playlist_controller.dart';

part 'vod_chat_controller.g.dart';

@Riverpod(keepAlive: true)
class VodChatQueueController extends _$VodChatQueueController {
  static const int _threshold = 20;
  late final VodRepository _repository;
  final _queue = ListQueue<VodChat>();

  bool _isFetching = false;
  bool _isSeeking = false;
  int? _nextPlayerMessageTime;
  int? _lastPlayerMessageTime;
  VodPlay? _vodPlay;
  int? getNextPlayerMessageTime() => _nextPlayerMessageTime;
  late final KeepAliveLink _keepAliveLink;

  @override
  FutureOr<ListQueue<VodChat>> build({required int videoNo}) async {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = VodRepository(dio);
    _vodPlay = ref.read(vodPlaylistControllerProvider);
    _keepAliveLink = ref.keepAlive();
    return _queue;
  }

  Future<void> init() async {
    final response = await _repository.getVodChat(
      videoNo: _vodPlay!.$1.videoNo,
      playerMessageTime: _vodPlay!.$1.watchTimeline == null
          ? 0
          : (_vodPlay!.$1.watchTimeline! * 1000),
      previousVideoChatSize: null,
    );

    _nextPlayerMessageTime = response?.nextPlayerMessageTime;

    final newChats = response?.videoChats ?? [];
    _lastPlayerMessageTime = newChats.last.playerMessageTime;
    _queue.addAll(newChats);

    state = AsyncValue.data(ListQueue<VodChat>()..addAll(_queue));
  }

  Future<void> fetchMore() async {
    if (_isFetching || _nextPlayerMessageTime == null) return;
    _isFetching = true;

    final response = await _repository.getVodChat(
      videoNo: _vodPlay!.$1.videoNo,
      playerMessageTime: _nextPlayerMessageTime!,
      previousVideoChatSize: null,
    );

    final newChats = response?.videoChats ?? [];
    if (newChats.isEmpty) {
      _nextPlayerMessageTime = null;
      _lastPlayerMessageTime = null;
    } else {
      _nextPlayerMessageTime = response?.nextPlayerMessageTime;
      _lastPlayerMessageTime = newChats.last.playerMessageTime;
      _queue.addAll(newChats);
    }

    state = AsyncValue.data(ListQueue<VodChat>()..addAll(_queue));
    _isFetching = false;
  }

  Future<VodChat?> dequeue() async {
    if (_isSeeking) return null;

    final chat = _queue.isNotEmpty ? _queue.removeFirst() : null;
    if (_queue.length <= _threshold && _nextPlayerMessageTime != null) {
      await fetchMore();
    }
    state = AsyncValue.data(ListQueue<VodChat>()..addAll(_queue));
    return chat;
  }

  VodChat? peek() => _queue.isNotEmpty ? _queue.first : null;

  void toggleIsSeeking(bool value) {
    _isSeeking = value;
  }

  Future<void> endSeekAndUpdateChat(
    PlaybackDirection direction,
    int targetPos,
  ) async {
    // seek
    if (direction == PlaybackDirection.backward) {
      _queue.clear();
      _nextPlayerMessageTime = targetPos < 0 ? 0 : targetPos;
      await fetchMore();
    }
    // forward
    else {
      if (_lastPlayerMessageTime == null) {
        _isSeeking = false;
        return;
      }

      // find new
      if (targetPos < _lastPlayerMessageTime!) {
        _queue.removeWhere((c) => c.playerMessageTime <= targetPos);
        state = AsyncValue.data(ListQueue<VodChat>()..addAll(_queue));
      }
      // fetch new
      else {
        _queue.clear();
        _nextPlayerMessageTime = targetPos;
        await fetchMore();
      }
    }
    _isSeeking = false;
  }

  void disposeQueue() {
    _keepAliveLink.close();
    ref.invalidateSelf();
    _queue.clear();
    _isFetching = false;
    _isSeeking = false;
    _nextPlayerMessageTime = null;
    _lastPlayerMessageTime = null;
  }
}

@riverpod
class VodChatController extends _$VodChatController {
  static const int _tolerance = 200;
  late final StreamController<List<VodChat>> _streamController;
  final List<VodChat> _chatBuffer = [];
  late final void Function() _listener;

  @override
  Stream<List<VodChat>> build({
    required VideoPlayerController controller,
    required int videoNo,
  }) {
    _streamController = StreamController<List<VodChat>>();

    final queueNotifier = ref.read(
      vodChatQueueControllerProvider(videoNo: videoNo).notifier,
    );

    _listener = () {
      final pos = controller.value.position.inMilliseconds;

      final nextChat = queueNotifier.peek();
      final hasMoreOnServer = queueNotifier.getNextPlayerMessageTime() != null;

      if (nextChat != null) {
        final chatTime = nextChat.playerMessageTime;
        if (pos + _tolerance >= chatTime) {
          queueNotifier.dequeue().then((chat) {
            if (chat != null && !_streamController.isClosed) {
              _chatBuffer.insert(0, chat);
              _streamController.add(List<VodChat>.from(_chatBuffer));
            }
          });
        }
      }

      if (nextChat == null && !hasMoreOnServer) {
        controller.removeListener(_listener);
        if (!_streamController.isClosed) {
          _streamController.close();
        }
      }
    };

    queueNotifier.init().then(
      (value) {
        controller.addListener(_listener);
      },
    );

    ref.onDispose(() {
      controller.removeListener(_listener);
      _streamController.close();
    });

    return _streamController.stream;
  }

  void clearChatBufer() {
    _chatBuffer.clear();
    if (!_streamController.isClosed) {
      _streamController.add(List<VodChat>.from(_chatBuffer));
    }
  }
}
