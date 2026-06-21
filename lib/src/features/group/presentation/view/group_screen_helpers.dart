part of 'group_screen.dart';

void _handleBack({
  required BuildContext context,
  required GroupState state,
  required FocusScopeNode tabsNode,
  required FocusScopeNode groupListNode,
  required FocusScopeNode groupContentNode,
  required FocusScopeNode createNode,
  required GroupChannelFocusRegistry focusRegistry,
}) {
  final navigationNode = AppShellFocusScope.maybeNavigationOf(context);
  if (navigationNode?.hasFocus ?? false) {
    return;
  }

  if (state.isKeyboardOpen) {
    context.read<GroupBloc>().add(const GroupEvent.keyboardClosed());
    requestTvSectionFocus(createNode);
    return;
  }

  final activeModal = state.activeChannelModal;
  if (activeModal != null) {
    context.read<GroupBloc>().add(const GroupEvent.channelModalClosed());
    focusRegistry.maybeNodeFor(activeModal.channel.channelId)?.requestFocus();
    return;
  }

  if (state.selectedTab == GroupTab.create && createNode.hasFocus) {
    requestTvSectionFocus(tabsNode);
    return;
  }

  if (groupContentNode.hasFocus || groupListNode.hasFocus) {
    requestTvSectionFocus(tabsNode);
    return;
  }

  if (tabsNode.hasFocus) {
    navigationNode?.requestFocus();
    return;
  }

  requestTvSectionFocus(tabsNode);
}

Future<void> _confirmDeleteGroup({
  required BuildContext context,
  required GroupItem group,
  required FocusScopeNode fallbackFocusNode,
}) async {
  final result = await showTvDialog(
    context: context,
    type: TvDialogType.alert,
    title: GroupScreenString.confirmDeleteTitle,
    content: GroupScreenString.confirmDeleteContent(group.groupName),
    primaryLabel: GroupScreenString.confirmDeletePrimary,
    secondaryLabel: GroupScreenString.confirmDeleteSecondary,
    icon: Icons.delete_rounded,
  );

  if (!context.mounted) {
    return;
  }
  if (result == TvDialogResult.primary) {
    context.read<GroupBloc>().add(GroupEvent.groupDeleteRequested(group.id));
    return;
  }

  requestTvSectionFocus(fallbackFocusNode);
}

Future<void> _confirmRemoveMember({
  required BuildContext context,
  required GroupItem group,
  required GroupMemberItem channel,
}) async {
  final result = await showTvDialog(
    context: context,
    type: TvDialogType.alert,
    title: GroupScreenString.confirmRemoveTitle,
    content: GroupScreenString.confirmRemoveContent(
      channel.channelName,
      group.groupName,
    ),
    primaryLabel: GroupScreenString.confirmRemovePrimary,
    secondaryLabel: GroupScreenString.confirmRemoveSecondary,
    icon: Icons.person_remove_rounded,
  );

  if (!context.mounted) {
    return;
  }
  if (result == TvDialogResult.primary) {
    context.read<GroupBloc>().add(
      GroupEvent.memberRemoveRequested(
        groupId: group.id,
        channelId: channel.channelId,
      ),
    );
    return;
  }

  context.read<GroupBloc>().add(const GroupEvent.channelModalClosed());
}

void _restoreFocusAfterFeedback({
  required GroupFeedbackType feedbackType,
  required FocusScopeNode groupListNode,
  required FocusScopeNode groupContentNode,
}) {
  switch (feedbackType) {
    case GroupFeedbackType.createSuccess:
    case GroupFeedbackType.deleteSuccess:
      requestTvSectionFocus(groupListNode);
    case GroupFeedbackType.memberRemoveSuccess:
      requestTvSectionFocus(groupContentNode);
    case GroupFeedbackType.emptyName:
    case GroupFeedbackType.duplicateName:
    case GroupFeedbackType.createFailure:
    case GroupFeedbackType.deleteFailure:
    case GroupFeedbackType.activateSuccess:
    case GroupFeedbackType.activateFailure:
    case GroupFeedbackType.memberRemoveFailure:
      break;
  }
}

GroupItem? _groupById(List<GroupItem> groups, String? groupId) {
  for (final group in groups) {
    if (group.id == groupId) {
      return group;
    }
  }

  return null;
}
