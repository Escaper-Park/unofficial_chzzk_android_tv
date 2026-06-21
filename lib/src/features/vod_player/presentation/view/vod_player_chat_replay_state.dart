import 'package:flutter/foundation.dart';

import '../../../chat/domain/entities/chat.dart';
import '../../../chat/presentation/player_chat.dart';

enum VodPlayerChatReplayPhase {
  unavailable,
  idle,
  loading,
  ready,
  error,
}

@immutable
final class VodPlayerChatReplayState {
  const VodPlayerChatReplayState({
    required this.phase,
    required this.presentationMode,
    this.messages = const <PlayerChatMessage>[],
    this.message,
  });

  const VodPlayerChatReplayState.unavailable()
    : this(
        phase: VodPlayerChatReplayPhase.unavailable,
        presentationMode: PlayerChatPresentationMode.hidden,
      );

  const VodPlayerChatReplayState.available({
    required PlayerChatPresentationMode presentationMode,
  }) : this(
         phase: VodPlayerChatReplayPhase.idle,
         presentationMode: presentationMode,
       );

  final VodPlayerChatReplayPhase phase;
  final PlayerChatPresentationMode presentationMode;
  final List<PlayerChatMessage> messages;
  final String? message;

  bool get isAvailable => phase != VodPlayerChatReplayPhase.unavailable;

  bool get isVisible =>
      isAvailable && presentationMode != PlayerChatPresentationMode.hidden;

  bool get isLoading => phase == VodPlayerChatReplayPhase.loading;

  bool get hasError => phase == VodPlayerChatReplayPhase.error;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is VodPlayerChatReplayState &&
            phase == other.phase &&
            presentationMode == other.presentationMode &&
            message == other.message &&
            listEquals(messages, other.messages);
  }

  @override
  int get hashCode {
    return Object.hash(
      phase,
      presentationMode,
      message,
      Object.hashAll(messages),
    );
  }

  VodPlayerChatReplayState copyWith({
    VodPlayerChatReplayPhase? phase,
    PlayerChatPresentationMode? presentationMode,
    List<PlayerChatMessage>? messages,
    Object? message = _sentinel,
  }) {
    return VodPlayerChatReplayState(
      phase: phase ?? this.phase,
      presentationMode: presentationMode ?? this.presentationMode,
      messages: messages ?? this.messages,
      message: identical(message, _sentinel)
          ? this.message
          : message as String?,
    );
  }

  static const Object _sentinel = Object();
}
