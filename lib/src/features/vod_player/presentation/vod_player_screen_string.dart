import 'bloc/vod_player_bloc.dart';

abstract final class VodPlayerScreenString {
  static const browseLoadMoreFailure = '동영상 목록을 더 불러오지 못했습니다';

  static const loading = '동영상을 불러오는 중입니다';
  static const noVodSelected = '선택된 동영상이 없습니다';
  static const loadFailed = '동영상 정보를 불러오지 못했습니다';
  static const entryBlocked = '시청이 제한된 동영상입니다';
  static const playbackSourceMissing = '재생 주소를 찾지 못했습니다';
  static const playbackFailed = '동영상 재생에 실패했습니다';
  static const playbackEnded = '끝까지 시청했습니다';
  static const retry = '다시 시도';
  static const exitNotice = '한 번 더 누르면 플레이어를 종료합니다';
  static const browseTitle = '채널 동영상 최신순';
  static const browseLoading = '동영상을 불러오는 중입니다.';
  static const browseEmpty = '채널 동영상이 없습니다.';
  static const browseFailed = '채널 동영상을 불러오지 못했습니다.';
  static const browseClose = '탐색 닫기';

  static const play = '재생';
  static const pause = '일시정지';
  static const chatMode = '채팅창 모드';
  static const chapters = '챕터';
  static const favorite = '즐겨찾기';
  static const settings = '설정';
  static const chatSettings = '채팅 설정';
  static const resolutionSettings = '해상도 설정';
  static const soundSettings = '소리 설정';
  static const speedSettings = '배속 설정';
  static const noChapters = '챕터가 없습니다';
  static const follow = '팔로우';
  static const following = '팔로잉';
  static const addToGroup = '그룹에 추가';
  static const noGroup = '그룹 없음';
  static const muted = '음소거';
  static const normalSpeed = '보통';
  static const followSuccess = '팔로우 했습니다';
  static const followFailure = '팔로우에 실패했습니다';
  static const unfollowSuccess = '팔로우를 취소했습니다';
  static const unfollowFailure = '팔로우 취소에 실패했습니다';
  static const groupAddSuccess = '그룹에 추가했습니다';
  static const groupAddAlreadyExists = '이미 그룹에 추가되어 있습니다';
  static const groupAddFailure = '그룹 추가에 실패했습니다';
  static const unfollowDialogTitle = '채널 팔로우를 취소';
  static const unfollowDialogContent = '채널 팔로우를 취소하시겠습니까?';
  static const unfollowDialogConfirm = '네';
  static const unfollowDialogCancel = '아니오';

  static String failureMessage(VodPlayerFailureReason? reason) {
    return switch (reason) {
      VodPlayerFailureReason.missingInitialTarget => noVodSelected,
      VodPlayerFailureReason.detailLoadFailed => loadFailed,
      VodPlayerFailureReason.entryBlocked => entryBlocked,
      VodPlayerFailureReason.playbackSourceMissing => playbackSourceMissing,
      VodPlayerFailureReason.playbackFailed => playbackFailed,
      null => loadFailed,
    };
  }

  static String feedbackMessage(VodPlayerFeedbackType feedbackType) {
    return switch (feedbackType) {
      VodPlayerFeedbackType.followSuccess => followSuccess,
      VodPlayerFeedbackType.followFailure => followFailure,
      VodPlayerFeedbackType.unfollowSuccess => unfollowSuccess,
      VodPlayerFeedbackType.unfollowFailure => unfollowFailure,
      VodPlayerFeedbackType.groupAddSuccess => groupAddSuccess,
      VodPlayerFeedbackType.groupAddAlreadyExists => groupAddAlreadyExists,
      VodPlayerFeedbackType.groupAddFailure => groupAddFailure,
      VodPlayerFeedbackType.browseLoadMoreFailure => browseLoadMoreFailure,
    };
  }

  static String browseFallbackMessage(VodPlayerBrowseLoadStatus status) {
    return switch (status) {
      VodPlayerBrowseLoadStatus.initial ||
      VodPlayerBrowseLoadStatus.loading => browseLoading,
      VodPlayerBrowseLoadStatus.success => browseEmpty,
      VodPlayerBrowseLoadStatus.empty => browseEmpty,
      VodPlayerBrowseLoadStatus.failure => browseFailed,
    };
  }

  static String? browseFallbackActionLabel(
    VodPlayerBrowseFallbackAction action,
  ) {
    return switch (action) {
      VodPlayerBrowseFallbackAction.none => null,
      VodPlayerBrowseFallbackAction.closeBrowse => browseClose,
    };
  }

  static String speedLabel(double speed) {
    if (speed == 1) {
      return normalSpeed;
    }

    final value = speed == speed.truncateToDouble()
        ? speed.toStringAsFixed(0)
        : speed.toStringAsFixed(2).replaceFirst(RegExp(r'0$'), '');
    return '${value}x';
  }

  static String timeSummary(String positionText, String durationText) {
    return '$positionText / $durationText';
  }
}
