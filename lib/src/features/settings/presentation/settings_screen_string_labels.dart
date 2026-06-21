part of 'settings_screen_string.dart';

String _settingsCategoryTitle(SettingsCategoryId category) {
  return switch (category) {
    SettingsCategoryId.general => '일반',
    SettingsCategoryId.liveStreaming => '라이브',
    SettingsCategoryId.multiview => '멀티뷰',
    SettingsCategoryId.vodStreaming => '동영상',
    SettingsCategoryId.chat => '채팅',
    SettingsCategoryId.updates => '업데이트 확인',
    SettingsCategoryId.faq => 'FAQ',
    SettingsCategoryId.appInfo => '앱 정보',
  };
}

String _settingsCategorySummary(SettingsCategoryId category) {
  return switch (category) {
    SettingsCategoryId.general => '앱 기본 설정',
    SettingsCategoryId.liveStreaming => '라이브 재생 기본값',
    SettingsCategoryId.multiview => '멀티뷰 재생 기본값',
    SettingsCategoryId.vodStreaming => '동영상 재생 기본값',
    SettingsCategoryId.chat => '플레이어 채팅 표시',
    SettingsCategoryId.updates => '최신 공개 버전 확인',
    SettingsCategoryId.faq => '자주 묻는 문제',
    SettingsCategoryId.appInfo => '버전과 프로젝트 정보',
  };
}

String _settingsCurrentVersion(String value) => '현재 $value';

String _settingsSeconds(int value) => '$value초';

String _settingsPercent(int value) => '$value%';

String _settingsRawValue(int value) => value.toString();

String _settingsToggleLabel(int value) {
  return value == 0
      ? SettingsScreenString.optionOff
      : SettingsScreenString.optionOn;
}

String _settingsResolutionLabel(int value) {
  return switch (value) {
    0 => SettingsScreenString.option360p,
    1 => SettingsScreenString.option480p,
    2 => SettingsScreenString.option720p,
    3 => SettingsScreenString.option1080p,
    4 => SettingsScreenString.optionAuto,
    _ => value.toString(),
  };
}

String _settingsLatencyLabel(int value) {
  return value == 0
      ? SettingsScreenString.optionHls
      : SettingsScreenString.optionLlHls;
}

String _settingsVideoViewTypeLabel(int value) {
  return switch (value) {
    0 => SettingsScreenString.optionTextureView,
    1 => SettingsScreenString.optionPlatformView,
    _ => value.toString(),
  };
}

String _settingsStreamingPreviewDurationLabel(int value) {
  return switch (value) {
    0 => _settingsSeconds(10),
    1 => _settingsSeconds(15),
    2 => _settingsSeconds(30),
    3 => _settingsSeconds(60),
    4 => '계속보기',
    _ => value.toString(),
  };
}

String _settingsChatWindowLabel(int value) {
  return switch (value) {
    0 => SettingsScreenString.optionOff,
    1 => SettingsScreenString.optionOverlay,
    2 => SettingsScreenString.optionSide,
    _ => value.toString(),
  };
}

String _settingsOverlayChatQuickPositionLabel(int value) {
  return switch (value) {
    0 => '좌측 상단',
    1 => '중앙 상단',
    2 => '우측 상단',
    3 => '좌측 중단',
    4 => '중앙',
    5 => '우측 중단',
    6 => '좌측 하단',
    7 => '중앙 하단',
    8 => '우측 하단',
    _ => value.toString(),
  };
}

String _settingsSideChatPositionLabel(int value) {
  return value == 0
      ? SettingsScreenString.optionLeft
      : SettingsScreenString.optionRight;
}

String _settingsMultiviewChatWindowLabel(int value) {
  return switch (value) {
    0 => SettingsScreenString.optionOff,
    1 => SettingsScreenString.optionOverlay,
    2 => SettingsScreenString.optionSide,
    _ => value.toString(),
  };
}

String _settingsMultiviewScreenModeLabel(int value) {
  return switch (value) {
    0 => SettingsScreenString.optionPbp,
    1 => SettingsScreenString.optionPip,
    2 => SettingsScreenString.optionFocus,
    _ => value.toString(),
  };
}

String _settingsMultiviewPipLayoutLabel(int value) {
  return value == 0
      ? SettingsScreenString.optionHorizontal
      : SettingsScreenString.optionVertical;
}

String _settingsVodPlaybackIntervalLabel(int value) {
  return switch (value) {
    0 => _settingsSeconds(5),
    1 => _settingsSeconds(10),
    2 => _settingsSeconds(30),
    _ => value.toString(),
  };
}

String _settingsBadgeCollectorLabel(int value) {
  return switch (value) {
    0 => SettingsScreenString.optionOff,
    1 => SettingsScreenString.optionWithChat,
    2 => SettingsScreenString.optionCollectorOnly,
    _ => value.toString(),
  };
}
