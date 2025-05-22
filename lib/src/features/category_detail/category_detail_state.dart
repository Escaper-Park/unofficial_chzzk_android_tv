import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/constants/enums.dart'
    show VideoSortType, FilterType, ClipOrderType;
import 'controller/category_clip_controller.dart';
import 'controller/category_live_controller.dart';
import 'controller/category_vod_controller.dart';
import '../auth/controller/auth_controller.dart';
import '../following/controller/following_category_controller.dart';

import '../auth/model/auth.dart';
import '../live/model/live_info.dart';
import '../vod/model/vod.dart';
import '../category/model/category.dart';
import '../clip/model/clip.dart';

mixin class CategoryDetailState {
  AsyncValue<Auth?> getAuth(WidgetRef ref) => ref.watch(authControllerProvider);

  AsyncValue<List<LiveInfo>?> getAsyncCategoryLives(
    WidgetRef ref, {
    required Category category,
  }) =>
      ref.watch(categoryLiveControllerProvider(category: category));

  AsyncValue<List<Vod>?> getAsyncCategoryVods(
    WidgetRef ref, {
    required Category category,
  }) =>
      ref.watch(categoryVodControllerProvider(category: category));

  AsyncValue<List<Category>?> getAsyncCategoryFollowingList(WidgetRef ref) =>
      ref.watch(followingCategoryControllerProvider);

  AsyncValue<List<NaverClip>?> getAsyncCategoryClips(
    WidgetRef ref, {
    required Category category,
    required VideoSortType orderType,
    required FilterType filterType,
  }) {
    ClipOrderType clipOrderType = orderType == VideoSortType.popularClip
        ? ClipOrderType.popular
        : ClipOrderType.recent;

    return ref.watch(
      categoryClipControllerProvider(
        category: category,
        filterType: filterType,
        orderType: clipOrderType,
      ),
    );
  }
}
