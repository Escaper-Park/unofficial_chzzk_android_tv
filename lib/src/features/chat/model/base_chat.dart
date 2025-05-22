import 'package:freezed_annotation/freezed_annotation.dart';

import 'extras.dart';
import 'profile.dart';

part 'base_chat.freezed.dart';
part 'base_chat.g.dart';

@freezed
@JsonSerializable()
class BaseChat with _$BaseChat {
  final String msg;
  final Profile? profile;
  final Extras? extras;
  final int ctime;

  BaseChat({
    required this.msg,
    required this.profile,
    required this.extras,
    required this.ctime,
  });

  factory BaseChat.fromJson(Map<String, dynamic> json) =>
      _$BaseChatFromJson(json);
}
