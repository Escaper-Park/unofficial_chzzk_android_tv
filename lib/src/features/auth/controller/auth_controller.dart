import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../multi_view/controller/multi_view_controller.dart';
import '../model/auth.dart';
import '../repository/auth_repository.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<Auth?> build() async {
    return await ref.watch(authRepositoryProvider).getAuthWithCookies();
  }

  /// Return login successful result.
  Future<bool> login({
    required InAppWebViewController controller,
    required WebUri? webUri,
    required String id,
    required String password,
  }) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      // Login
      await ref.watch(authRepositoryProvider).naverLogin(
            controller: controller,
            webUri: webUri,
            id: id,
            password: password,
          );

      // Set Cookies expires date.
      await ref.watch(authRepositoryProvider).setExpiresDate();

      final Auth? auth =
          await ref.watch(authRepositoryProvider).getAuthWithCookies();

      return auth;
    });

    return state.value == null ? false : true;
  }

  Future<void> logOut() async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      // invalidate multiview channel
      ref.invalidate(multiViewControllerProvider);

      await ref.watch(authRepositoryProvider).deleteCookies();

      return null;
    });
  }
}
