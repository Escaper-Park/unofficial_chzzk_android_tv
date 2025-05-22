import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../channel/model/channel.dart';
import 'controller/group_controller.dart';
import 'controller/group_detail_controller.dart';
import 'model/group.dart';

mixin class GroupState {
  Groups getGroups(WidgetRef ref) => ref.watch(groupControllerProvider);

  AsyncValue<List<Channel>?> getGroupChannels(
    WidgetRef ref, {
    required Group group,
  }) =>
      ref.watch(groupDetailControllerProvider(group: group));
}
