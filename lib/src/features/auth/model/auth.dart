import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth.freezed.dart';
part 'auth.g.dart';

@freezed
class Auth with _$Auth {
  const Auth._();

  const factory Auth({
    required String nidAuth,
    required String nidSession,
  }) = _Auth;

  Options getOptions() {
    final Set cookie = {'NID_AUT=$nidAuth; NID_SES=$nidSession'};

    return Options(headers: {'Cookie': cookie});
  }

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);
}
