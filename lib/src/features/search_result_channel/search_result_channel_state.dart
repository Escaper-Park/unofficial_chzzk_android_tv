import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/constants/enums.dart' show AppRoute;
import '../channel/controller/channel_controller.dart';
import '../channel/model/channel.dart';

mixin class SearchResultChannelState {
  AsyncValue<Channel?> getAsyncChannel(WidgetRef ref) => ref.watch(
        channelControllerProvider(
          routeName: AppRoute.searchResultChannel.routeName,
        ),
      );
}
