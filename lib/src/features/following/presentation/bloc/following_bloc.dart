import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../category/domain/entities/category_item.dart';
import '../../../category/domain/repositories/category_repository.dart';
import '../../../channel/domain/repositories/channel_repository.dart';
import '../../../group/domain/entities/group_collection.dart';
import '../../../group/domain/repositories/group_repository.dart';
import '../../../live/domain/entities/live_feed.dart';
import '../../../vod/domain/entities/vod_feed.dart';
import '../../../vod/domain/repositories/vod_repository.dart';
import '../../domain/entities/following_feed.dart';
import '../../domain/entities/following_sort.dart';
import '../../domain/repositories/following_repository.dart';

part 'following_bloc.freezed.dart';
part 'following_event.dart';
part 'following_bloc_load_helpers.dart';
part 'following_bloc_pagination_helpers.dart';
part 'following_bloc_request_helpers.dart';
part 'following_bloc_channel_helpers.dart';
part 'following_bloc_helpers.dart';
part 'following_state.dart';

final class FollowingBloc extends Bloc<FollowingEvent, FollowingState> {
  FollowingBloc({
    required this.followingRepository,
    required this.vodRepository,
    required this.categoryRepository,
    required this.channelRepository,
    required this.groupRepository,
    bool initialIsSignedIn = false,
  }) : super(_initialFollowingState(isSignedIn: initialIsSignedIn)) {
    on<_Started>(_onStarted);
    on<_AuthStateChanged>(_onAuthStateChanged);
    on<_TabSelected>(_onTabSelected);
    on<_RetryRequested>(_onRetryRequested);
    on<_LiveSortSelected>(_onLiveSortSelected);
    on<_LoadMoreRequested>(_onLoadMoreRequested);
    on<_ChannelModalOpened>(_onChannelModalOpened);
    on<_ChannelModalClosed>(_onChannelModalClosed);
    on<_ChannelUnfollowRequested>(_onChannelUnfollowRequested);
    on<_ChannelFollowRequested>(_onChannelFollowRequested);
    on<_ChannelGroupListRequested>(_onChannelGroupListRequested);
    on<_ChannelAddToGroupRequested>(_onChannelAddToGroupRequested);
  }

  final FollowingRepository followingRepository;
  final VodRepository vodRepository;
  final CategoryRepository categoryRepository;
  final ChannelRepository channelRepository;
  final GroupRepository groupRepository;

  static const _vodPageSize = 18;
  var _liveRequestSerial = 0;
  var _vodRequestSerial = 0;
  var _channelRequestSerial = 0;
  var _categoryRequestSerial = 0;
  var _groupListRequestSerial = 0;

  Future<void> _onStarted(
    _Started event,
    Emitter<FollowingState> emit,
  ) async {
    if (!event.isSignedIn) {
      _invalidateTabRequests();
      emit(FollowingState.initial());
      return;
    }

    final loadingState = _stateWithLoadingTab(
      state.selectedTab,
      state.copyWith(isSignedIn: true),
    );
    if (state != loadingState) {
      emit(loadingState);
    }
    await _loadTab(state.selectedTab, emit, emitLoading: false);
  }

  Future<void> _onAuthStateChanged(
    _AuthStateChanged event,
    Emitter<FollowingState> emit,
  ) async {
    if (!event.isSignedIn) {
      _invalidateTabRequests();
      emit(FollowingState.initial());
      return;
    }

    emit(
      _stateWithLoadingTab(
        FollowingTab.live,
        FollowingState.initial().copyWith(isSignedIn: true),
      ),
    );
    await _loadTab(FollowingTab.live, emit, emitLoading: false);
  }

  Future<void> _onTabSelected(
    _TabSelected event,
    Emitter<FollowingState> emit,
  ) async {
    if (!state.isSignedIn) {
      emit(state.copyWith(selectedTab: event.tab, activeChannelModal: null));
      return;
    }

    emit(_stateWithLoadingTab(event.tab, state));
    await _loadTab(event.tab, emit, emitLoading: false);
  }

  Future<void> _onRetryRequested(
    _RetryRequested event,
    Emitter<FollowingState> emit,
  ) {
    if (!state.isSignedIn) {
      return Future<void>.value();
    }

    return _loadTab(state.selectedTab, emit);
  }

  Future<void> _onLiveSortSelected(
    _LiveSortSelected event,
    Emitter<FollowingState> emit,
  ) async {
    if (event.option == state.liveSortOption) {
      return;
    }

    emit(
      state.copyWith(
        selectedTab: FollowingTab.live,
        liveSortOption: event.option,
        live: followingSectionLoading<Live>(),
        activeChannelModal: null,
      ),
    );
    await _loadLive(emit, emitLoading: false);
  }

  Future<void> _onLoadMoreRequested(
    _LoadMoreRequested event,
    Emitter<FollowingState> emit,
  ) async {
    return _loadMoreVod(emit);
  }
}
