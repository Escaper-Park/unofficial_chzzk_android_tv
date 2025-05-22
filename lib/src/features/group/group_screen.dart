import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/widgets/dpad/dpad_widgets.dart';
import '../../utils/hooks/custom_hooks.dart';
import '../../common/constants/dimensions.dart';
import '../../common/constants/enums.dart';
import '../../common/constants/styles.dart';
import '../../common/widgets/screen/screen_widgets.dart' show PopScopeScreen;

import '../../common/widgets/ui/ui_widgets.dart';

import '../channel/model/channel.dart';
import 'group_event.dart';
import 'group_state.dart';
import 'model/group.dart';
import 'widgets/group_channel_item.dart';
import 'widgets/group_list_tile.dart';

part 'widgets/screen/group_body.dart';
part 'widgets/screen/group_detail.dart';
part 'widgets/screen/group_generate_button.dart';
part 'widgets/screen/group_list_with_functions.dart';

class GroupScreen extends HookConsumerWidget with GroupEvent, GroupState {
  const GroupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final generateButtonFSN = useFocusScopeNode();
    final groupListFSN = useFocusScopeNode();
    final groupDetailFSN = useFocusScopeNode();

    final currentSelectedGroupState = useState<int?>(null);
    final groups = getGroups(ref);

    useEffect(
      () {
        if (currentSelectedGroupState.value != null &&
            currentSelectedGroupState.value! >= groups.groups.length) {
          currentSelectedGroupState.value = null;
        }
        return null;
      },
      [groups.groups.length],
    );

    final bool groupIsEmpty = groups.groups.isEmpty;
    final bool groupMemberIsEmpty = currentSelectedGroupState.value == null ||
            currentSelectedGroupState.value! >= groups.groups.length
        ? true
        : groups.groups[currentSelectedGroupState.value!].members.isEmpty;

    return PopScopeScreen(
      onPopInvoked: (onPopInvokedHandler) {
        refreshHome(ref);
        onPopInvokedHandler.pop(context);
      },
      child: _GroupBody(
        groupIsEmpty: groupIsEmpty,
        header: HeaderText(text: '그룹'),
        groupGenerateButton: _GroupGenerateButton(
          groupIsEmpty: groupIsEmpty,
          itemNode: generateButtonFSN,
          belowFSN: groupMemberIsEmpty ? groupListFSN : groupDetailFSN,
          leftFSN: groupListFSN,
          pushGroupGenerate: () => pushGroupGenerate(context),
        ),
        groupList: _GroupListWithFunctions(
          groups: groups,
          currentIndex: currentSelectedGroupState.value,
          aboveFSN: generateButtonFSN,
          itemNode: groupListFSN,
          rightFSN: groupDetailFSN,
          onPressedGroup: (index) {
            currentSelectedGroupState.value = index;
          },
        ),
        groupDetail: currentSelectedGroupState.value == null
            ? CenteredText(text: '그룹을 선택해주세요')
            : _GroupDetail(
                asyncChannels: getGroupChannels(
                  ref,
                  group: groups.groups[currentSelectedGroupState.value!],
                ),
                aboveFSN: generateButtonFSN,
                itemNode: groupDetailFSN,
                leftFSN: groupListFSN,
                pushSearch: () => pushSearch(context),
                removeGroup: () => showRemoveGroupAlertDialog(
                  ref,
                  context,
                  group: groups.groups[currentSelectedGroupState.value!],
                ),
                removeMemberFromGroup: (channel) => showRemoveMemberAlertDialog(
                  ref,
                  context,
                  group: groups.groups[currentSelectedGroupState.value!],
                  channel: channel,
                ),
              ),
      ),
    );
  }
}
