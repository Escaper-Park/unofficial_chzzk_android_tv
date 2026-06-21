part of 'group_screen.dart';

Widget _groupScreenContent({
  required BuildContext context,
  required GroupBloc bloc,
  required GroupState state,
  required TvKeyboardCubit? keyboardCubit,
  required GroupChannelModalState? activeModal,
  required GroupItem? activeModalGroup,
  required FocusScopeNode tabsNode,
  required FocusScopeNode groupListNode,
  required FocusScopeNode groupContentNode,
  required FocusScopeNode createNode,
  required FocusScopeNode keyboardNode,
  required FocusScopeNode modalNode,
  required FocusNode groupFirstNode,
  required FocusNode contentFirstNode,
  required GroupChannelFocusRegistry focusRegistry,
  required String? snackbarMessage,
}) {
  return Stack(
    children: [
      _GroupLoadSurface(
        state: state,
        child: GroupLayout(
          selectedTab: state.selectedTab,
          groups: state.groups,
          selectedGroupId: state.selectedGroupId,
          activeGroupId: state.activatedGroupId,
          selectedGroup: state.selectedGroup,
          selectedGroupMembers: state.selectedGroupMembers,
          createInputValue: state.createInputValue,
          isKeyboardOpen: state.isKeyboardOpen,
          tabsNode: tabsNode,
          groupListNode: groupListNode,
          groupContentNode: groupContentNode,
          createNode: createNode,
          keyboardNode: keyboardNode,
          groupFirstNode: groupFirstNode,
          contentFirstNode: contentFirstNode,
          focusRegistry: focusRegistry,
          onTabSelected: (tab) {
            bloc.add(GroupEvent.tabSelected(tab));
          },
          onGroupSelected: (group) {
            bloc.add(GroupEvent.groupSelected(group.id));
          },
          onCreateTabPressed: () {
            bloc.add(const GroupEvent.tabSelected(GroupTab.create));
          },
          onCreateInputPressed: () {
            bloc.add(const GroupEvent.createInputSelected());
          },
          onActivateGroup: (group) {
            bloc.add(GroupEvent.groupActivationRequested(group.id));
          },
          onAddMemberPressed: () => context.go(AppRoute.search.path),
          onDeleteGroup: (group) {
            unawaited(
              _confirmDeleteGroup(
                context: context,
                group: group,
                fallbackFocusNode: groupContentNode,
              ),
            );
          },
          onChannelPressed: (group, channel) {
            bloc.add(
              GroupEvent.channelModalOpened(
                groupId: group.id,
                channel: channel,
              ),
            );
          },
        ),
      ),
      if (state.isKeyboardOpen && keyboardCubit != null)
        GroupKeyboardOverlay(
          sectionNode: keyboardNode,
          cubit: keyboardCubit,
        ),
      _GroupChannelModalHost(
        activeModal: activeModal,
        activeModalGroup: activeModalGroup,
        modalNode: modalNode,
        focusRegistry: focusRegistry,
      ),
      if (snackbarMessage != null) TvSnackbar(message: snackbarMessage),
    ],
  );
}
