import 'package:freezed_annotation/freezed_annotation.dart';

part 'group.g.dart';
part 'group.freezed.dart';

@freezed
@JsonSerializable(explicitToJson: true)
class Groups with _$Groups {
  final List<Group> groups;
  final int lastActivatedGroupIndex;

  Groups({
    required this.groups,
    required this.lastActivatedGroupIndex,
  });

  factory Groups.fromJson(Map<String, dynamic> json) => _$GroupsFromJson(json);
  Map<String, dynamic> toJson() => _$GroupsToJson(this);
}

@freezed
@JsonSerializable(explicitToJson: true)
class Group with _$Group {
  final String id;
  final String groupName;
  final List<String> members; // channelId

  Group({
    required this.id,
    required this.groupName,
    required this.members,
  });

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
  Map<String, dynamic> toJson() => _$GroupToJson(this);
}
