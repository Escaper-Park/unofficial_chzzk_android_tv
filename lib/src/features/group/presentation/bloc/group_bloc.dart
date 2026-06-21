import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../channel/domain/entities/channel_detail.dart';
import '../../../channel/domain/repositories/channel_repository.dart';
import '../../domain/entities/group_collection.dart';
import '../../domain/repositories/group_repository.dart';
import '../models/group_screen_models.dart';

part 'group_bloc.freezed.dart';
part 'group_event.dart';
part 'group_bloc_input_helpers.dart';
part 'group_bloc_load_helpers.dart';
part 'group_bloc_mutation_helpers.dart';
part 'group_bloc_helpers.dart';
part 'group_state.dart';

final class GroupBloc extends Bloc<GroupEvent, GroupState> {
  GroupBloc({
    required this.groupRepository,
    required this.channelRepository,
  }) : super(const GroupState()) {
    on<_Started>(_onStarted);
    on<_RetryRequested>(_onRetryRequested);
    on<_TabSelected>(_onTabSelected);
    on<_GroupSelected>(_onGroupSelected);
    on<_CreateInputSelected>(_onCreateInputSelected);
    on<_CreateInputChanged>(_onCreateInputChanged);
    on<_CreateSubmitted>(_onCreateSubmitted);
    on<_KeyboardClosed>(_onKeyboardClosed);
    on<_GroupActivationRequested>(_onGroupActivationRequested);
    on<_GroupDeleteRequested>(_onGroupDeleteRequested);
    on<_ChannelModalOpened>(_onChannelModalOpened);
    on<_ChannelModalClosed>(_onChannelModalClosed);
    on<_MemberRemoveRequested>(_onMemberRemoveRequested);
  }

  final GroupRepository groupRepository;
  final ChannelRepository channelRepository;
  var _collectionRequestSerial = 0;
  var _memberRequestSerial = 0;
}
