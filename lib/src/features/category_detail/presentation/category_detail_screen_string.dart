import 'bloc/category_detail_bloc.dart';

abstract final class CategoryDetailScreenString {
  static const fallbackTitle = '카테고리';
  static const retry = '다시 시도';
  static const follow = '팔로우';
  static const unfollow = '팔로잉';
  static const unfollowDialogTitle = '카테고리 팔로우 취소';
  static const unfollowDialogContent = '카테고리 팔로우를 취소하시겠습니까?';
  static const unfollowConfirm = '네';
  static const unfollowCancel = '아니오';
  static const liveLoading = '라이브를 불러오는 중입니다';
  static const vodLoading = '동영상을 불러오는 중입니다';
  static const liveEmpty = '진행 중인 라이브가 없습니다';
  static const vodEmpty = '등록된 동영상이 없습니다';
  static const liveError = '라이브를 불러오지 못했습니다';
  static const vodError = '동영상을 불러오지 못했습니다';
  static const noMoreData = '더 이상 불러올 항목이 없습니다';
  static const loadMoreFailure = '더 불러오지 못했습니다';
  static const followSuccess = '카테고리를 팔로우 했습니다';
  static const followFailure = '카테고리를 팔로우 하지 못했습니다';
  static const unfollowSuccess = '카테고리 팔로우를 취소했습니다';
  static const unfollowFailure = '카테고리 팔로우 취소에 실패했습니다';

  static String tabLabel(CategoryDetailTab tab) {
    return switch (tab) {
      CategoryDetailTab.live => '라이브',
      CategoryDetailTab.vod => '동영상',
    };
  }

  static String openLiveCount(String count) {
    return '$count개 방송';
  }

  static String viewerCount(String count) {
    return '$count명 시청';
  }
}
