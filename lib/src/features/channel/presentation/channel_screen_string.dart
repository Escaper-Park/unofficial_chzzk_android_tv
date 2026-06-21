import 'bloc/channel_bloc.dart';

abstract final class ChannelScreenString {
  static const retry = '다시 시도';
  static const homeLoading = '채널을 불러오는 중입니다';
  static const vodLoading = '채널 동영상을 불러오는 중입니다';
  static const homeEmpty = '표시할 라이브나 동영상이 없습니다';
  static const vodEmpty = '채널 동영상이 없습니다';
  static const homeError = '채널을 불러오지 못했습니다';
  static const vodError = '채널 동영상을 불러오지 못했습니다';
  static const latestVods = '최신 동영상';
  static const liveNow = '라이브';
  static const sortAction = '정렬';
  static const follow = '팔로우';
  static const following = '팔로잉';
  static const unfollow = '팔로우 취소';
  static const fallbackChannelName = '채널';
  static const confirmUnfollowTitle = '팔로우 취소';
  static const confirmUnfollowPrimary = '네';
  static const confirmUnfollowSecondary = '아니오';
  static const addToGroup = '그룹에 추가';
  static const groupListTitle = '그룹 목록';
  static const groupListEmpty = '그룹이 없습니다';
  static const groupListLoading = '그룹을 불러오는 중입니다';
  static const noMoreData = '더 이상 불러올 항목이 없습니다';
  static const followSuccess = '팔로우 했습니다';
  static const followFailure = '팔로우에 실패했습니다';
  static const unfollowSuccess = '팔로우를 취소했습니다';
  static const unfollowFailure = '팔로우 취소에 실패했습니다';
  static const addToGroupSuccess = '그룹에 추가했습니다';
  static const addToGroupAlreadyExists = '이미 그룹에 추가된 채널입니다';
  static const addToGroupFailure = '그룹에 추가하지 못했습니다';

  static String tabLabel(ChannelTab tab) {
    return switch (tab) {
      ChannelTab.home => '홈',
      ChannelTab.vod => '동영상',
    };
  }

  static String vodSortLabel(ChannelVodSortOption option) {
    return switch (option) {
      ChannelVodSortOption.latest => '최신순',
      ChannelVodSortOption.popular => '인기순',
    };
  }

  static String sortLabel(ChannelState state) {
    return vodSortLabel(state.vodSortOption);
  }

  static String followerCount(int count) {
    return '팔로워 ${_commaSeparated(count)}명';
  }

  static String confirmUnfollowContent(String channelName) {
    return '"$channelName" 채널 팔로우를 취소할까요?';
  }
}

String _commaSeparated(int count) {
  final digits = count.toString();
  final buffer = StringBuffer();

  for (var index = 0; index < digits.length; index++) {
    if (index > 0 && (digits.length - index) % 3 == 0) {
      buffer.write(',');
    }

    buffer.write(digits[index]);
  }

  return buffer.toString();
}
