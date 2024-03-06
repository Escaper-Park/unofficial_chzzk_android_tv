// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatSettingsImpl _$$ChatSettingsImplFromJson(Map<String, dynamic> json) =>
    _$ChatSettingsImpl(
      fontSize: json['fontSize'] as int,
      chatContainerHeight: json['chatContainerHeight'] as int,
      chatContainerWidth: json['chatContainerWidth'] as int,
      chatContainerTransparency: json['chatContainerTransparency'] as int,
      chatPosition: json['chatPosition'] as int,
      chatContainerVerticalInterval:
          json['chatContainerVerticalInterval'] as int,
    );

Map<String, dynamic> _$$ChatSettingsImplToJson(_$ChatSettingsImpl instance) =>
    <String, dynamic>{
      'fontSize': instance.fontSize,
      'chatContainerHeight': instance.chatContainerHeight,
      'chatContainerWidth': instance.chatContainerWidth,
      'chatContainerTransparency': instance.chatContainerTransparency,
      'chatPosition': instance.chatPosition,
      'chatContainerVerticalInterval': instance.chatContainerVerticalInterval,
    };
