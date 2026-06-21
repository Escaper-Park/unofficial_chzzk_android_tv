import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../live/domain/entities/live_feed.dart';
import '../../../live/domain/entities/live_sort.dart';
import '../../../live/domain/repositories/live_repository.dart';
import '../../../vod/domain/entities/vod_feed.dart';
import '../../../vod/domain/entities/vod_sort.dart';
import '../../../vod/domain/repositories/vod_repository.dart';
import '../../../vod/domain/use_cases/watching_history_vod_mapper.dart';
import '../../../watching_history/domain/entities/watching_history.dart';
import '../../../watching_history/domain/repositories/watching_history_repository.dart';

part 'browse_bloc.freezed.dart';
part 'browse_event.dart';
part 'browse_bloc_load_helpers.dart';
part 'browse_bloc_load_more_helpers.dart';
part 'browse_bloc_helpers.dart';
part 'browse_state.dart';

final class BrowseBloc extends Bloc<BrowseEvent, BrowseState> {
  BrowseBloc({
    required this.liveRepository,
    required this.vodRepository,
    required this.watchingHistoryRepository,
    BrowseTab initialTab = BrowseTab.live,
    BrowseLiveSortOption initialLiveSortOption = BrowseLiveSortOption.popular,
    BrowseVodSortOption initialVodSortOption = BrowseVodSortOption.popular,
  }) : super(
         BrowseState.initial(
           selectedTab: initialTab,
           liveSortOption: initialLiveSortOption,
           vodSortOption: initialVodSortOption,
         ),
       ) {
    on<_Started>(_onStarted);
    on<_AuthStateChanged>(_onAuthStateChanged);
    on<_TabSelected>(_onTabSelected);
    on<_LiveSortSelected>(_onLiveSortSelected);
    on<_VodSortSelected>(_onVodSortSelected);
    on<_RetryRequested>(_onRetryRequested);
    on<_LoadMoreRequested>(_onLoadMoreRequested);
  }

  final LiveRepository liveRepository;
  final VodRepository vodRepository;
  final WatchingHistoryRepository watchingHistoryRepository;

  static const _pageSize = 18;
}
