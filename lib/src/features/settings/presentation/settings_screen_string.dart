import '../domain/entities/settings_preferences.dart';

part 'settings_screen_string_labels.dart';

abstract final class SettingsScreenString {
  static const title = '설정';
  static const loading = '설정을 불러오는 중';
  static const loadFailed = '설정을 불러오지 못했습니다';
  static const retry = '다시 시도';
  static const open = '열기';
  static const saveFailed = '설정을 저장하지 못했습니다';
  static const reset = '설정 초기화';
  static const updateCheckTitle = '최신 버전 확인';
  static const updateCheckDescription = 'GitHub Release에서 최신 버전을 확인합니다';
  static const updateChecking = '업데이트 확인 중';
  static const updateFailed = '업데이트를 확인하지 못했습니다';
  static const latestVersion = '최신 버전입니다';
  static const updateAvailable = '새 버전이 있습니다';
  static const releaseNotes = 'Release note';
  static const noReleaseNotes = 'Release note가 없습니다';
  static const generalShowImmersiveTitle = '몰입형 추천';
  static const generalShowImmersiveDescription = '홈 화면에 몰입형 추천 섹션을 표시합니다';
  static const generalShowFollowingLiveTitle = '팔로잉 라이브';
  static const generalShowFollowingLiveDescription = '홈 화면에 팔로잉 채널 라이브를 표시합니다';
  static const generalShowPopularLiveTitle = '인기 라이브';
  static const generalShowPopularLiveDescription = '홈 화면에 인기 라이브를 표시합니다';
  static const generalShowWatchingHistoryTitle = '시청 기록';
  static const generalShowWatchingHistoryDescription = '홈 화면에 시청 기록을 표시합니다';
  static const generalShowPopularVodTitle = '인기 동영상';
  static const generalShowPopularVodDescription = '홈 화면에 인기 동영상을 표시합니다';
  static const generalShowFollowingCategoryTitle = '팔로잉 카테고리';
  static const generalShowFollowingCategoryDescription =
      '홈 화면에 팔로잉 카테고리를 표시합니다';
  static const generalShowTrendingCategoryTitle = '인기 카테고리';
  static const generalShowTrendingCategoryDescription = '홈 화면에 인기 카테고리를 표시합니다';
  static const generalStreamingPreviewTitle = '스트리밍 미리보기';
  static const generalStreamingPreviewDescription = '라이브 스트림 미리보기를 사용합니다';
  static const generalStreamingPreviewAudioTitle = '미리보기 소리';
  static const generalStreamingPreviewAudioDescription = '미리보기 재생 중 소리를 켭니다';
  static const generalStreamingPreviewDelayTitle = '미리보기 대기 시간';
  static const generalStreamingPreviewDelayDescription =
      '미리보기를 시작하기까지 기다리는 시간입니다';
  static const generalStreamingPreviewDurationTitle = '미리보기 지속 시간';
  static const generalStreamingPreviewDurationDescription =
      '미리보기를 재생한 뒤 유지하는 시간입니다';
  static const generalImmersivePreviewResolutionTitle = '몰입형 화면 미리보기 화질';
  static const generalImmersivePreviewResolutionDescription =
      '몰입형 화면 미리보기의 기본 화질입니다';
  static const generalLiveCardPreviewResolutionTitle = '라이브 카드 미리보기 화질';
  static const generalLiveCardPreviewResolutionDescription =
      '라이브 카드 미리보기의 기본 화질입니다';
  static const generalOverlayControlsDisplayTimeTitle = '컨트롤 표시 시간';
  static const generalOverlayControlsDisplayTimeDescription =
      '플레이어 컨트롤을 유지하는 시간입니다';
  static const generalVideoViewTypeTitle = '동영상 뷰 타입';
  static const generalVideoViewTypeDescription =
      '라이브와 동영상 플레이어의 동영상 표시 방식을 선택합니다';

  static const liveLatencyTitle = '지연 시간';
  static const liveLatencyDescription = '라이브 재생 지연 시간 모드입니다';
  static const liveShowGroupControlsTitle = '플레이어 그룹 컨트롤 표시';
  static const liveShowGroupControlsDescription = '플레이어에 그룹 컨트롤을 표시합니다';
  static const liveDefaultResolutionTitle = '기본 라이브 화질';
  static const liveDefaultResolutionDescription = '라이브 플레이어의 기본 재생 화질입니다';
  static const liveChatWindowTitle = '라이브 채팅창';
  static const liveChatWindowDescription = '라이브 플레이어의 기본 채팅 표시 방식입니다';
  static const liveMultiviewMaxCountTitle = '멀티뷰 최대 개수';
  static const liveMultiviewMaxCountDescription = '멀티뷰에 동시에 표시할 방송 개수입니다';
  static const liveMultiviewResolutionTitle = '멀티뷰 화질';
  static const liveMultiviewResolutionDescription = '멀티뷰의 기본 재생 화질입니다';
  static const liveMultiviewScreenModeTitle = '멀티뷰 화면 모드';
  static const liveMultiviewScreenModeDescription = '멀티뷰의 기본 화면 배치 방식입니다';
  static const liveMultiviewChatWindowTitle = '멀티뷰 채팅창';
  static const liveMultiviewChatWindowDescription = '멀티뷰의 기본 채팅 표시 방식입니다';
  static const liveMultiviewChatPositionXTitle = '멀티뷰 채팅 가로 위치';
  static const liveMultiviewChatPositionXDescription = '멀티뷰 오버레이 채팅의 가로 위치입니다';
  static const liveMultiviewChatPositionYTitle = '멀티뷰 채팅 세로 위치';
  static const liveMultiviewChatPositionYDescription = '멀티뷰 오버레이 채팅의 세로 위치입니다';
  static const liveMultiviewPipLayoutTitle = '멀티뷰 PIP 배치';
  static const liveMultiviewPipLayoutDescription = '멀티뷰 PIP 배치 방향을 설정합니다';
  static const liveMultiviewPipPositionXTitle = '멀티뷰 PIP 가로 위치';
  static const liveMultiviewPipPositionXDescription = '멀티뷰 PIP 영역의 가로 위치입니다';
  static const liveMultiviewPipPositionYTitle = '멀티뷰 PIP 세로 위치';
  static const liveMultiviewPipPositionYDescription = '멀티뷰 PIP 영역의 세로 위치입니다';
  static const liveMultiviewPipSizeTitle = '멀티뷰 PIP 크기';
  static const liveMultiviewPipSizeDescription = '멀티뷰 PIP 영역의 크기입니다';

  static const vodDefaultResolutionTitle = '기본 동영상 화질';
  static const vodDefaultResolutionDescription = '동영상 플레이어의 기본 재생 화질입니다';
  static const vodChatWindowTitle = '동영상 채팅창';
  static const vodChatWindowDescription = '동영상 플레이어의 기본 채팅 표시 방식입니다';
  static const vodPlaybackIntervalTitle = '동영상 시간 이동 간격';
  static const vodPlaybackIntervalDescription = '좌/우 버튼을 눌렀을 때 동영상 시간 이동 간격입니다';

  static const chatOverlayQuickPositionTitle = '오버레이 채팅 빠른 위치';
  static const chatOverlayQuickPositionDescription = '좌/우 키로 이동할 오버레이 채팅 위치입니다';
  static const chatOverlayPositionXTitle = '오버레이 채팅 가로 위치';
  static const chatOverlayPositionXDescription = '오버레이 채팅의 가로 위치입니다';
  static const chatOverlayPositionYTitle = '오버레이 채팅 세로 위치';
  static const chatOverlayPositionYDescription = '오버레이 채팅의 세로 위치입니다';
  static const chatOverlayPanelHeightTitle = '오버레이 채팅 높이';
  static const chatOverlayPanelHeightDescription = '오버레이 채팅 패널의 높이입니다';
  static const chatOverlayPanelWidthTitle = '오버레이 채팅 너비';
  static const chatOverlayPanelWidthDescription = '오버레이 채팅 패널의 너비입니다';
  static const chatSidePositionTitle = '사이드 채팅 위치';
  static const chatSidePositionDescription = '사이드 채팅 패널을 표시할 방향입니다';
  static const chatSideWidthTitle = '사이드 채팅 너비';
  static const chatSideWidthDescription = '사이드 채팅 패널의 너비입니다';
  static const chatMessageFontSizeTitle = '채팅 글자 크기';
  static const chatMessageFontSizeDescription = '채팅 메시지 글자 크기입니다';
  static const chatPanelTransparencyTitle = '전체 채팅 패널 투명도';
  static const chatPanelTransparencyDescription = '전체 채팅 패널의 투명도입니다';
  static const chatContainerTitle = '채팅 컨테이너';
  static const chatContainerDescription = '채팅 메시지에 컨테이너 배경을 사용합니다';
  static const chatBubbleTransparencyTitle = '채팅 말풍선 투명도';
  static const chatBubbleTransparencyDescription = '각 채팅 말풍선의 투명도입니다';
  static const chatHorizontalMarginTitle = '채팅 가로 여백';
  static const chatHorizontalMarginDescription = '채팅 컨테이너의 가로 여백입니다';
  static const chatVerticalMarginTitle = '채팅 세로 여백';
  static const chatVerticalMarginDescription = '채팅 컨테이너의 세로 여백입니다';
  static const chatBubbleVerticalGapTitle = '채팅 말풍선 간격';
  static const chatBubbleVerticalGapDescription = '채팅 말풍선 사이의 세로 간격입니다';
  static const chatTimeTitle = '채팅 시간';
  static const chatTimeDescription = '채팅 메시지 시간을 표시합니다';
  static const chatNicknameTitle = '닉네임';
  static const chatNicknameDescription = '보낸 사람의 닉네임을 표시합니다';
  static const chatDonationTitle = '후원 표시';
  static const chatDonationDescription = '후원 메시지를 표시합니다';
  static const chatUserBadgesTitle = '사용자 배지';
  static const chatUserBadgesDescription = '사용자 배지를 표시합니다';
  static const chatBadgeCollectorHeightTitle = '배지 모음 높이';
  static const chatBadgeCollectorHeightDescription = '배지 모음 패널의 높이입니다';
  static const chatBadgeCollectorPositionXTitle = '배지 모음 가로 위치';
  static const chatBadgeCollectorPositionXDescription = '배지 모음의 가로 위치입니다';
  static const chatBadgeCollectorPositionYTitle = '배지 모음 세로 위치';
  static const chatBadgeCollectorPositionYDescription = '배지 모음의 세로 위치입니다';
  static const chatBadgeCollectorDisplayTitle = '배지 모음 표시';
  static const chatBadgeCollectorDisplayDescription = '배지 모음의 표시 방식을 선택합니다';

  static const faqPlaybackNotStartingTitle = '재생이 시작되지 않음';
  static const faqPlaybackNotStartingDescription =
      '네트워크 상태를 확인하고 라이브나 동영상을 다시 켜주세요. TV 전원을 완전히 종료하고 앱을 다시 실행해주세요';
  static const faqLoginPersistenceTitle = '로그인이 유지되지 않음';
  static const faqLoginPersistenceDescription =
      '네이버 쿠키가 만료되었을 수 있습니다.\nPC 또는 모바일에서 네이버 계정을 로그인 한 다음 로그인 목록에서 사용하지 않는 세션을 전부 삭제하고 로그인을 다시 시도해주세요';
  static const faqOtherIssueTitle = '기타 문제';
  static const faqOtherIssueDescription =
      'TV를 완전히 종료하고 앱을 다시 실행해주세요. 그래도 해결되지 않는 다면 앱을 완전히 삭제하고 재설치 해주세요';
  static const appInfoVersionTitle = '버전';
  static const appInfoVersionDescription = '현재 설치된 앱 버전입니다';
  static const appInfoGithubTitle = 'GitHub';
  static const appInfoGithubDescription =
      'https://github.com/Escaper-Park/unofficial_chzzk_android_tv';
  static const appInfoCreatorTitle = '제작자';
  static const appInfoCreatorDescription = 'escaper.bgp@gmail.com';
  static const appInfoOpenSourceLicensesTitle = '오픈소스 라이선스';
  static const appInfoOpenSourceLicensesDescription =
      '앱에서 사용하는 패키지 라이선스를 확인합니다';
  static const noLicenseNotices = '라이선스 고지가 없습니다';
  static const unknownLicensePackage = '알 수 없는 패키지';

  static const optionOff = '끄기';
  static const optionOn = '켜기';
  static const optionOverlay = '오버레이';
  static const optionSide = '사이드';
  static const optionHls = 'HLS';
  static const optionLlHls = 'LLHLS';
  static const option360p = '360p';
  static const option480p = '480p';
  static const option720p = '720p';
  static const option1080p = '1080p';
  static const optionAuto = '자동';
  static const optionWithChat = '채팅과 함께';
  static const optionCollectorOnly = '배지만';
  static const optionTextureView = 'TextureView';
  static const optionPlatformView = 'PlatformView';
  static const optionLeft = '왼쪽';
  static const optionRight = '오른쪽';
  static const optionHorizontal = '가로';
  static const optionVertical = '세로';
  static const optionPbp = 'PBP';
  static const optionPip = 'PIP';
  static const optionFocus = '포커스';

  static String categoryTitle(SettingsCategoryId category) =>
      _settingsCategoryTitle(category);

  static String categorySummary(SettingsCategoryId category) =>
      _settingsCategorySummary(category);

  static String currentVersion(String value) => _settingsCurrentVersion(value);

  static String seconds(int value) => _settingsSeconds(value);

  static String percent(int value) => _settingsPercent(value);

  static String rawValue(int value) => _settingsRawValue(value);

  static String toggleLabel(int value) => _settingsToggleLabel(value);

  static String resolutionLabel(int value) => _settingsResolutionLabel(value);

  static String latencyLabel(int value) => _settingsLatencyLabel(value);

  static String videoViewTypeLabel(int value) =>
      _settingsVideoViewTypeLabel(value);

  static String streamingPreviewDurationLabel(int value) =>
      _settingsStreamingPreviewDurationLabel(value);

  static String chatWindowLabel(int value) => _settingsChatWindowLabel(value);

  static String overlayChatQuickPositionLabel(int value) =>
      _settingsOverlayChatQuickPositionLabel(value);

  static String sideChatPositionLabel(int value) =>
      _settingsSideChatPositionLabel(value);

  static String multiviewChatWindowLabel(int value) =>
      _settingsMultiviewChatWindowLabel(value);

  static String multiviewScreenModeLabel(int value) =>
      _settingsMultiviewScreenModeLabel(value);

  static String multiviewPipLayoutLabel(int value) =>
      _settingsMultiviewPipLayoutLabel(value);

  static String vodPlaybackIntervalLabel(int value) =>
      _settingsVodPlaybackIntervalLabel(value);

  static String badgeCollectorLabel(int value) =>
      _settingsBadgeCollectorLabel(value);
}
