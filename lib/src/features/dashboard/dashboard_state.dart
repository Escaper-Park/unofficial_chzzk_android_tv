import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../user/model/user.dart';
import '../user/controller/user_controller.dart';

mixin class DashboardState {
  AsyncValue<User?> getUserState(ref) => ref.watch(userControllerProvider);
}
