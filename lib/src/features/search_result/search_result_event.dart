import 'package:flutter/material.dart';
import '../../common/constants/enums.dart' show AppRoute;
import '../../utils/extensions/custom_extensions.dart';

import '../channel/model/channel.dart';

mixin class SearchResultEvent {
  void pushSearchResultChannel(
    BuildContext context, {
    required Channel channel,
  }) {
    context.pushTo(
      context: context,
      currentLocation: AppRoute.searchResult,
      appRoute: AppRoute.searchResultChannel,
      pathParameters: {'channelId': channel.channelId},
    );
  }
}
