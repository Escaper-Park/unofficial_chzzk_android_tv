import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/constants/enums.dart'
    show FilterType, ClipOrderType, VideoSortType;
import '../clip/model/clip.dart';
import 'controller/clip_popular_controller.dart';

mixin class ClipPopularState {
  AsyncValue<List<NaverClip>?> getAsyncPopularClips(
    WidgetRef ref, {
    required VideoSortType orderType,
    required FilterType filterType,
  }) {
    ClipOrderType clipOrderType = orderType == VideoSortType.popularClip
        ? ClipOrderType.popular
        : ClipOrderType.recommend;

    return ref.watch(
      clipPopularControllerProvider(
        filterType: filterType,
        orderType: clipOrderType,
      ),
    );
  }
}
