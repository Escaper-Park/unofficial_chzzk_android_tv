import 'bloc/live_player_bloc.dart';

abstract final class LivePlayerScreenString {
  static const loading = '라이브를 불러오는 중입니다';
  static const noLiveSelected = '선택된 라이브가 없습니다';
  static const loadFailed = '라이브를 불러오지 못했습니다';
  static const entryBlocked = '시청이 제한된 라이브입니다';
  static const playbackSourceMissing = '재생 주소를 찾지 못했습니다';
  static const playbackFailed = '라이브 재생에 실패했습니다';
  static const liveEnded = '라이브가 종료되었습니다';
  static const retry = '다시 시도';
  static const retrySelectHint = '확인 버튼: 다시 시도';
  static const exitNotice = '한 번 더 누르면 플레이어를 종료합니다';

  static const followSuccess = '팔로우 했습니다';
  static const followFailure = '팔로우에 실패했습니다';
  static const unfollowSuccess = '팔로우를 취소했습니다';
  static const unfollowFailure = '팔로우 취소에 실패했습니다';
  static const groupAddSuccess = '그룹에 추가했습니다';
  static const groupAddAlreadyExists = '이미 그룹에 추가되어 있습니다';
  static const groupAddFailure = '그룹 추가에 실패했습니다';
  static const multiviewLiveAlreadyAdded = '이미 멀티뷰에 추가된 방송입니다';
  static const unfollowDialogTitle = '채널 팔로우를 취소할까요?';
  static const unfollowDialogContent = '채널을 팔로잉에서 제거합니다';
  static const unfollowDialogConfirm = '팔로우 취소';
  static const unfollowDialogCancel = '아니오';

  static const overlayPlay = '재생';
  static const overlayPause = '일시정지';
  static const overlayRealtime = '실시간';
  static const overlayChatWindowMode = '채팅창 모드';
  static const overlayMultiviewChatMode = '멀티뷰 채팅 모드';
  static const overlayFavorite = '즐겨찾기';
  static const overlaySettings = '설정';
  static const overlayViewMode = '뷰 모드';
  static const overlayScreenMode = '화면 모드';
  static const overlayMultiviewSettings = '멀티뷰 설정';
  static const overlayChatSettings = '채팅 설정';
  static const overlayResolutionSettings = '화질 설정';
  static const overlaySoundSettings = '소리 설정';
  static const overlayGroupSettings = '그룹 설정';
  static const overlayBroadcastSettings = '방송 종료';
  static const overlayMultiviewDefaultSettings = '멀티뷰 기본 설정';
  static const overlayMultiviewResolutionSettings = '멀티뷰 화질 설정';
  static const overlayMultiviewSoundSettings = '멀티뷰 소리 설정';
  static const overlayMultiviewInfo = '멀티뷰 방송 정보';
  static const overlaySingleView = '싱글뷰';
  static const overlayMultiView = '멀티뷰';
  static const overlayFollowing = '팔로잉';
  static const overlayFollow = '팔로우';
  static const overlayAddToGroup = '그룹에 추가';
  static const overlayNoGroup = '그룹 없음';
  static const overlayShowGroup = '그룹 보기';
  static const overlayBroadcastFallback = '방송';
  static const replacementSlotTitle = '교체할 방송';
  static const closeSlotDialogContent = '멀티뷰에서 해당 방송을 닫습니다';
  static const closeSlotDialogConfirm = '종료';
  static const closeSlotDialogCancel = '취소';

  static const browseLoading = '라이브를 불러오는 중입니다';
  static const browseFollowingEmpty = '팔로잉 라이브가 없습니다';
  static const browsePopularFailed = '인기 라이브를 불러오지 못했습니다';
  static const browseCategoryEmpty = '카테고리 라이브가 없습니다';
  static const browseRecentEmpty = '최근 시청한 라이브가 없습니다';
  static const browseGroupGuide = '그룹을 활성화하면 그룹 라이브를 볼 수 있습니다';
  static const browseShowPopular = '인기 라이브 보기';
  static const browseClose = '탐색 닫기';

  static String browseSectionTitle(LivePlayerBrowseSection section) {
    return switch (section) {
      LivePlayerBrowseSection.following => '팔로잉 라이브',
      LivePlayerBrowseSection.popular => '인기 라이브',
      LivePlayerBrowseSection.category => '카테고리 라이브',
      LivePlayerBrowseSection.recent => '최근 시청 라이브',
      LivePlayerBrowseSection.group => '그룹 라이브',
    };
  }

  static String closeSlotDialogTitle(String channelName) {
    return '$channelName 방송을 종료하시겠습니까?';
  }

  static String browseCardBadge(String viewerCount, String category) {
    return '$viewerCount · $category';
  }

  static String multiviewLayoutModeLabel(
    LivePlayerMultiviewLayoutMode mode,
  ) {
    return switch (mode) {
      LivePlayerMultiviewLayoutMode.pbp => 'PBP',
      LivePlayerMultiviewLayoutMode.pip => 'PIP',
      LivePlayerMultiviewLayoutMode.focus => '포커스',
    };
  }

  static String browseFallbackMessage(
    LivePlayerBrowseSection section,
    LivePlayerBrowseLoadStatus status,
  ) {
    if (status == LivePlayerBrowseLoadStatus.loading ||
        status == LivePlayerBrowseLoadStatus.initial) {
      return browseLoading;
    }

    return switch (section) {
      LivePlayerBrowseSection.following => browseFollowingEmpty,
      LivePlayerBrowseSection.popular => browsePopularFailed,
      LivePlayerBrowseSection.category => browseCategoryEmpty,
      LivePlayerBrowseSection.recent => browseRecentEmpty,
      LivePlayerBrowseSection.group => browseGroupGuide,
    };
  }

  static String? browseFallbackActionLabel(
    LivePlayerBrowseFallbackAction action,
  ) {
    return switch (action) {
      LivePlayerBrowseFallbackAction.none => null,
      LivePlayerBrowseFallbackAction.showPopular => browseShowPopular,
      LivePlayerBrowseFallbackAction.closeBrowse => browseClose,
    };
  }

  static String failureMessage(LivePlayerFailureReason? reason) {
    return switch (reason) {
      LivePlayerFailureReason.missingInitialTarget => noLiveSelected,
      LivePlayerFailureReason.liveDetailLoadFailed => loadFailed,
      LivePlayerFailureReason.entryBlocked => entryBlocked,
      LivePlayerFailureReason.playbackSourceMissing => playbackSourceMissing,
      LivePlayerFailureReason.playbackFailed => playbackFailed,
      null => loadFailed,
    };
  }

  static String feedbackMessage(LivePlayerFeedbackType feedbackType) {
    return switch (feedbackType) {
      LivePlayerFeedbackType.followSuccess => followSuccess,
      LivePlayerFeedbackType.followFailure => followFailure,
      LivePlayerFeedbackType.unfollowSuccess => unfollowSuccess,
      LivePlayerFeedbackType.unfollowFailure => unfollowFailure,
      LivePlayerFeedbackType.groupAddSuccess => groupAddSuccess,
      LivePlayerFeedbackType.groupAddAlreadyExists => groupAddAlreadyExists,
      LivePlayerFeedbackType.groupAddFailure => groupAddFailure,
      LivePlayerFeedbackType.multiviewLiveAlreadyAdded =>
        multiviewLiveAlreadyAdded,
    };
  }
}
