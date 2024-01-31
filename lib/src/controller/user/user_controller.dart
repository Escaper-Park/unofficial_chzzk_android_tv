import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/user/user.dart';
import '../../service/user/user_repository.dart';
import '../auth/auth_controller.dart';

part 'user_controller.g.dart';

@riverpod
class UserController extends _$UserController {
  Options? _options;

  @override
  FutureOr<User?> build() async {
    final auth = ref.watch(authControllerProvider).value;

    _options = auth?.getOptions();

    return auth == null ? null : fetchUser();
  }

  Future<User?> fetchUser() async {
    final User? user =
        await ref.watch(userRepositoryProvider).getUser(options: _options);

    return user;
  }
}
