import 'package:freezed_annotation/freezed_annotation.dart';

part 'group.g.dart';
part 'group.freezed.dart';

@freezed
class Groups with _$Groups {
  const factory Groups({
    required List<Group> groups,
    required int lastActivatedGroupIndex,
  }) = _Groups;

  factory Groups.fromJson(Map<String, dynamic> json) => _$GroupsFromJson(json);
}

@freezed
class Group with _$Group {
  const factory Group({
    required String id,
    required String groupName,
    required List<String> members, // channelId
  }) = _Group;

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
}
