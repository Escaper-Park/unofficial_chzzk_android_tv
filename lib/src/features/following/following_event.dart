import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/extensions/custom_extensions.dart';
import '../../common/constants/enums.dart' show AppRoute;
import '../channel/controller/channel_controller.dart';
import '../home/controller/home_refresh_controller.dart';

mixin class FollowingEvent {
  AppRoute get _currentLocation => AppRoute.following;

  void goHome(WidgetRef ref, BuildContext context) {
    context.goTo(
      context: context,
      currentLocation: _currentLocation,
      appRoute: AppRoute.home,
    );

    ref.read(homeRefreshControllerProvider.notifier).refresh();
  }

  Future<void> setCurrentSelectedChannel(
    WidgetRef ref, {
    required String channelId,
  }) async {
    await ref
        .read(
          channelControllerProvider(routeName: _currentLocation.routeName)
              .notifier,
        )
        .setCurrentChannel(channelId: channelId);
  }
}
