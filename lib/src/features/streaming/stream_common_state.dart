import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../following/controller/following_controller.dart';
import '../following/model/following.dart';

mixin class StreamCommonState {
  AsyncValue<List<Following>?> getAsyncFollowingList(WidgetRef ref) =>
      ref.watch(followingControllerProvider);
}
