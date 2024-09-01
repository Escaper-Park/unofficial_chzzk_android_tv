import 'package:freezed_annotation/freezed_annotation.dart';

import 'chat.dart';

part 'base_chat.freezed.dart';
part 'base_chat.g.dart';

@freezed
class BaseChat with _$BaseChat {
  /// A custom chat model to handle both Chat and RecentChat
  const factory BaseChat({
    required String msg,
    required Profile? profile,
    required Extras? extras,

    /// chat created time
    required int ctime,
  }) = _BaseChat;

  factory BaseChat.fromJson(Map<String, dynamic> json) =>
      _$BaseChatFromJson(json);
}
