import 'dart:async';
import 'dart:collection';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';

import '../../../chat/domain/entities/chat.dart';
import '../../../chat/domain/use_cases/player_chat_message_append_policy.dart';
import '../../../chat/domain/use_cases/video_chat_message_mapper.dart';
import '../../../chat/presentation/player_chat.dart';
import 'vod_player_chat_replay_fetch_retry.dart';
import 'vod_player_chat_replay_messages.dart';
import 'vod_player_chat_replay_pending_sync.dart';
import 'vod_player_chat_replay_state.dart';

export 'vod_player_chat_replay_state.dart';

part 'vod_player_chat_replay_cache_helpers.dart';
part 'vod_player_chat_replay_fetch_helpers.dart';
part 'vod_player_chat_replay_visibility_queue.dart';

typedef FetchVodPlayerChatPage =
    Future<VideoChatPage> Function({
      required int videoNo,
      required int playerMessageTime,
      int? previousVideoChatSize,
    });

final class VodPlayerChatReplayController extends ChangeNotifier {
  VodPlayerChatReplayController({
    required this.videoNo,
    required bool isChatEnabled,
    required String? chatChannelId,
    required this.fetchPage,
    required PlayerChatPresentationMode initialPresentationMode,
    @visibleForTesting DateTime Function()? retryClock,
  }) : _fetchRetryBackoff = VodPlayerChatReplayFetchRetryBackoff(
         retryClock ?? DateTime.now,
       ),
       state = isChatEnabled && (chatChannelId?.trim().isNotEmpty ?? false)
           ? VodPlayerChatReplayState.available(
               presentationMode: initialPresentationMode,
             )
           : const VodPlayerChatReplayState.unavailable();

  static const syncTickInterval = Duration(milliseconds: 200);

  static const _rawCachePastWindowMs = 5 * 60 * 1000;
  static const _rawCacheMessageLimit = playerChatMessageBufferSize * 8;
  static const _rawCachePastMessageBudget = _rawCacheMessageLimit * 3 ~/ 4;
  static const _tailPrefetchLeadTimeMs = 10000;
  static const _positionJumpRepositionThresholdMs = 2000;
  static const _previousVideoChatSize = 50;
  static const int? _tailPrefetchPreviousVideoChatSize = null;

  final int videoNo;
  final FetchVodPlayerChatPage fetchPage;
  final VodPlayerChatReplayFetchRetryBackoff _fetchRetryBackoff;
  final VodPlayerChatReplayPendingSync _pendingSync =
      VodPlayerChatReplayPendingSync();
  final List<PlayerChatMessage> _cachedMessages = <PlayerChatMessage>[];
  final Queue<PlayerChatMessage> _pendingVisibleMessages =
      Queue<PlayerChatMessage>();
  final PlayerChatEmojiRegistry _emojiRegistry = PlayerChatEmojiRegistry();

  VodPlayerChatReplayState state;

  int _nextVisibleMessageIndex = 0;
  int? _nextPlayerMessageTime;
  int? _cacheCoverageStartMs;
  int? _emptyCacheValidUntilMs;
  bool _emptyCacheTerminal = false;
  int? _currentPlayerPositionMs;
  Timer? _visibleMessageAppendTimer;
  Duration? _visibleMessageAppendTimerInterval;
  bool _isFetching = false;
  bool _isDisposed = false;
  bool _isSuspended = false;
  bool _isTailPrefetchInFlight = false;
  int _fetchRevision = 0;

  Future<void> syncToPosition(
    Duration position, {
    bool force = false,
    bool forceReposition = false,
    bool preferNextCursor = true,
  }) async {
    final positionMs = math.max(0, position.inMilliseconds);
    final previousPositionMs = _currentPlayerPositionMs;
    final jumpedPosition =
        previousPositionMs != null &&
        (positionMs - previousPositionMs).abs() >=
            _positionJumpRepositionThresholdMs;
    final effectiveForceReposition = forceReposition || jumpedPosition;
    _currentPlayerPositionMs = positionMs;

    if (_isDisposed || _isSuspended || !state.isVisible) {
      return;
    }

    if (force || effectiveForceReposition) {
      _clearPendingVisibleMessages();
    }

    if (_isFetching) {
      _pendingSync.record(
        positionMs: positionMs,
        force: force,
        forceReposition: effectiveForceReposition,
        preferNextCursor: preferNextCursor,
      );
      return;
    }

    if (force || !_canReuseCache(positionMs)) {
      if (!force && !_fetchRetryBackoff.canFetch()) {
        return;
      }

      await _fetchChunkAround(
        positionMs,
        replaceCachedMessages: force || _isBeforeCachedCoverage(positionMs),
        preferNextCursor: preferNextCursor,
      );
    }

    if (_isDisposed || _isSuspended || !state.isVisible) {
      return;
    }

    final currentPositionMs = _currentPlayerPositionMs ?? positionMs;
    if (_canReuseCache(currentPositionMs)) {
      _applyCachedPosition(
        currentPositionMs,
        forceReposition: force || effectiveForceReposition,
      );
      _maybePrefetchNextChunk(positionMs: currentPositionMs);
    }
  }

  Future<void> seekCommitted(Duration position, {Duration? previousPosition}) {
    final positionMs = math.max(0, position.inMilliseconds);
    final previousPositionMs = previousPosition == null
        ? _currentPlayerPositionMs
        : math.max(0, previousPosition.inMilliseconds);
    final isBackwardSeek =
        previousPositionMs != null && positionMs < previousPositionMs;
    if (!isBackwardSeek && _canReuseCache(positionMs)) {
      return syncToPosition(position, forceReposition: true);
    }

    return syncToPosition(
      position,
      force: true,
      forceReposition: true,
      preferNextCursor: false,
    );
  }

  void pauseReplayClock() {
    _rollbackPendingVisibleMessages();
  }

  void setSuspended({required bool suspended}) {
    if (_isDisposed || _isSuspended == suspended) {
      return;
    }

    _isSuspended = suspended;
    if (suspended) {
      _fetchRevision += 1;
      _isFetching = false;
      _isTailPrefetchInFlight = false;
      _pendingSync.clear();
      _rollbackPendingVisibleMessages();
      return;
    }

    final positionMs = _currentPlayerPositionMs;
    if (positionMs != null && state.isVisible) {
      unawaited(
        syncToPosition(
          Duration(milliseconds: positionMs),
          forceReposition: true,
        ),
      );
    }
  }

  void setPresentationMode(PlayerChatPresentationMode mode) {
    if (!state.isAvailable) {
      return;
    }

    if (mode == PlayerChatPresentationMode.hidden) {
      if (state.presentationMode == mode && state.messages.isEmpty) {
        return;
      }

      _clearReplayCache(clearEmojiRegistry: true);
      _emit(
        state.copyWith(
          phase: VodPlayerChatReplayPhase.idle,
          presentationMode: mode,
          messages: const <PlayerChatMessage>[],
          message: null,
        ),
      );
      return;
    }

    if (state.presentationMode == mode && state.isVisible) {
      return;
    }

    final wasVisible = state.isVisible;
    _emit(
      state.copyWith(
        phase: wasVisible ? state.phase : VodPlayerChatReplayPhase.idle,
        presentationMode: mode,
        messages: wasVisible ? state.messages : const <PlayerChatMessage>[],
        message: null,
      ),
    );
    _scheduleNextVisibleMessage();
    if (_currentPlayerPositionMs != null) {
      unawaited(
        syncToPosition(
          Duration(milliseconds: _currentPlayerPositionMs!),
          force: !wasVisible,
        ),
      );
    }
  }

  @override
  void dispose() {
    _isDisposed = true;
    _clearReplayCache(clearEmojiRegistry: true);
    super.dispose();
  }

  void _emit(VodPlayerChatReplayState nextState) {
    if (_isDisposed) {
      return;
    }

    if (state == nextState) {
      return;
    }

    state = nextState;
    notifyListeners();
  }
}
