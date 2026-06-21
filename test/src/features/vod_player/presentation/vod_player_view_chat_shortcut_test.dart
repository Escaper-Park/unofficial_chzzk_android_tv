import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/auth/domain/entities/naver_session_cookie.dart';
import 'package:unofficial_chzzk_android_tv/src/features/auth/domain/repositories/auth_session_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/auth/presentation/bloc/auth_session_bloc.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/entities/channel_detail.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/entities/channel_my_info.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/entities/channel_video.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/repositories/channel_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/chat/domain/entities/chat.dart';
import 'package:unofficial_chzzk_android_tv/src/features/chat/domain/repositories/chat_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/group/domain/entities/group_collection.dart';
import 'package:unofficial_chzzk_android_tv/src/features/group/domain/repositories/group_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/domain/entities/settings_preferences.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/domain/repositories/settings_preferences_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_detail.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_feed.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_playback.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_sort.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/repositories/vod_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod_player/presentation/bloc/vod_player_bloc.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod_player/presentation/view/vod_player_view.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod_player/presentation/vod_player_route_target.dart';

void main() {
  testWidgets('up opens channel vod browse', (tester) async {
    final bloc = await _pumpVodPlayer(tester);

    await _sendKeyAndWait(
      tester,
      LogicalKeyboardKey.arrowUp,
      until: () => bloc.state.overlayMode == VodPlayerOverlayMode.browse,
    );
  });

  testWidgets('down toggles overlay chat when the initial setting is hidden', (
    tester,
  ) async {
    final bloc = await _pumpVodPlayer(tester);

    await _sendKeyAndWait(
      tester,
      LogicalKeyboardKey.arrowDown,
      until: () =>
          bloc.state.settingsPreferences.vodSettings.chatWindowIndex == 1,
    );
    await _sendKeyAndWait(
      tester,
      LogicalKeyboardKey.arrowDown,
      until: () =>
          bloc.state.settingsPreferences.vodSettings.chatWindowIndex == 0,
    );
  });

  testWidgets('down restores the last visible side chat mode', (tester) async {
    final bloc = await _pumpVodPlayer(
      tester,
      preferences: const SettingsPreferences(
        vodSettings: VodSettings(chatWindowIndex: 2),
      ),
    );

    await _sendKeyAndWait(
      tester,
      LogicalKeyboardKey.arrowDown,
      until: () =>
          bloc.state.settingsPreferences.vodSettings.chatWindowIndex == 0,
    );
    await _sendKeyAndWait(
      tester,
      LogicalKeyboardKey.arrowDown,
      until: () =>
          bloc.state.settingsPreferences.vodSettings.chatWindowIndex == 2,
    );
  });

  testWidgets('left and right keep chat positions unchanged', (tester) async {
    final bloc = await _pumpVodPlayer(
      tester,
      preferences: const SettingsPreferences(
        vodSettings: VodSettings(chatWindowIndex: 1),
        chatSettings: ChatSettings(
          overlayChatPositionX: 50,
          overlayChatPositionY: 50,
          chatSidePanelPositionX: 100,
        ),
      ),
    );

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
    await tester.pump();
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
    await tester.pump();

    expect(
      bloc.state.settingsPreferences.chatSettings.overlayChatPositionX,
      50,
    );
    expect(
      bloc.state.settingsPreferences.chatSettings.overlayChatPositionY,
      50,
    );

    bloc.add(
      VodPlayerEvent.preferencesChanged(
        preferences: bloc.state.settingsPreferences.copyWith(
          vodSettings: bloc.state.settingsPreferences.vodSettings.copyWith(
            chatWindowIndex: 2,
          ),
        ),
      ),
    );
    await tester.pump();

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
    await tester.pump();
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
    await tester.pump();

    expect(
      bloc.state.settingsPreferences.chatSettings.chatSidePanelPositionX,
      100,
    );
  });
}

Future<VodPlayerBloc> _pumpVodPlayer(
  WidgetTester tester, {
  SettingsPreferences preferences = defaultSettingsPreferences,
}) async {
  tester.view.physicalSize = const Size(960, 540);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);

  final settingsRepository = _FakeSettingsPreferencesRepository(preferences);
  final bloc = VodPlayerBloc(
    vodRepository: const _FakeVodRepository(),
    channelRepository: const _FakeChannelRepository(),
    groupRepository: const _FakeGroupRepository(),
    settingsPreferencesRepository: settingsRepository,
    loadVodPlaybackPlaylistText: _fakeVodPlaybackPlaylistTextLoader,
  );
  final authBloc = AuthSessionBloc(const _FakeAuthSessionRepository());
  addTearDown(bloc.close);
  addTearDown(authBloc.close);

  await tester.pumpWidget(
    _Harness(
      bloc: bloc,
      authBloc: authBloc,
      settingsRepository: settingsRepository,
    ),
  );

  final loaded = bloc.stream.firstWhere(
    (state) => state.activeSlot.detail?.videoChatChannelId == 'chat-vod',
  );
  bloc.add(
    const VodPlayerEvent.started(
      initialTarget: VodPlayerInitialTarget(videoNo: 1),
    ),
  );
  await loaded;
  await tester.pump();

  return bloc;
}

Future<void> _sendKeyAndWait(
  WidgetTester tester,
  LogicalKeyboardKey key, {
  required bool Function() until,
}) async {
  await tester.sendKeyEvent(key);
  for (var attempts = 0; attempts < 20; attempts += 1) {
    await tester.pump(const Duration(milliseconds: 1));
    if (until()) {
      return;
    }
  }

  fail('Expected key $key to update vod player state.');
}

class _Harness extends StatelessWidget {
  const _Harness({
    required this.bloc,
    required this.authBloc,
    required this.settingsRepository,
  });

  final VodPlayerBloc bloc;
  final AuthSessionBloc authBloc;
  final SettingsPreferencesRepository settingsRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<ChatRepository>.value(
            value: const _FakeChatRepository(),
          ),
          RepositoryProvider<VodRepository>.value(
            value: const _FakeVodRepository(),
          ),
          RepositoryProvider<SettingsPreferencesRepository>.value(
            value: settingsRepository,
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<AuthSessionBloc>.value(value: authBloc),
            BlocProvider<VodPlayerBloc>.value(value: bloc),
          ],
          child: const VodPlayerView(),
        ),
      ),
    );
  }
}

class _FakeAuthSessionRepository implements AuthSessionRepository {
  const _FakeAuthSessionRepository();

  @override
  Future<bool> clearAllCookies() async {
    return true;
  }

  @override
  Future<NaverSessionCookie?> readRequiredSessionCookie() async {
    return null;
  }
}

class _FakeVodRepository implements VodRepository {
  const _FakeVodRepository();

  @override
  Future<FollowingVodPage> getFollowingVods({
    int? size,
    FollowingVodCursor? cursor,
  }) {
    return _unsupportedFakeOperation('_FakeVodRepository.getFollowingVods');
  }

  @override
  Future<VodPlayback> getPlayback({
    required String videoId,
    required String key,
  }) {
    return _unsupportedFakeOperation('_FakeVodRepository.getPlayback');
  }

  @override
  Future<VodDetail> getVodDetail({required int videoNo}) async {
    return const VodDetail(
      videoNo: 1,
      title: 'VOD title',
      videoType: 'REPLAY',
      publishDate: '2026-06-15 20:00:00',
      duration: 600,
      readCount: 1,
      publishDateAt: 1,
      adult: false,
      livePv: 0,
      chapterActive: false,
      videoChatEnabled: true,
      videoChatChannelId: 'chat-vod',
      channel: VodChannel(
        channelId: 'channel-a',
        channelName: 'Channel A',
        verifiedMark: false,
      ),
    );
  }

  @override
  Future<VodPage> getVods({
    int? size,
    VodSort? sortType,
    VodCursor? cursor,
  }) {
    return _unsupportedFakeOperation('_FakeVodRepository.getVods');
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
  }) {
    return _unsupportedFakeOperation('_FakeVodRepository.postVideoWatchEvent');
  }
}

class _FakeChatRepository implements ChatRepository {
  const _FakeChatRepository();

  @override
  Future<ChatAccessToken> fetchAccessToken({
    required String channelId,
    String? chatType,
  }) {
    return _unsupportedFakeOperation('_FakeChatRepository.fetchAccessToken');
  }

  @override
  Future<VideoChatPage> fetchVideoChats({
    required int videoNo,
    required int playerMessageTime,
    int? previousVideoChatSize,
  }) {
    return _unsupportedFakeOperation('_FakeChatRepository.fetchVideoChats');
  }
}

class _FakeChannelRepository implements ChannelRepository {
  const _FakeChannelRepository();

  @override
  Future<void> disableChannelNotification({required String channelId}) {
    return _unsupportedFakeOperation(
      '_FakeChannelRepository.disableChannelNotification',
    );
  }

  @override
  Future<void> enableChannelNotification({required String channelId}) {
    return _unsupportedFakeOperation(
      '_FakeChannelRepository.enableChannelNotification',
    );
  }

  @override
  Future<void> followChannel({required String channelId}) {
    return _unsupportedFakeOperation('_FakeChannelRepository.followChannel');
  }

  @override
  Future<ChannelDetail> getChannel({required String channelId}) {
    return _unsupportedFakeOperation('_FakeChannelRepository.getChannel');
  }

  @override
  Future<ChannelMyInfo> getMyInfo({required String channelId}) {
    return _unsupportedFakeOperation('_FakeChannelRepository.getMyInfo');
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
  Future<void> unfollowChannel({required String channelId}) {
    return _unsupportedFakeOperation('_FakeChannelRepository.unfollowChannel');
  }
}

class _FakeGroupRepository implements GroupRepository {
  const _FakeGroupRepository();

  @override
  Future<GroupActivationResult> activateGroup({required String groupId}) {
    return _unsupportedFakeOperation('_FakeGroupRepository.activateGroup');
  }

  @override
  Future<GroupAddMemberResult> addMember({
    required String groupId,
    required String channelId,
  }) {
    return _unsupportedFakeOperation('_FakeGroupRepository.addMember');
  }

  @override
  Future<GroupCreateResult> createGroup({required String groupName}) {
    return _unsupportedFakeOperation('_FakeGroupRepository.createGroup');
  }

  @override
  Future<GroupMutationResult> deleteGroup({required String groupId}) {
    return _unsupportedFakeOperation('_FakeGroupRepository.deleteGroup');
  }

  @override
  Future<GroupCollection> read() async {
    return defaultGroupCollection;
  }

  @override
  Future<GroupMutationResult> removeMember({
    required String groupId,
    required String channelId,
  }) {
    return _unsupportedFakeOperation('_FakeGroupRepository.removeMember');
  }

  @override
  Future<void> save(GroupCollection collection) {
    return _unsupportedFakeOperation('_FakeGroupRepository.save');
  }
}

class _FakeSettingsPreferencesRepository
    implements SettingsPreferencesRepository {
  _FakeSettingsPreferencesRepository(this.preferences);

  SettingsPreferences preferences;

  @override
  Future<SettingsPreferences> read() async {
    return preferences;
  }

  @override
  Future<void> save(SettingsPreferences preferences) async {
    this.preferences = preferences;
  }
}

Future<String> _fakeVodPlaybackPlaylistTextLoader({
  required Uri playlistUri,
}) {
  return _unsupportedFakeOperation('_fakeVodPlaybackPlaylistTextLoader');
}

Never _unsupportedFakeOperation(String operation) {
  throw UnsupportedError(
    '$operation is not supported by this test fake. '
    'Provide a focused fake implementation before using it.',
  );
}
