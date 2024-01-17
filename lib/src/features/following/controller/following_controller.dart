import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/repository/channel_repository.dart';

import '../../channel/model/channel.dart';
import '../model/following.dart';

part 'following_controller.g.dart';

@riverpod
class FollowingController extends _$FollowingController {
  @override
  FutureOr<Channel?> build() {
    return null;
  }

  Future<void> setCurrentChannel(Following following) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final channel = await ref
          .watch(channelRepositoryProvider)
          .getChannel(following.channelId);

      return channel;
    });
  }
}
