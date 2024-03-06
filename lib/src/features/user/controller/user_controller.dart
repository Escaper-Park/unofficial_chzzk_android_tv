import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../auth/controller/auth_controller.dart';
import '../model/user.dart';
import '../repository/user_repository.dart';

part 'user_controller.g.dart';

@riverpod
class UserController extends _$UserController {
  Options? _options;

  @override
  FutureOr<User?> build() async {
    final auth = await ref.watch(authControllerProvider.future);

    _options = auth?.getOptions();

    return auth == null ? null : await fetchUser();
  }

  Future<User?> fetchUser() async {
    final User? user =
        await ref.watch(userRepositoryProvider).getUser(options: _options);

    return user;
  }
}
