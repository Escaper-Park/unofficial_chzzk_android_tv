import 'package:hooks_riverpod/hooks_riverpod.dart';

import './controller/auth_controller.dart';
import '../user/model/user.dart';
import '../user/controller/user_controller.dart';
import '../../common/constants/enums.dart';

mixin class AuthState {
  Future<User?> getUser(WidgetRef ref) async =>
      await ref.read(userControllerProvider.notifier).fetchUser();

  LoginStep getLoginStep(WidgetRef ref) =>
      ref.watch(loginStepControllerProvider);
}
