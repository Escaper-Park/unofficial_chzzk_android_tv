import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/entities/category_info.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/entities/category_item.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/entities/category_live.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/entities/category_page.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/entities/category_video.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/repositories/category_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/entities/channel_detail.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/entities/channel_my_info.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/entities/channel_video.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/repositories/channel_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/chat/domain/entities/chat.dart';
import 'package:unofficial_chzzk_android_tv/src/features/chat/domain/repositories/chat_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/following/domain/entities/following_feed.dart';
import 'package:unofficial_chzzk_android_tv/src/features/following/domain/entities/following_sort.dart';
import 'package:unofficial_chzzk_android_tv/src/features/following/domain/repositories/following_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/group/domain/entities/group_collection.dart';
import 'package:unofficial_chzzk_android_tv/src/features/group/domain/repositories/group_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/home/domain/entities/home_live.dart';
import 'package:unofficial_chzzk_android_tv/src/features/home/domain/repositories/home_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_detail.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_feed.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_sort.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_status.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/repositories/live_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live_player/domain/use_cases/resolve_live_playback_uri.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search_results/domain/entities/search_results.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search_results/domain/repositories/search_results_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search_tag_results/domain/entities/search_tag_feed.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search_tag_results/domain/repositories/search_tag_results_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/domain/entities/settings_preferences.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/domain/entities/settings_update_info.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/domain/repositories/settings_preferences_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/domain/repositories/settings_update_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_detail.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_feed.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_playback.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_sort.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/repositories/vod_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod_player/domain/use_cases/resolve_vod_playback_uri.dart';
import 'package:unofficial_chzzk_android_tv/src/features/watching_history/domain/entities/watching_history.dart';
import 'package:unofficial_chzzk_android_tv/src/features/watching_history/domain/repositories/watching_history_repository.dart';

class FakeFeatureRepositoryScope extends StatelessWidget {
  const FakeFeatureRepositoryScope({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<HomeRepository>.value(
          value: const _FakeHomeRepository(),
        ),
        RepositoryProvider<LiveRepository>.value(
          value: const _FakeLiveRepository(),
        ),
        RepositoryProvider<ChatRepository>.value(
          value: const _FakeChatRepository(),
        ),
        RepositoryProvider<LoadLivePlaybackPlaylistText>.value(
          value: _emptyLivePlaylist,
        ),
        RepositoryProvider<LoadVodPlaybackPlaylistText>.value(
          value: _emptyVodPlaylist,
        ),
        RepositoryProvider<FollowingRepository>.value(
          value: const _FakeFollowingRepository(),
        ),
        RepositoryProvider<ChannelRepository>.value(
          value: const _FakeChannelRepository(),
        ),
        RepositoryProvider<GroupRepository>.value(
          value: const _FakeGroupRepository(),
        ),
        RepositoryProvider<VodRepository>.value(
          value: const _FakeVodRepository(),
        ),
        RepositoryProvider<WatchingHistoryRepository>.value(
          value: const _FakeWatchingHistoryRepository(),
        ),
        RepositoryProvider<CategoryRepository>.value(
          value: const _FakeCategoryRepository(),
        ),
        RepositoryProvider<SearchResultsRepository>.value(
          value: const _FakeSearchResultsRepository(),
        ),
        RepositoryProvider<SearchTagResultsRepository>.value(
          value: const _FakeSearchTagResultsRepository(),
        ),
        RepositoryProvider<SettingsPreferencesRepository>.value(
          value: const _FakeSettingsPreferencesRepository(),
        ),
        RepositoryProvider<SettingsUpdateRepository>.value(
          value: const _FakeSettingsUpdateRepository(),
        ),
      ],
      child: child,
    );
  }
}

Future<String> _emptyLivePlaylist({required Uri playlistUri}) async {
  return '';
}

Future<String> _emptyVodPlaylist({required Uri playlistUri}) async {
  return '';
}

final class _FakeHomeRepository implements HomeRepository {
  const _FakeHomeRepository();

  @override
  Future<List<HomeLive>> getTopLives({int? slotSize}) async {
    return const [];
  }
}

final class _FakeLiveRepository implements LiveRepository {
  const _FakeLiveRepository();

  @override
  Future<LivePage> getLives({
    int? size,
    LiveSort? sortType,
    LiveCursor? cursor,
  }) async {
    return const LivePage();
  }

  @override
  Future<LiveDetail> getLiveDetail({required String channelId}) {
    return _unsupportedFakeOperation('_FakeLiveRepository.getLiveDetail');
  }

  @override
  Future<LiveStatus> getLiveStatus({
    required String channelId,
    bool? includePlayerRecommendContent,
  }) {
    return _unsupportedFakeOperation('_FakeLiveRepository.getLiveStatus');
  }

  @override
  Future<void> postLiveWatchEvent({
    required String channelId,
    required int liveId,
    required String watchEventType,
    required String sessionId,
    required int eventDurationSeconds,
    required int positionSeconds,
    required int? awtSeconds,
    List<String> liveTokens = const <String>[],
    bool autoPlay = false,
    bool radioMode = false,
  }) async {}
}

final class _FakeChatRepository implements ChatRepository {
  const _FakeChatRepository();

  @override
  Future<ChatAccessToken> fetchAccessToken({
    required String channelId,
    String? chatType,
  }) async {
    return const _FakeChatAccessToken();
  }

  @override
  Future<VideoChatPage> fetchVideoChats({
    required int videoNo,
    required int playerMessageTime,
    int? previousVideoChatSize,
  }) async {
    return const VideoChatPage();
  }
}

final class _FakeChatAccessToken implements ChatAccessToken {
  const _FakeChatAccessToken();

  @override
  String get accessToken => 'fake-chat-access-token';

  @override
  String get extraToken => 'fake-chat-extra-token';
}

final class _FakeFollowingRepository implements FollowingRepository {
  const _FakeFollowingRepository();

  @override
  Future<FollowingChannelPage> fetchFollowingChannels({
    int? page,
    int? size,
    FollowingChannelSort? sortType,
  }) async {
    return const FollowingChannelPage();
  }

  @override
  Future<FollowingLivePage> fetchFollowingLives({
    FollowingLiveSort? sortType,
  }) async {
    return const FollowingLivePage();
  }
}

final class _FakeChannelRepository implements ChannelRepository {
  const _FakeChannelRepository();

  @override
  Future<ChannelDetail> getChannel({required String channelId}) {
    return _unsupportedFakeOperation('_FakeChannelRepository.getChannel');
  }

  @override
  Future<ChannelMyInfo> getMyInfo({required String channelId}) async {
    return ChannelMyInfo(
      channelId: channelId,
      cheatKey: false,
      naverMembership: false,
    );
  }

  @override
  Future<ChannelVideoPage> getChannelVideos({
    required String channelId,
    VodSort? sortType,
    int? page,
    int? size,
    String? publishDateAt,
    String? videoType,
  }) {
    return _unsupportedFakeOperation(
      '_FakeChannelRepository.getChannelVideos',
    );
  }

  @override
  Future<void> followChannel({required String channelId}) async {}

  @override
  Future<void> unfollowChannel({required String channelId}) async {}

  @override
  Future<void> enableChannelNotification({required String channelId}) async {}

  @override
  Future<void> disableChannelNotification({required String channelId}) async {}
}

final class _FakeGroupRepository implements GroupRepository {
  const _FakeGroupRepository();

  @override
  Future<GroupCollection> read() async {
    return const GroupCollection();
  }

  @override
  Future<void> save(GroupCollection collection) async {}

  @override
  Future<GroupCreateResult> createGroup({required String groupName}) async {
    return GroupCreateResult.success;
  }

  @override
  Future<GroupMutationResult> deleteGroup({required String groupId}) async {
    return GroupMutationResult.success;
  }

  @override
  Future<GroupActivationResult> activateGroup({required String groupId}) async {
    return GroupActivationResult.activated;
  }

  @override
  Future<GroupMutationResult> removeMember({
    required String groupId,
    required String channelId,
  }) async {
    return GroupMutationResult.success;
  }

  @override
  Future<GroupAddMemberResult> addMember({
    required String groupId,
    required String channelId,
  }) async {
    return GroupAddMemberResult.added;
  }
}

final class _FakeVodRepository implements VodRepository {
  const _FakeVodRepository();

  @override
  Future<VodPage> getVods({
    int? size,
    VodSort? sortType,
    VodCursor? cursor,
  }) async {
    return const VodPage();
  }

  @override
  Future<FollowingVodPage> getFollowingVods({
    int? size,
    FollowingVodCursor? cursor,
  }) async {
    return const FollowingVodPage();
  }

  @override
  Future<VodDetail> getVodDetail({required int videoNo}) {
    return _unsupportedFakeOperation('_FakeVodRepository.getVodDetail');
  }

  @override
  Future<VodPlayback> getPlayback({
    required String videoId,
    required String key,
  }) {
    return _unsupportedFakeOperation('_FakeVodRepository.getPlayback');
  }

  @override
  Future<void> postVideoWatchEvent({
    required String channelId,
    required int videoNo,
    required String watchEventType,
    required int? awtSeconds,
    required int positionSeconds,
    required String sessionId,
    required int eventDurationSeconds,
    required int totalLengthSeconds,
  }) async {}
}

final class _FakeWatchingHistoryRepository
    implements WatchingHistoryRepository {
  const _FakeWatchingHistoryRepository();

  @override
  Future<WatchingHistoryPage> fetchWatchingHistory({
    int? size,
    WatchingHistoryCursor? cursor,
  }) async {
    return const WatchingHistoryPage();
  }
}

final class _FakeCategoryRepository implements CategoryRepository {
  const _FakeCategoryRepository();

  @override
  Future<CategoryPage> fetchCategories({CategoryPageCursor? cursor}) async {
    return const CategoryPage();
  }

  @override
  Future<List<CategoryItem>> fetchFollowingCategories() async {
    return const [];
  }

  @override
  Future<CategoryInfo> fetchCategoryInfo({
    required String categoryType,
    required String categoryId,
  }) {
    return _unsupportedFakeOperation(
      '_FakeCategoryRepository.fetchCategoryInfo',
    );
  }

  @override
  Future<CategoryLivePage> fetchCategoryLives({
    required String categoryType,
    required String categoryId,
    CategoryLiveCursor? cursor,
  }) {
    return _unsupportedFakeOperation(
      '_FakeCategoryRepository.fetchCategoryLives',
    );
  }

  @override
  Future<CategoryVideoPage> fetchCategoryVideos({
    required String categoryType,
    required String categoryId,
    CategoryVideoCursor? cursor,
  }) {
    return _unsupportedFakeOperation(
      '_FakeCategoryRepository.fetchCategoryVideos',
    );
  }

  @override
  Future<void> followCategory({
    required String categoryType,
    required String categoryId,
  }) async {}

  @override
  Future<void> unfollowCategory({
    required String categoryType,
    required String categoryId,
  }) async {}
}

final class _FakeSearchResultsRepository implements SearchResultsRepository {
  const _FakeSearchResultsRepository();

  @override
  Future<SearchChannelResultsPage> searchChannels({
    required String keyword,
    int? size,
    bool? withFirstChannelContent,
    SearchCursor? cursor,
  }) async {
    return const SearchChannelResultsPage();
  }

  @override
  Future<SearchLiveResultsPage> searchLives({
    required String keyword,
    int? size,
    SearchCursor? cursor,
  }) async {
    return const SearchLiveResultsPage();
  }

  @override
  Future<SearchVideoResultsPage> searchVideos({
    required String keyword,
    int? size,
    SearchCursor? cursor,
  }) async {
    return const SearchVideoResultsPage();
  }
}

final class _FakeSearchTagResultsRepository
    implements SearchTagResultsRepository {
  const _FakeSearchTagResultsRepository();

  @override
  Future<SearchTagLivePage> searchTagLives({
    required String tag,
    int? size,
    LiveSort? sortType,
    SearchTagLiveCursor? cursor,
  }) async {
    return const SearchTagLivePage();
  }

  @override
  Future<SearchTagVideoPage> searchTagVideos({
    required String tag,
    int? size,
    VodSort? sortType,
    SearchTagVideoCursor? cursor,
  }) async {
    return const SearchTagVideoPage();
  }
}

final class _FakeSettingsPreferencesRepository
    implements SettingsPreferencesRepository {
  const _FakeSettingsPreferencesRepository();

  @override
  Future<SettingsPreferences> read() async {
    return defaultSettingsPreferences;
  }

  @override
  Future<void> save(SettingsPreferences preferences) async {}
}

final class _FakeSettingsUpdateRepository implements SettingsUpdateRepository {
  const _FakeSettingsUpdateRepository();

  @override
  Future<SettingsUpdateInfo> fetchLatestRelease() async {
    return const SettingsReleaseInfo(tagName: '0.0.0', body: '');
  }
}

Never _unsupportedFakeOperation(String operation) {
  throw UnsupportedError(
    'FakeFeatureRepositoryScope does not support $operation. '
    'Provide a focused repository fake in this test.',
  );
}
