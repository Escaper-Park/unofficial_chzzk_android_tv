import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/dio/dio_client.dart';
import '../../user/controller/user_controller.dart';
import '../model/auth.dart';
import '../repository/auth_repository.dart';

part 'auth_controller.g.dart';

// Set keepAlive to true!
@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  @override
  FutureOr<Auth?> build() async {
    return await getAuthWithCookies();
  }

  Future<Auth?> getAuthWithCookies() async {
    final Auth? auth =
        await ref.read(authRepositoryProvider).getAuthWithCookies();

    if (auth != null) {
      // Add global dio settings to use login cookie options.
      ref.read(dioClientProvider.notifier).addCookies(auth.getCookie());
    }

    return auth;
  }

  Future<void> signIn() async {
    final Auth? auth = await getAuthWithCookies();

    state = AsyncData(auth);
  }

  Future<void> signOut() async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      // delete all cookies
      await ref.read(authRepositoryProvider).deleteCookies();
      // reset user profile
      ref.read(userControllerProvider.notifier).signOut();
      // reset dio cookies
      ref.read(dioClientProvider.notifier).singOut();
      
      return null;
    });
  }
}
