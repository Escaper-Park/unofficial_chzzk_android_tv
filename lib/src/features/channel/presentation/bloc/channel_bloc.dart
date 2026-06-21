import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../group/domain/entities/group_collection.dart';
import '../../../group/domain/repositories/group_repository.dart';
import '../../../live/domain/entities/live_detail.dart';
import '../../../live/domain/entities/live_feed.dart';
import '../../../live/domain/repositories/live_repository.dart';
import '../../../vod/domain/entities/vod_feed.dart';
import '../../../vod/domain/entities/vod_sort.dart';
import '../../../vod/domain/use_cases/channel_video_vod_mapper.dart';
import '../../domain/entities/channel_detail.dart';
import '../../domain/entities/channel_my_info.dart';
import '../../domain/entities/channel_video.dart';
import '../../domain/repositories/channel_repository.dart';

part 'channel_bloc.freezed.dart';
part 'channel_event.dart';
part 'channel_bloc_helpers.dart';
part 'channel_bloc_load_helpers.dart';
part 'channel_bloc_load_more_helpers.dart';
part 'channel_bloc_social_helpers.dart';
part 'channel_state.dart';

final class ChannelBloc extends Bloc<ChannelEvent, ChannelState> {
  ChannelBloc({
    required this.channelId,
    required this.channelRepository,
    required this.liveRepository,
    required this.groupRepository,
    bool initialIsSignedIn = false,
  }) : super(
         ChannelState.initial(
           channelId: channelId,
           isSignedIn: initialIsSignedIn,
         ),
       ) {
    on<_Started>(_onStarted);
    on<_AuthStateChanged>(_onAuthStateChanged);
    on<_TabSelected>(_onTabSelected);
    on<_VodSortSelected>(_onVodSortSelected);
    on<_RetryRequested>(_onRetryRequested);
    on<_LoadMoreRequested>(_onLoadMoreRequested);
    on<_FollowRequested>(_onFollowRequested);
    on<_UnfollowRequested>(_onUnfollowRequested);
    on<_GroupPanelRequested>(_onGroupPanelRequested);
    on<_GroupPanelDismissed>(_onGroupPanelDismissed);
    on<_GroupAddRequested>(_onGroupAddRequested);
  }

  final String channelId;
  final ChannelRepository channelRepository;
  final LiveRepository liveRepository;
  final GroupRepository groupRepository;

  static const _latestVodCount = 10;
  static const _vodPageSize = 18;
}
