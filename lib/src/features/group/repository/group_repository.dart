import '../../../utils/shared_preferences/shared_prefs.dart';
import '../../../utils/shared_preferences/shared_prefs_repository.dart';
import '../model/group.dart';

class GroupRepository extends SharedPrefsRepository<Groups> {
  GroupRepository({
    required super.prefs,
    super.dbKey = SharedPrefsDBKey.group,
  });

  @override
  Groups initValue() {
    Groups groups = Groups(
      groups: [],
      lastActivatedGroupIndex: 0,
    );

    return groups;
  }

  @override
  Groups fromJson(Map<String, dynamic> json) {
    return Groups.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(Groups item) {
    return item.toJson();
  }
}
