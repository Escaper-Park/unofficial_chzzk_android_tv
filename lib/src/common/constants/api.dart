class ApiUrl {
  /// [baseUrl] Base
  static const String chzzk = 'https://api.chzzk.naver.com';

  /// [baseUrl] Base api url.
  static const String chzzkService = '$chzzk/service';

  /// [baseUrl] About user data.
  static const String naverGame = 'https://comm-api.game.naver.com/nng_main';

  /// [baseUrl]
  static const String naverLogin =
      'https://nid.naver.com/nidlogin.login?mode=form&url=https%3A%2F%2Fchzzk.naver.com%2F&locale=ko_KR&svctype=1&disposable=';

  /// [naverGame] Login 'Cookie' in WebView must be used as a http Options.
  ///
  /// [Path]
  ///
  /// Options(headers : {'cookie': 'NID_AUT=$nidAuth; NID_SES=$nidSession'})
  static const String userStatus = '/v1/user/getUserStatus';

  /// [naverGame] Private user blocks
  static const String privateUserBlocks = '/v1/privateUserBlocks/allUserIdHash';
  
  /// [chzzkService][path] /$channelId
  static const String channel = '$chzzkService/v1/channels';

  /// [chzzkService] All Following channel data with liveInfo.
  ///
  /// [queryParameters] int size = 505, int page = 0
  static const String followings = '/v1/channels/followings';

  /// [chzzkService] Only live streamings among the following channels.
  static const String followingLives = '/v1/channels/following-lives';

  /// [chzzk] All lives channels Sort by 'POPULAR' or 'LATEST'.
  ///
  /// [queryParamters] int size=20, String sortType='POPULAR', int concurrentUserCount, int liveId
  static const String allLives = '/service/v1/lives';

  /// [chzzk] Live detail of a specific channel.
  ///
  /// [path] /$channelId/live-detail
  static const String liveDetail = '/service/v3/channels';

  /// [chzzk] Live status of a specific channel.
  ///
  /// [path] /$channelId/live-status
  static const String liveStatus = '/polling/v3/channels';

  /// [chzzkService] Vod data.
  ///
  /// [path] $videoNo
  static const String vod = '/v3/videos';

  /// [chzzkService] Vods in a specific channel.
  ///
  /// [path] /$channelId/videos
  ///
  /// [queryParamters] String sortType='LATEST', String pagingType='PAGE', int page = 0,
  /// int size = 18, int publishDateAt = null, String videoType = null
  static const String channelVods = '/v1/channels';

  /// [chzzkService] All the vods in my followings sort by latest.
  ///
  /// [queryParamters] int size = 30, int nextNo
  static const String followingVods = '/v1/my-content';

  /// [chzzkService] Popular vods.
  ///
  /// [queryParamters] int size = 60
  static const String popularVods = '/v1/home/popular-videos';

  /// [baseUrl] Vod playback.
  ///
  /// [path] /$videoId (String videoId)
  ///
  /// [queryParamters] String key = inKey
  static const String vodPlayback =
      'https://apis.naver.com/neonplayer/vodplay/v1/playback';

  /// [chzzkService] All Categories.
  ///
  /// Initial [queryParamters] int size = 20
  ///
  /// Next [queryParamters]  String categoryId, int concurrentUserCount, int openLiveCount, int size=10
  static const String category = '/v1/categories';

  /// [chzzkService]  Following Categories
  static const String followingCategories = '$category/following';

  /// [chzzkService] Lives in a specific category.
  /// [path] /$CategoryType/$categoryId/lives
  ///
  /// [queryparamters] int liveId, int size, int concurrentUserCount
  static const String categoryLives = '/v2/categories';

  /// [chzzkService] Channel search results.
  ///
  /// [queryParamters] String keyword, int size = 50, int offset = 0, bool withFirstChannelContent = false
  static const String searchChannels = '/v1/search/channels';

  /// [naverGame] Access token for chat.
  ///
  /// [queryParamters] String channelId, String chatType = 'STREAMING'
  static const String accessToken = '$naverGame/v1/chats/access-token';

  /// [baseUrl] ServerNo are randomly assigned from 1 to 5.
  static String chatServer(int serverNo) =>
      'wss://kr-ss$serverNo.chat.naver.com/chat';

  /// [chzzkService] Channel Clips
  ///
  /// [path]  /$channelId/clips
  ///
  /// initial [queryParamters] String fliterType = 'ALL', String orderType = 'POPULAR' || 'RECENT' , int size = 15
  ///
  /// next [queryParameters] String clipUID, int readCount
  static const String channelClips = '/v1/channels';

  /// [chzzkService] Catagory Clips
  ///
  /// [path] /$CategoryType/$categoryId/clips
  ///
  /// initial [queryParamters] String filterType = 'ALL', String orderType = 'POPULAR' || 'RECENT', int size = 10
  ///
  /// next [queryParamters] String clipUID, int readCount
  static const String categoryClips = '/v1/categories';

  /// [chzzkService] Popular clips
  ///
  /// [queryParameters] String next
  static const String popularClips = '/v1/home/recommended/clips';

  /// [BaseUrl] A specific clip
  ///
  /// [path] /$clipUID
  static const String naverClipEmbed = 'https://chzzk.naver.com/embed/clip';

  /// [BaseUrl] Github repos for checking update
  static const String githubLatestRelease =
      'https://api.github.com/repos/Escaper-Park/unofficial_chzzk_android_tv/releases/latest';
}
