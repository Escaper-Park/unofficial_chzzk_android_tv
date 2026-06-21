enum PlayerChatPresentationMode {
  hidden,
  overlay,
  sidePanel;

  static PlayerChatPresentationMode fromSettingsIndex(int index) {
    return switch (index) {
      1 => PlayerChatPresentationMode.overlay,
      2 => PlayerChatPresentationMode.sidePanel,
      _ => PlayerChatPresentationMode.hidden,
    };
  }

  static PlayerChatPresentationMode fromLiveSettingsIndex(int index) {
    return fromSettingsIndex(index);
  }
}
