import '../../../core/utils/utils.dart';
import 'bloc/category_detail_bloc.dart';
import 'category_detail_screen_string.dart';

String categoryDetailLoadingMessage(CategoryDetailTab tab) {
  return switch (tab) {
    CategoryDetailTab.live => CategoryDetailScreenString.liveLoading,
    CategoryDetailTab.vod => CategoryDetailScreenString.vodLoading,
  };
}

String categoryDetailEmptyMessage(CategoryDetailTab tab) {
  return switch (tab) {
    CategoryDetailTab.live => CategoryDetailScreenString.liveEmpty,
    CategoryDetailTab.vod => CategoryDetailScreenString.vodEmpty,
  };
}

String categoryDetailErrorMessage(CategoryDetailTab tab) {
  return switch (tab) {
    CategoryDetailTab.live => CategoryDetailScreenString.liveError,
    CategoryDetailTab.vod => CategoryDetailScreenString.vodError,
  };
}

String categoryDetailFeedbackMessage(CategoryDetailFeedbackType type) {
  return switch (type) {
    CategoryDetailFeedbackType.noMoreData =>
      CategoryDetailScreenString.noMoreData,
    CategoryDetailFeedbackType.loadMoreFailure =>
      CategoryDetailScreenString.loadMoreFailure,
    CategoryDetailFeedbackType.followSuccess =>
      CategoryDetailScreenString.followSuccess,
    CategoryDetailFeedbackType.followFailure =>
      CategoryDetailScreenString.followFailure,
    CategoryDetailFeedbackType.unfollowSuccess =>
      CategoryDetailScreenString.unfollowSuccess,
    CategoryDetailFeedbackType.unfollowFailure =>
      CategoryDetailScreenString.unfollowFailure,
  };
}

String categoryDetailFollowLabel(CategoryDetailState state) {
  return state.isFollowing
      ? CategoryDetailScreenString.unfollow
      : CategoryDetailScreenString.follow;
}

String formatCategoryDetailCount(int value) {
  return formatKoDecimal(value);
}
