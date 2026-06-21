import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_settings.freezed.dart';
part 'chat_settings.g.dart';

@freezed
abstract class ChatSettings with _$ChatSettings {
  const ChatSettings._();

  const factory ChatSettings({
    @Default(5) int overlayChatQuickPositionIndex,
    @Default(100) int overlayChatPositionX,
    @Default(50) int overlayChatPositionY,
    @Default(50) int overlayChatPanelHeight,
    @Default(25) int overlayChatPanelWidth,
    @Default(1) int sideChatPositionIndex,
    @Default(25) int chatSidePanelWidth,
    @Default(100) int chatSidePanelPositionX,
    @Default(14) int chatMessageFontSize,
    @Default(30) int chatPanelTransparency,
    @Default(0) int useChatPanelContainer,
    @Default(30) int chatBubbleTransparency,
    @Default(5) int chatContainerHorizontalMargin,
    @Default(5) int chatContainerVerticalMargin,
    @Default(5) int chatBubbleVerticalGap,
    @Default(0) int showChatTime,
    @Default(1) int showNickname,
    @Default(1) int showDonation,
    @Default(0) int showUserBadges,
    @Default(50) int badgeCollectorPanelHeight,
    @Default(100) int overlayBadgeCollectorPositionX,
    @Default(50) int overlayBadgeCollectorPositionY,
    @Default(0) int useBadgeCollector,
  }) = _ChatSettings;

  factory ChatSettings.fromJson(Map<String, dynamic> json) =>
      _$ChatSettingsFromJson(json);
}

const defaultChatSettings = ChatSettings();
