// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatSettingsImpl _$$ChatSettingsImplFromJson(Map<String, dynamic> json) =>
    _$ChatSettingsImpl(
      chatPositionX: (json['chatPositionX'] as num).toInt(),
      chatPositionY: (json['chatPositionY'] as num).toInt(),
      chatContainerHeight: (json['chatContainerHeight'] as num).toInt(),
      chatContainerWidth: (json['chatContainerWidth'] as num).toInt(),
      chatFontSize: (json['chatFontSize'] as num).toInt(),
      entireChatContainerTransparency:
          (json['entireChatContainerTransparency'] as num).toInt(),
      singleChatContainerTransparency:
          (json['singleChatContainerTransparency'] as num).toInt(),
      chatContainerVerticalMargin:
          (json['chatContainerVerticalMargin'] as num).toInt(),
      showChatTime: (json['showChatTime'] as num).toInt(),
      showNickname: (json['showNickname'] as num).toInt(),
      badgeCollectorHeight: (json['badgeCollectorHeight'] as num).toInt(),
      useBadgeCollector: (json['useBadgeCollector'] as num).toInt(),
    );

Map<String, dynamic> _$$ChatSettingsImplToJson(_$ChatSettingsImpl instance) =>
    <String, dynamic>{
      'chatPositionX': instance.chatPositionX,
      'chatPositionY': instance.chatPositionY,
      'chatContainerHeight': instance.chatContainerHeight,
      'chatContainerWidth': instance.chatContainerWidth,
      'chatFontSize': instance.chatFontSize,
      'entireChatContainerTransparency':
          instance.entireChatContainerTransparency,
      'singleChatContainerTransparency':
          instance.singleChatContainerTransparency,
      'chatContainerVerticalMargin': instance.chatContainerVerticalMargin,
      'showChatTime': instance.showChatTime,
      'showNickname': instance.showNickname,
      'badgeCollectorHeight': instance.badgeCollectorHeight,
      'useBadgeCollector': instance.useBadgeCollector,
    };
