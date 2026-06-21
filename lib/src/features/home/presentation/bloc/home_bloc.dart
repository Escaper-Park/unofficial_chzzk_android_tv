import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../category/domain/entities/category_item.dart';
import '../../../category/domain/repositories/category_repository.dart';
import '../../../following/domain/entities/following_feed.dart';
import '../../../following/domain/repositories/following_repository.dart';
import '../../../live/domain/entities/live_feed.dart';
import '../../../live/domain/repositories/live_repository.dart';
import '../../../settings/domain/entities/settings_preferences.dart';
import '../../../settings/domain/repositories/settings_preferences_repository.dart';
import '../../../vod/domain/entities/vod_feed.dart';
import '../../../vod/domain/repositories/vod_repository.dart';
import '../../../vod/domain/use_cases/watching_history_vod_mapper.dart';
import '../../../watching_history/domain/repositories/watching_history_repository.dart';
import '../../domain/entities/home_live.dart';
import '../../domain/repositories/home_repository.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_bloc_helpers.dart';
part 'home_state.dart';

final class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required this.homeRepository,
    required this.liveRepository,
    required this.followingRepository,
    required this.vodRepository,
    required this.watchingHistoryRepository,
    required this.categoryRepository,
    required this.settingsPreferencesRepository,
  }) : super(HomeState.initial()) {
    on<_Started>(_onStarted);
    on<_RefreshRequested>(_onRefreshRequested);
  }

  final HomeRepository homeRepository;
  final LiveRepository liveRepository;
  final FollowingRepository followingRepository;
  final VodRepository vodRepository;
  final WatchingHistoryRepository watchingHistoryRepository;
  final CategoryRepository categoryRepository;
  final SettingsPreferencesRepository settingsPreferencesRepository;

  static const _homeRailSize = 18;
  var _loadSerial = 0;

  Future<void> _onStarted(
    _Started event,
    Emitter<HomeState> emit,
  ) async {
    await _load(isSignedIn: event.isSignedIn, emit: emit);
  }

  Future<void> _onRefreshRequested(
    _RefreshRequested event,
    Emitter<HomeState> emit,
  ) async {
    await _load(isSignedIn: event.isSignedIn, emit: emit);
  }

  Future<void> _load({
    required bool isSignedIn,
    required Emitter<HomeState> emit,
  }) async {
    final requestSerial = ++_loadSerial;
    final generalSetting = await _readGeneralSetting();
    if (!_isCurrentLoad(emit, requestSerial)) {
      return;
    }

    final visibleSections = visibleHomeSections(
      isSignedIn: isSignedIn,
      generalSetting: generalSetting,
    );
    final loadingState = _loadingState(
      isSignedIn: isSignedIn,
      generalSetting: generalSetting,
      visibleSections: visibleSections,
    );

    emit(loadingState);

    final (
      immersive,
      followingLive,
      popularLive,
      watchingHistory,
      popularVod,
      followingCategory,
      trendingCategory,
    ) = await (
      _loadIfVisible(
        visibleSections: visibleSections,
        sectionId: HomeSectionId.immersive,
        load: _loadImmersiveLives,
      ),
      _loadIfVisible(
        visibleSections: visibleSections,
        sectionId: HomeSectionId.followingLive,
        load: _loadFollowingLives,
      ),
      _loadIfVisible(
        visibleSections: visibleSections,
        sectionId: HomeSectionId.popularLive,
        load: _loadPopularLives,
      ),
      _loadIfVisible(
        visibleSections: visibleSections,
        sectionId: HomeSectionId.watchingHistory,
        load: _loadWatchingHistoryVods,
      ),
      _loadIfVisible(
        visibleSections: visibleSections,
        sectionId: HomeSectionId.popularVod,
        load: _loadPopularVods,
      ),
      _loadIfVisible(
        visibleSections: visibleSections,
        sectionId: HomeSectionId.followingCategory,
        load: _loadFollowingCategories,
      ),
      _loadIfVisible(
        visibleSections: visibleSections,
        sectionId: HomeSectionId.trendingCategory,
        load: _loadTrendingCategories,
      ),
    ).wait;

    if (!_isCurrentLoad(emit, requestSerial)) {
      return;
    }

    emit(
      loadingState.copyWith(
        loadStatus: HomeLoadStatus.ready,
        immersive: immersive,
        followingLive: followingLive,
        popularLive: popularLive,
        watchingHistory: watchingHistory,
        popularVod: popularVod,
        followingCategory: followingCategory,
        trendingCategory: trendingCategory,
      ),
    );
  }
}
