import 'package:bloc/bloc.dart';

import '../../features/auth/presentation/bloc/auth_session_bloc.dart';
import '../../features/user/domain/repositories/user_repository.dart';

final class AppShellUserCubit extends Cubit<String?> {
  AppShellUserCubit({
    required this.authSessionBloc,
    required this.userRepository,
  }) : super(null);

  final AuthSessionBloc authSessionBloc;
  final UserRepository userRepository;

  Future<void> refresh() async {
    final requestCookieHeader = authSessionBloc.cookieHeader;
    if (requestCookieHeader == null) {
      emit(null);
      return;
    }

    try {
      final status = await userRepository.getUserStatus();
      if (isClosed) {
        return;
      }

      if (authSessionBloc.cookieHeader != requestCookieHeader) {
        return;
      }

      if (!status.loggedIn) {
        emit(null);
        return;
      }

      emit(status.profileImageUrl);
    } catch (_) {
      if (!isClosed && authSessionBloc.cookieHeader == null) {
        emit(null);
      }
    }
  }

  Future<bool> logout() async {
    final didLogout = await authSessionBloc.logout();
    if (!isClosed) {
      emit(null);
    }

    return didLogout;
  }
}
