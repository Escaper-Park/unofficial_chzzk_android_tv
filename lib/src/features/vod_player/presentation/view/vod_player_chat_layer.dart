import 'package:flutter/widgets.dart';

import '../../../chat/presentation/player_chat.dart';
import '../../../settings/domain/entities/chat_settings.dart';
import 'vod_player_chat_replay_controller.dart';

class VodPlayerChatLayer extends StatelessWidget {
  const VodPlayerChatLayer({
    super.key,
    required this.controller,
    required this.chatSettings,
  });

  final VodPlayerChatReplayController controller;
  final ChatSettings chatSettings;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        final state = controller.state;
        if (!state.isVisible) {
          return const SizedBox.shrink();
        }

        return PlayerChatLayerBody(
          key: ObjectKey(controller),
          mode: state.presentationMode,
          chatSettings: chatSettings,
          messages: state.messages,
          statusText: _statusText(state),
        );
      },
    );
  }
}

String? _statusText(VodPlayerChatReplayState state) {
  if (state.messages.isNotEmpty) {
    return null;
  }

  if (state.isLoading) {
    return PlayerChatString.loading;
  }

  if (state.hasError) {
    return state.message ?? PlayerChatString.failure;
  }

  return PlayerChatString.empty;
}
