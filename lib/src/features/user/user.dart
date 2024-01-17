import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../client/repository/client_repository.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@riverpod
Future<User?> user(UserRef ref) async {
  final user = await ref.read(clientRepositoryProvider.notifier).getUser();
  return user;
}

@freezed
class User with _$User {
  factory User({
    required bool hasProfile,
    required bool loggedIn,
    required String nickname,
    required bool officialNotiAgree,
    required String? officialNotiAgreeUpdateDate,
    required List<dynamic> penalties,
    required String? profileImageUrl,
    required String userIdHash,
    required bool verifiedMark,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
