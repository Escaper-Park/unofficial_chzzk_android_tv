import 'bloc/home_bloc.dart';
import 'home_screen_string.dart';

String homeSectionTitle(HomeSectionId sectionId) {
  return switch (sectionId) {
    HomeSectionId.immersive => HomeScreenString.immersiveTitle,
    HomeSectionId.followingLive => HomeScreenString.followingLiveTitle,
    HomeSectionId.popularLive => HomeScreenString.popularLiveTitle,
    HomeSectionId.watchingHistory => HomeScreenString.watchingHistoryTitle,
    HomeSectionId.popularVod => HomeScreenString.popularVodTitle,
    HomeSectionId.followingCategory => HomeScreenString.followingCategoryTitle,
    HomeSectionId.trendingCategory => HomeScreenString.trendingCategoryTitle,
  };
}

String homeSectionEmptyMessage(HomeSectionId sectionId) {
  return switch (sectionId) {
    HomeSectionId.immersive => HomeScreenString.immersiveEmpty,
    HomeSectionId.followingLive ||
    HomeSectionId.popularLive => HomeScreenString.liveSectionEmpty,
    HomeSectionId.watchingHistory ||
    HomeSectionId.popularVod => HomeScreenString.vodSectionEmpty,
    HomeSectionId.followingCategory ||
    HomeSectionId.trendingCategory => HomeScreenString.categorySectionEmpty,
  };
}
