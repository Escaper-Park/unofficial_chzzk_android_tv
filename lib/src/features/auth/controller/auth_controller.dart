import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../following/controller/following_category_controller.dart';
import '../../home/controller/home_controller.dart';
import '../model/auth.dart';
import '../repository/auth_repository.dart';
import '../../user/controller/user_controller.dart';
import '../../../utils/dio/dio_client.dart';
import '../../../common/constants/enums.dart' show LoginStep;

part 'auth_controller.g.dart';

// Set keepAlive to true to maintain login state.
@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  @override
  FutureOr<Auth?> build() async {
    return await getAuthFromCookies();
  }

  Future<Auth?> getAuthFromCookies() async {
    final Auth? auth =
        await ref.read(authRepositoryProvider).getAuthFromCookies();

    if (auth != null) {
      // add cookies to dio client to use NID_AUT, NID_SES for all services.
      final cookies = auth.getCookie();
      ref.read(dioClientProvider.notifier).addCookies(cookies);
    }

    return auth;
  }

  Future<void> signIn() async {
    final Auth? auth = await getAuthFromCookies();

    state = AsyncData(auth);
  }

  Future<void> signOut() async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(
      () async {
        // delete all cookies
        await ref.read(authRepositoryProvider).deleteCookies();
        // reset user profile
        ref.read(userControllerProvider.notifier).signOut();
        // reset dio
        ref.read(dioClientProvider.notifier).signOut();

        // reset home
        ref.read(homeFollowingLivesControllerProvider.notifier).refresh();
        ref.read(followingCategoryControllerProvider.notifier).refresh();
        ref.read(homePopularLivesControllerProvider.notifier).refresh();

        return null;
      },
    );
  }

  Set? getCookie() => state.value?.getCookie();
}

@riverpod
class LoginStepController extends _$LoginStepController {
  @override
  LoginStep build() {
    return LoginStep.id;
  }

  void update(LoginStep step) {
    state = step;
  }
}
