part of 'group_bloc.dart';

extension _GroupBlocInputHelpers on GroupBloc {
  Future<void> _onTabSelected(
    _TabSelected event,
    Emitter<GroupState> emit,
  ) async {
    emit(
      state.copyWith(
        selectedTab: event.tab,
        isKeyboardOpen: event.tab == GroupTab.create,
        activeChannelModal: null,
      ),
    );
  }

  void _onCreateInputSelected(
    _CreateInputSelected event,
    Emitter<GroupState> emit,
  ) {
    emit(
      state.copyWith(
        selectedTab: GroupTab.create,
        isKeyboardOpen: true,
      ),
    );
  }

  void _onCreateInputChanged(
    _CreateInputChanged event,
    Emitter<GroupState> emit,
  ) {
    emit(state.copyWith(createInputValue: event.value));
  }

  void _onKeyboardClosed(
    _KeyboardClosed event,
    Emitter<GroupState> emit,
  ) {
    emit(state.copyWith(isKeyboardOpen: false));
  }

  void _onChannelModalOpened(
    _ChannelModalOpened event,
    Emitter<GroupState> emit,
  ) {
    emit(
      state.copyWith(
        activeChannelModal: GroupChannelModalState(
          groupId: event.groupId,
          channel: event.channel,
        ),
      ),
    );
  }

  void _onChannelModalClosed(
    _ChannelModalClosed event,
    Emitter<GroupState> emit,
  ) {
    emit(state.copyWith(activeChannelModal: null));
  }
}
