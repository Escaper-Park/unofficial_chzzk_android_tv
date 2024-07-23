import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/dio/dio_client.dart';
import '../../auth/repository/auth_repository.dart';
import '../model/user.dart';
import '../repository/user_repository.dart';

part 'user_controller.g.dart';

@riverpod
class UserController extends _$UserController {
  late UserRepository _repository;

  @override
  FutureOr<User?> build() async {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = UserRepository(dio);

    return await fetchUser();
  }

  Future<User?> fetchUser() async {
    final User? user = await _repository.getUser();

    // If login cookies are expired delete all cookies.
    if (user == null) ref.watch(authRepositoryProvider).deleteCookies();

    return user;
  }

  void signOut() {
    state = const AsyncData(null);
  }
}
