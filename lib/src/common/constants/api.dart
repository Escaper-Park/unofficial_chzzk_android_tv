abstract class BaseUrl {
  const BaseUrl._();

  /// `BaseUrl`: chzzk login page.
  static const String naverLogin =
      'https://nid.naver.com/nidlogin.login?url=https%3A%2F%2Fchzzk.naver.com%2F';

  /// `BaseUrl`: naver game vi the user data.
  static const String naverGame = 'https://comm-api.game.naver.com/nng_main';

  /// `BaseUrl`: CHZZK
  static const String chzzk = 'https://api.chzzk.naver.com';

  /// `BaseUrl`: CHZZK Service
  static const String chzzkService = 'https://api.chzzk.naver.com/service';

  /// `BaseUrl`: Vod playback. If liveRewindPlaybackJson in the VOD data is null,
  /// use this vodPlayback url. Otherwise, use the Url in liveRewindPlaybackJson.
  ///
  /// @Path: `/$videoId`
  ///
  /// @Query: `String key = ${vod.inKey}, int sid = 2099, String devt = 'html5_pc',`
  /// `int st = 5, String lc = 'ko_KR', String cpl = ko_KR`
  static const String vodPlayback =
      'https://apis.naver.com/neonplayer/vodplay/v2/playback';

  /// `BaseUrl`: Gitgub repository for checking the updates.
  static const String githubLatestRelease =
      'https://api.github.com/repos/Escaper-Park/unofficial_chzzk_android_tv/releases/latest';

  /// `BaseUrl`: Clip embed
  /// 
  /// @Path: `/$clipUID`
  /// 
  /// @Query: `int autoplay = 1`
  static const String clipEmbed = 'https://chzzk.naver.com/embed/clip';

  /// `BaseUrl`: chat server
  /// 
  /// Websocket chat server with randomly assigned from 1 to 5.
  static String chatServer(int serverNo) =>
      'wss://kr-ss$serverNo.chat.naver.com/chat';
}

abstract class NaverGameApi {
  const NaverGameApi._();

  /// Login 'Cookie' in WebView must be used as a http Options.
  /// Add cookies in Options as headers.
  ///
  /// {'cookie': 'NID_AUT=$nidAuth; NID_SES=$nidSession'}
  static const String userStatus = '/v1/user/getUserStatus';

  /// Private user blocks.
  static const String privateUserBlocks = '/v1/privateUserBlocks/allUserIdHash';

  /// Auto-search categories from NAVER lounges.
  /// Must input at least 2 characters to make it work.
  ///
  /// @Query: `String keyword, int limit = 10, int offset = 0`
  static const String autoCompleteSearchCategories =
      '/v2/search/lounges/auto-complete';

  /// Access token for chat service.
  ///
  /// @Query: `String channelId, String chatType = 'STREAMING'`
  static const String accessToken = '/v1/chats/access-token';
}

abstract class ChzzkApi {
  const ChzzkApi._();

  /// Live Status
  ///
  /// @Path: `$channelId/live-status`
  ///
  /// @Query: `bool includePlayerRecommendContent = false`
  static const String liveStatus = '/polling/v3/channels';

  /// Watching event to save last seen position
  /// 
  /// POST 
  static const String watchEvent = '/polling/v1/watch-event/video';
}

abstract class ChzzkServiceApi {
  const ChzzkServiceApi._();

  /// Base Channel
  static const String _channels = '/v1/channels';

  /// Base categories
  static const String _categories = '/v1/categories';

  /// Base search
  static const String _search = '/v1/search';

  /* Channel */
  /// @Path: `/$channelId`
  static const String channels = _channels;

  /// Follow channel.
  ///
  /// @Path: `/$ChannelId/follow`
  static const String channelFollow = _channels;

  /* SEARCH */
  /// Auto-search channels. Must input at least 2 characters to make it work.
  /// @Query: `String keyword, int offset = 0, int size = 10`
  static const String autoCompleteSearchChannels =
      '$_search/channels/auto-complete';

  /// Auto-search tags. It works even if you only enter one letter.
  ///
  /// @Query: `String keyword, int size = 50, `
  static const String autoCompleteSearchTags = '$_search/tags/auto-complete';

  /// Search channels.
  ///
  /// @Query: `String keyword, int offset = 0, int size = 18, bool withFirstChannelContent = false`
  static const String searchChannels = '$_search/channels';

  /// Search Vods.
  ///
  /// @Query: `String keyword, int offset = 0, int size = 18`
  static const String searchVods = '$_search/videos';

  /// Search lives
  ///
  /// @Query: `String keyword, int offset = 0, int size = 18`
  static const String searchLives = '$_search/lives';

  /// Search lives with a tag.
  ///
  /// @Query: `String tags, int size = 20, String sortType = 'POPULAR'`
  /// `int? concurrentUserCount, int? liveId`
  static const String searchLivesWithTag = '/v1/tag/lives';

  /// Search vods with a tag.
  ///
  /// @Query: `String tag, int size = 20, String sortType = 'POPULAR'`
  static const String searchVodsWithTag = '/v1/tag/videos';

  /* Following */
  /// All Following channel data with the liveInfo.
  ///
  /// @Query: `int size = 505, int page = 0`
  static const String followings = '$_channels/followings';

  /// Only the live streaming channels among the following channels in order of POPULAR.
  ///
  /// @Query: `String sortType = 'POPULAR'`
  static const String followingLives = '$_channels/following-lives';

  /// Following vods in order of newest.
  ///
  /// @Query: `int size = 30, String? nextNo`
  static const String followingVods = '/v2/home/following/videos';

  /* Category */
  /// Following categories.
  static const String followingCategories = '$_categories/following';

  /// List of categories.
  ///
  /// @Query: `String categoryId, int? concurrentUserCount, int? openLiveCount, int size = 10`
  static const String categories = '$_categories/live';

  /// Detailed Category info.
  ///
  /// @Path: /$categoryType/$categoryId/info
  static const String categoryInfo = _categories;

  /// Category lives
  ///
  /// @Path: `/$CategoryType/$categoryId/lives`
  ///
  /// @Query: `int? concurrentUserCount, int? liveId`
  static const String categoryLives = '/v2/categories';

  /// Category Vods
  ///
  /// @Path: `/$CategoryType/$categoryId/videos`
  /// ///
  /// @Query: `int? publishDateAt, int? readCount`
  static const String categoryVods = '/v2/categories';

  /// Category follow/unfollow
  ///
  /// @Path: `/$CategoryType/$CategoryId/follow`
  static const String categoryFollow = _categories;

  /* LIVE */
  /// All lives
  ///
  /// @Query: `int size = 20, String sortType='POPULAR', int concurrentUserCount, int liveId`,
  ///
  /// sortType: `'POPULAR', 'LATEST'`
  static const String allLives = '/v1/lives';

  /// Live detail
  ///
  /// @Path: `/$channelId/live-detail`
  ///
  /// @Query: `String? dt`
  static const String liveDetail = '/v3.1/channels';

  /* VOD */
  /// VOD data.
  ///
  /// @Path: `/$videoNo`
  static const String vod = '/v3/videos';

  /// Vod watching histories.
  ///
  /// @Query: `int size = 20, int? lastTime = null`
  static const String watchingHistory = '/v1/watching-history';

  /// all vods.
  ///
  /// @Query: `int size = 30, String sortType = 'POPULAR'`
  /// `int `
  ///
  /// sortType: `'POPULAR', 'LATEST'`
  static const String allVods = '/v1/home/videos';

  /// Vods in a channel.
  ///
  /// @Path: `/$channelId/videos`
  ///
  /// @Query: `String sortType='LATEST', String pagingType='PAGE', int page = 0`
  /// `int size = 18, int? publishDateAt = null, String? videoType = null`
  ///
  /// sortType: `'LATEST', 'POPULAR'`
  static const String channelVods = _channels;

  /// Vod Chats.
  ///
  /// @Path: `/$videoNo/chats`
  ///
  /// @Query: `int playerMessageTime, int? previousVideoChatSize`
  static const String vodChat = '/v1/videos';

  /* CLIPS */
  /// Channel Clips
  ///
  /// @Path: `/$channelId/clips`
  ///
  /// @Query: `String filterType = 'ALL', String orderType = 'POPULAR', int size = 15`
  /// `String? clipUID = null, int? readCount = null`
  ///
  /// filterType: `'ALL', 'WITHIN_ONE_DAY', 'WITHIN_SEVEN_DAYS', 'WITHIN_THIRTY_DAYS'`
  ///
  /// orderType: `'POPULAR', 'RECENT'`
  static const String channelClips = _channels;

  /// Category clips
  ///
  /// @Path: `/$categoryType/$categoryId/clips`
  ///
  /// @Query: `String filterType = 'ALL', String orderType = 'POPULAR', int size = 10`
  /// `String? clipUID = null, int? readCount = null`
  ///
  /// filterType: `'ALL', 'WITHIN_ONE_DAY', 'WITHIN_SEVEN_DAYS', 'WITHIN_THIRTY_DAYS'`
  ///
  /// orderType: `'POPULAR', 'RECENT'`
  static const String categoryClips = _categories;

  /// Popular clips
  ///
  /// @Query: `String filterType = 'WITHIN_1_DAY', String orderType = 'POPULAR', String next`
  ///
  /// filterType: `'WITHIN_7_DAYS', 'WITHIN_1_DAY'`
  ///
  /// orderType: `'POPULAR','RECOMMEND'`
  static const String popularClips = '/v1/home/recommended/clips';
}
