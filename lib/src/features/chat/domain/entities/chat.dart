import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_access_token.dart';
part 'chat.freezed.dart';
part 'live_chat_session_request.dart';
part 'player_chat_message.dart';
part 'video_chat_message.dart';

@freezed
abstract class VideoChatPage with _$VideoChatPage {
  const factory VideoChatPage({
    int? nextPlayerMessageTime,
    @Default(<VideoChatMessage>[]) List<VideoChatMessage> previousMessages,
    @Default(<VideoChatMessage>[]) List<VideoChatMessage> messages,
  }) = _VideoChatPage;
}
