import 'package:freezed_annotation/freezed_annotation.dart';

import 'extras.dart';
import 'profile.dart';

part 'base_chat.freezed.dart';
part 'base_chat.g.dart';

@freezed
class BaseChat with _$BaseChat {
  const factory BaseChat({
    required String msg,
    required Profile? profile,
    required Extras? extras,
    required int ctime,
  }) = _BaseChat;

  factory BaseChat.fromJson(Map<String, dynamic> json) =>
      _$BaseChatFromJson(json);
}
