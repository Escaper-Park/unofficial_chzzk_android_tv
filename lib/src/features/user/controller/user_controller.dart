import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/exceptions/exceptions.dart';
import '../model/user.dart';
import '../repository/user_repository_wrapper.dart';
import '../../auth/repository/auth_repository.dart';

part 'user_controller.g.dart';

@riverpod
class UserController extends _$UserController {
  @override
  FutureOr<User?> build() async {
    return await fetchUser();
  }

  /// Fetches the current user's profile using the Result pattern.
  ///
  /// Returns null if:
  /// - User is not logged in
  /// - Session has expired (AuthException)
  /// - User profile is incomplete (no userIdHash)
  ///
  /// On auth errors, cookies are automatically cleared.
  Future<User?> fetchUser() async {
    final wrapper = ref.read(userRepositoryWrapperProvider);
    final result = await wrapper.getUser();

    return result.when(
      success: (user) {
        // Check for valid user profile
        if (user == null || user.userIdHash == null) {
          // Fire and forget - cookie deletion happens in background
          ref.read(authRepositoryProvider).deleteCookies();
          return null;
        }
        return user;
      },
      failure: (exception) {
        // Handle auth errors - clear session
        if (exception is AuthException) {
          // Fire and forget - cookie deletion happens in background
          ref.read(authRepositoryProvider).deleteCookies();
        }

        // Log non-auth errors for debugging
        assert(() {
          if (exception is! AuthException) {
            // ignore: avoid_print
            print('UserController.fetchUser error: ${exception.message}');
          }
          return true;
        }());

        // Return null to maintain backward compatibility
        // The caller can check state for error details if needed
        return null;
      },
    );
  }

  /// Signs in and updates the user state.
  Future<void> signIn() async {
    final User? user = await fetchUser();
    state = AsyncData(user);
  }

  /// Signs out and clears the user state.
  void signOut() {
    state = const AsyncData(null);
  }
}
