part of 'group_bloc.dart';

extension _GroupBlocMutationHelpers on GroupBloc {
  Future<void> _onCreateSubmitted(
    _CreateSubmitted event,
    Emitter<GroupState> emit,
  ) async {
    final groupName = event.value.trim();
    if (groupName.isEmpty) {
      _emitFeedback(emit, GroupFeedbackType.emptyName);
      return;
    }

    try {
      final result = await groupRepository.createGroup(groupName: groupName);
      switch (result) {
        case GroupCreateResult.success:
          final collection = await groupRepository.read();
          final createdGroup = _groupByName(collection.groups, groupName);
          emit(
            await _stateFromCollection(
              collection,
              selectedGroupId: createdGroup?.id,
            ).then(
              (next) => next.copyWith(
                selectedTab: GroupTab.group,
                createInputValue: '',
                isKeyboardOpen: false,
                feedbackType: GroupFeedbackType.createSuccess,
                feedbackSerial: state.feedbackSerial + 1,
              ),
            ),
          );
        case GroupCreateResult.emptyName:
          _emitFeedback(emit, GroupFeedbackType.emptyName);
        case GroupCreateResult.duplicateName:
          _emitFeedback(emit, GroupFeedbackType.duplicateName);
      }
    } on Object {
      _emitFeedback(emit, GroupFeedbackType.createFailure);
    }
  }

  Future<void> _onGroupActivationRequested(
    _GroupActivationRequested event,
    Emitter<GroupState> emit,
  ) async {
    if (state.activatedGroupId == event.groupId) {
      return;
    }

    try {
      final result = await groupRepository.activateGroup(
        groupId: event.groupId,
      );
      if (result == GroupActivationResult.notFound) {
        _emitFeedback(emit, GroupFeedbackType.activateFailure);
        return;
      }

      final collection = await groupRepository.read();
      emit(
        state.copyWith(
          groups: collection.groups,
          activatedGroupId: collection.effectiveActivatedGroupId,
          feedbackType: GroupFeedbackType.activateSuccess,
          feedbackSerial: state.feedbackSerial + 1,
        ),
      );
    } on Object {
      _emitFeedback(emit, GroupFeedbackType.activateFailure);
    }
  }

  Future<void> _onGroupDeleteRequested(
    _GroupDeleteRequested event,
    Emitter<GroupState> emit,
  ) async {
    try {
      final result = await groupRepository.deleteGroup(groupId: event.groupId);
      if (result == GroupMutationResult.notFound) {
        _emitFeedback(emit, GroupFeedbackType.deleteFailure);
        return;
      }

      final collection = await groupRepository.read();
      emit(
        await _stateFromCollection(
          collection,
          selectedGroupId: state.selectedGroupId,
        ).then(
          (next) => next.copyWith(
            feedbackType: GroupFeedbackType.deleteSuccess,
            feedbackSerial: state.feedbackSerial + 1,
            activeChannelModal: null,
          ),
        ),
      );
    } on Object {
      _emitFeedback(emit, GroupFeedbackType.deleteFailure);
    }
  }

  Future<void> _onMemberRemoveRequested(
    _MemberRemoveRequested event,
    Emitter<GroupState> emit,
  ) async {
    try {
      final result = await groupRepository.removeMember(
        groupId: event.groupId,
        channelId: event.channelId,
      );
      if (result == GroupMutationResult.notFound) {
        _emitFeedback(emit, GroupFeedbackType.memberRemoveFailure);
        return;
      }

      final collection = await groupRepository.read();
      emit(
        await _stateFromCollection(
          collection,
          selectedGroupId: event.groupId,
        ).then(
          (next) => next.copyWith(
            activeChannelModal: null,
            feedbackType: GroupFeedbackType.memberRemoveSuccess,
            feedbackSerial: state.feedbackSerial + 1,
          ),
        ),
      );
    } on Object {
      _emitFeedback(emit, GroupFeedbackType.memberRemoveFailure);
    }
  }
}
