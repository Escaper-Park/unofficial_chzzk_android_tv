// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatSettings _$ChatSettingsFromJson(
  Map<String, dynamic> json,
) => _ChatSettings(
  overlayChatQuickPositionIndex:
      (json['overlayChatQuickPositionIndex'] as num?)?.toInt() ?? 5,
  overlayChatPositionX: (json['overlayChatPositionX'] as num?)?.toInt() ?? 100,
  overlayChatPositionY: (json['overlayChatPositionY'] as num?)?.toInt() ?? 50,
  overlayChatPanelHeight:
      (json['overlayChatPanelHeight'] as num?)?.toInt() ?? 50,
  overlayChatPanelWidth: (json['overlayChatPanelWidth'] as num?)?.toInt() ?? 25,
  sideChatPositionIndex: (json['sideChatPositionIndex'] as num?)?.toInt() ?? 1,
  chatSidePanelWidth: (json['chatSidePanelWidth'] as num?)?.toInt() ?? 25,
  chatSidePanelPositionX:
      (json['chatSidePanelPositionX'] as num?)?.toInt() ?? 100,
  chatMessageFontSize: (json['chatMessageFontSize'] as num?)?.toInt() ?? 14,
  chatPanelTransparency: (json['chatPanelTransparency'] as num?)?.toInt() ?? 30,
  useChatPanelContainer: (json['useChatPanelContainer'] as num?)?.toInt() ?? 0,
  chatBubbleTransparency:
      (json['chatBubbleTransparency'] as num?)?.toInt() ?? 30,
  chatContainerHorizontalMargin:
      (json['chatContainerHorizontalMargin'] as num?)?.toInt() ?? 5,
  chatContainerVerticalMargin:
      (json['chatContainerVerticalMargin'] as num?)?.toInt() ?? 5,
  chatBubbleVerticalGap: (json['chatBubbleVerticalGap'] as num?)?.toInt() ?? 5,
  showChatTime: (json['showChatTime'] as num?)?.toInt() ?? 0,
  showNickname: (json['showNickname'] as num?)?.toInt() ?? 1,
  showDonation: (json['showDonation'] as num?)?.toInt() ?? 1,
  showUserBadges: (json['showUserBadges'] as num?)?.toInt() ?? 0,
  badgeCollectorPanelHeight:
      (json['badgeCollectorPanelHeight'] as num?)?.toInt() ?? 50,
  overlayBadgeCollectorPositionX:
      (json['overlayBadgeCollectorPositionX'] as num?)?.toInt() ?? 100,
  overlayBadgeCollectorPositionY:
      (json['overlayBadgeCollectorPositionY'] as num?)?.toInt() ?? 50,
  useBadgeCollector: (json['useBadgeCollector'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$ChatSettingsToJson(_ChatSettings instance) =>
    <String, dynamic>{
      'overlayChatQuickPositionIndex': instance.overlayChatQuickPositionIndex,
      'overlayChatPositionX': instance.overlayChatPositionX,
      'overlayChatPositionY': instance.overlayChatPositionY,
      'overlayChatPanelHeight': instance.overlayChatPanelHeight,
      'overlayChatPanelWidth': instance.overlayChatPanelWidth,
      'sideChatPositionIndex': instance.sideChatPositionIndex,
      'chatSidePanelWidth': instance.chatSidePanelWidth,
      'chatSidePanelPositionX': instance.chatSidePanelPositionX,
      'chatMessageFontSize': instance.chatMessageFontSize,
      'chatPanelTransparency': instance.chatPanelTransparency,
      'useChatPanelContainer': instance.useChatPanelContainer,
      'chatBubbleTransparency': instance.chatBubbleTransparency,
      'chatContainerHorizontalMargin': instance.chatContainerHorizontalMargin,
      'chatContainerVerticalMargin': instance.chatContainerVerticalMargin,
      'chatBubbleVerticalGap': instance.chatBubbleVerticalGap,
      'showChatTime': instance.showChatTime,
      'showNickname': instance.showNickname,
      'showDonation': instance.showDonation,
      'showUserBadges': instance.showUserBadges,
      'badgeCollectorPanelHeight': instance.badgeCollectorPanelHeight,
      'overlayBadgeCollectorPositionX': instance.overlayBadgeCollectorPositionX,
      'overlayBadgeCollectorPositionY': instance.overlayBadgeCollectorPositionY,
      'useBadgeCollector': instance.useBadgeCollector,
    };
