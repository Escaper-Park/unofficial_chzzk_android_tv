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

    // Error handling
    if (user == null || user.loggedIn == false) {
      await ref.watch(authRepositoryProvider).deleteCookies();
      return null;
    }

    return user;
  }

  void signOut() {
    state = const AsyncData(null);
  }
}

@riverpod
class PrivateUserBlocksController extends _$PrivateUserBlocksController {
  late UserRepository _repository;

  @override
  FutureOr<List<String>> build() async {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = UserRepository(dio);

    return await fetchPrivateUserBlocks();
  }

  Future<List<String>> fetchPrivateUserBlocks() async {
    final List<String> response =
        await _repository.getPrivateUserBlocks().catchError((_) {
      return [''];
    });

    return response;
  }
}
