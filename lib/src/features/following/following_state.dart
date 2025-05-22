import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/constants/enums.dart' show AppRoute;
import '../auth/controller/auth_controller.dart';
import '../auth/model/auth.dart';

import '../channel/controller/channel_controller.dart';
import '../channel/model/channel.dart';
import './controller/following_controller.dart';
import './model/following.dart';

mixin class FollowingState {
  AsyncValue<Auth?> getAuth(WidgetRef ref) => ref.watch(authControllerProvider);

  AsyncValue<List<Following>?> getAsyncFollowingList(WidgetRef ref) =>
      ref.watch(followingControllerProvider);

  AsyncValue<Channel?> getAsyncChannel(WidgetRef ref) => ref.watch(
        channelControllerProvider(routeName: AppRoute.following.routeName),
      );
}
