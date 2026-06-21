import 'bloc/following_bloc.dart';

abstract final class FollowingScreenString {
  static const signedOutTitle = '로그인이 필요합니다';
  static const signedOutMessage = '로그인하면 팔로우 한 라이브, 동영상, 채널, 카테고리를 볼 수 있습니다';
  static const moveToAuth = '로그인';
  static const liveLoading = '팔로잉 라이브를 불러오는 중입니다';
  static const vodLoading = '팔로잉 동영상을 불러오는 중입니다';
  static const channelLoading = '팔로잉 채널을 불러오는 중입니다';
  static const categoryLoading = '팔로잉 카테고리를 불러오는 중입니다';
  static const retry = '다시 시도';
  static const liveEmpty = '팔로우 중인 라이브가 없습니다';
  static const vodEmpty = '팔로우 중인 채널의 동영상이 없습니다';
  static const channelEmpty = '팔로우 중인 채널이 없습니다';
  static const categoryEmpty = '팔로우 중인 카테고리가 없습니다';
  static const liveError = '팔로잉 라이브를 불러오지 못했습니다';
  static const vodError = '팔로잉 동영상을 불러오지 못했습니다';
  static const channelError = '팔로잉 채널을 불러오지 못했습니다';
  static const categoryError = '팔로잉 카테고리를 불러오지 못했습니다';
  static const sortAction = '정렬';
  static const watchLive = '라이브 보기';
  static const moveToChannel = '채널로 이동';
  static const follow = '팔로우';
  static const unfollow = '팔로우 취소';
  static const confirmUnfollowTitle = '팔로우 취소';
  static const confirmUnfollowPrimary = '네';
  static const confirmUnfollowSecondary = '아니오';
  static const addToGroup = '그룹에 추가';
  static const groupListTitle = '그룹 목록';
  static const groupListEmpty = '그룹이 없습니다';
  static const noMoreData = '더 이상 불러올 항목이 없습니다';
  static const followSuccess = '팔로우 했습니다';
  static const followFailure = '팔로우에 실패했습니다';
  static const unfollowSuccess = '팔로우를 취소했습니다';
  static const unfollowFailure = '팔로우 취소에 실패했습니다';
  static const addToGroupSuccess = '그룹에 추가했습니다';
  static const addToGroupAlreadyExists = '이미 그룹에 추가된 채널입니다';
  static const addToGroupNoActiveGroup = '활성 그룹이 없습니다';
  static const addToGroupFailure = '그룹에 추가하지 못했습니다';

  static String tabLabel(FollowingTab tab) {
    return switch (tab) {
      FollowingTab.live => '라이브',
      FollowingTab.vod => '동영상',
      FollowingTab.channel => '채널',
      FollowingTab.category => '카테고리',
    };
  }

  static String confirmUnfollowContent(String channelName) {
    return '"$channelName" 채널 팔로우를 취소할까요?';
  }

  static String liveSortLabel(FollowingLiveSortOption option) {
    return switch (option) {
      FollowingLiveSortOption.popular => '시청자 많은 순',
      FollowingLiveSortOption.latest => '최신순',
      FollowingLiveSortOption.recommend => '추천순',
      FollowingLiveSortOption.oldest => '오래된 순',
      FollowingLiveSortOption.unpopular => '시청자 적은 순',
    };
  }
}
