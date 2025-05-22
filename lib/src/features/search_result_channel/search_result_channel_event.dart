import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/constants/enums.dart' show AppRoute;
import '../channel/controller/channel_controller.dart';

mixin class SearchResultChannelEvent {
  Future<void> setCurrentSelectedChannel(
    WidgetRef ref,
    String channelId,
  ) async {
    ref
        .read(
          channelControllerProvider(
            routeName: AppRoute.searchResultChannel.routeName,
          ).notifier,
        )
        .setCurrentChannel(channelId: channelId);
  }
}
