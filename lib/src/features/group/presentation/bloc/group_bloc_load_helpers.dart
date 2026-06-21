part of 'group_bloc.dart';

extension _GroupBlocLoadHelpers on GroupBloc {
  Future<void> _onStarted(
    _Started event,
    Emitter<GroupState> emit,
  ) async {
    await _load(emit, status: GroupLoadStatus.loading);
  }

  Future<void> _onRetryRequested(
    _RetryRequested event,
    Emitter<GroupState> emit,
  ) async {
    await _load(emit, status: GroupLoadStatus.loading);
  }

  Future<void> _onGroupSelected(
    _GroupSelected event,
    Emitter<GroupState> emit,
  ) async {
    final selectedGroup = _groupById(state.groups, event.groupId);
    if (selectedGroup == null) {
      return;
    }

    final requestSerial = ++_memberRequestSerial;
    final members = await _loadMembers(selectedGroup.memberChannelIds);
    if (!_isCurrentMemberRequest(emit, requestSerial)) {
      return;
    }

    emit(
      state.copyWith(
        selectedGroupId: selectedGroup.id,
        selectedGroupMembers: members,
        activeChannelModal: null,
      ),
    );
  }

  Future<void> _load(
    Emitter<GroupState> emit, {
    required GroupLoadStatus status,
  }) async {
    final collectionRequestSerial = ++_collectionRequestSerial;
    final memberRequestSerial = ++_memberRequestSerial;
    emit(state.copyWith(loadStatus: status));

    try {
      final collection = await groupRepository.read();
      final next = await _stateFromCollection(collection);
      if (!_isCurrentCollectionRequest(
        emit,
        collectionRequestSerial,
        memberRequestSerial,
      )) {
        return;
      }

      emit(next);
    } on Object {
      if (!_isCurrentCollectionRequest(
        emit,
        collectionRequestSerial,
        memberRequestSerial,
      )) {
        return;
      }

      emit(state.copyWith(loadStatus: GroupLoadStatus.failure));
    }
  }
}
