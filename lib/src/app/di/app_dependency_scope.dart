part of 'app_dependencies.dart';

class AppDependencyScope extends StatefulWidget {
  const AppDependencyScope({
    super.key,
    required this.dependencies,
    required this.child,
  });

  final AppDependencies dependencies;
  final Widget child;

  @override
  State<AppDependencyScope> createState() => _AppDependencyScopeState();
}

class _AppDependencyScopeState extends State<AppDependencyScope> {
  @override
  void didUpdateWidget(AppDependencyScope oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.dependencies != widget.dependencies) {
      unawaited(oldWidget.dependencies.dispose());
    }
  }

  @override
  void dispose() {
    unawaited(widget.dependencies.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthSessionRepository>.value(
          value: widget.dependencies.authSessionRepository,
        ),
        RepositoryProvider<UserRepository>.value(
          value: widget.dependencies.userRepository,
        ),
        RepositoryProvider<HomeRepository>.value(
          value: widget.dependencies.homeRepository,
        ),
        RepositoryProvider<LiveRepository>.value(
          value: widget.dependencies.liveRepository,
        ),
        RepositoryProvider<ChatRepository>.value(
          value: widget.dependencies.chatRepository,
        ),
        RepositoryProvider<LoadLivePlaybackPlaylistText>.value(
          value: widget.dependencies.loadLivePlaybackPlaylistText,
        ),
        RepositoryProvider<LoadVodPlaybackPlaylistText>.value(
          value: widget.dependencies.loadVodPlaybackPlaylistText,
        ),
        RepositoryProvider<FollowingRepository>.value(
          value: widget.dependencies.followingRepository,
        ),
        RepositoryProvider<GroupRepository>.value(
          value: widget.dependencies.groupRepository,
        ),
        RepositoryProvider<ChannelRepository>.value(
          value: widget.dependencies.channelRepository,
        ),
        RepositoryProvider<VodRepository>.value(
          value: widget.dependencies.vodRepository,
        ),
        RepositoryProvider<WatchingHistoryRepository>.value(
          value: widget.dependencies.watchingHistoryRepository,
        ),
        RepositoryProvider<CategoryRepository>.value(
          value: widget.dependencies.categoryRepository,
        ),
        RepositoryProvider<SearchRepository>.value(
          value: widget.dependencies.searchRepository,
        ),
        RepositoryProvider<SearchResultsRepository>.value(
          value: widget.dependencies.searchResultsRepository,
        ),
        RepositoryProvider<SearchTagResultsRepository>.value(
          value: widget.dependencies.searchTagResultsRepository,
        ),
        RepositoryProvider<SettingsPreferencesRepository>.value(
          value: widget.dependencies.settingsPreferencesRepository,
        ),
        RepositoryProvider<SettingsUpdateRepository>.value(
          value: widget.dependencies.settingsUpdateRepository,
        ),
      ],
      child: BlocProvider<AuthSessionBloc>.value(
        value: widget.dependencies.authSessionBloc,
        child: widget.child,
      ),
    );
  }
}
