// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroupsImpl _$$GroupsImplFromJson(Map<String, dynamic> json) => _$GroupsImpl(
      groups: (json['groups'] as List<dynamic>)
          .map((e) => Group.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastActivatedGroupIndex: (json['lastActivatedGroupIndex'] as num).toInt(),
    );

Map<String, dynamic> _$$GroupsImplToJson(_$GroupsImpl instance) =>
    <String, dynamic>{
      'groups': instance.groups,
      'lastActivatedGroupIndex': instance.lastActivatedGroupIndex,
    };

_$GroupImpl _$$GroupImplFromJson(Map<String, dynamic> json) => _$GroupImpl(
      id: json['id'] as String,
      groupName: json['groupName'] as String,
      members:
          (json['members'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$GroupImplToJson(_$GroupImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'groupName': instance.groupName,
      'members': instance.members,
    };
