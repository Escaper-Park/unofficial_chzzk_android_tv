// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Groups _$GroupsFromJson(Map<String, dynamic> json) => Groups(
      groups: (json['groups'] as List<dynamic>)
          .map((e) => Group.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastActivatedGroupIndex: (json['lastActivatedGroupIndex'] as num).toInt(),
    );

Map<String, dynamic> _$GroupsToJson(Groups instance) => <String, dynamic>{
      'groups': instance.groups.map((e) => e.toJson()).toList(),
      'lastActivatedGroupIndex': instance.lastActivatedGroupIndex,
    };

Group _$GroupFromJson(Map<String, dynamic> json) => Group(
      id: json['id'] as String,
      groupName: json['groupName'] as String,
      members:
          (json['members'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
      'id': instance.id,
      'groupName': instance.groupName,
      'members': instance.members,
    };
