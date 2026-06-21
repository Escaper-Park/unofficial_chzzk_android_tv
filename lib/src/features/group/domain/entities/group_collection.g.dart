// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GroupCollection _$GroupCollectionFromJson(Map<String, dynamic> json) =>
    _GroupCollection(
      groups:
          (json['groups'] as List<dynamic>?)
              ?.map((e) => GroupItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <GroupItem>[],
      activatedGroupId: json['activatedGroupId'] as String?,
      lastActivatedGroupIndex:
          (json['lastActivatedGroupIndex'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$GroupCollectionToJson(_GroupCollection instance) =>
    <String, dynamic>{
      'groups': instance.groups,
      'activatedGroupId': instance.activatedGroupId,
      'lastActivatedGroupIndex': instance.lastActivatedGroupIndex,
    };

_GroupItem _$GroupItemFromJson(Map<String, dynamic> json) => _GroupItem(
  id: json['id'] as String,
  groupName: json['groupName'] as String,
  memberChannelIds:
      (json['memberChannelIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
);

Map<String, dynamic> _$GroupItemToJson(_GroupItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'groupName': instance.groupName,
      'memberChannelIds': instance.memberChannelIds,
    };
