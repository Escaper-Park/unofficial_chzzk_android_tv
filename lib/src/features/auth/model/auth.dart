import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth.freezed.dart';
part 'auth.g.dart';

/// Get Auth from cookies in webview.
///
/// Use 'NID_AUT' and 'NID_SES'.
@freezed
class Auth with _$Auth {
  // Add this to use custom method.
  const Auth._();

  const factory Auth({
    required String nidAuth,
    required String nidSession,
  }) = _Auth;

  Set getCookie() => {'NID_AUT=$nidAuth; NID_SES=$nidSession'};

  Options getOptions() {
    final Set cookies = getCookie();

    return Options(headers: {'Cookie': cookies});
  }

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);
}
