enum AppRoute {
  /* Sidebar Menu */
  search('/search', 'search', 0),
  home('/home', 'home', 1),
  following('/following', 'following', 2),
  category('/category', 'category', 3),
  settings('/settings', 'settings', 4),
  auth('/auth', 'auth', 5),
  /* Top menu */
  liveAll('/liveAll', 'liveAll', 6),
  vodAll('/vodAll', 'vodAll', 7),
  popularClips('/popularClips', 'popularClips', 8),
  /* Search tag and result */
  searchTag('/searchTag', 'searchTag', 9),
  searchTagResult('/searchTagResult', 'searchTagResult', 10),
  searchResult('/searchResult', 'searchResult', 11),
  searchResultChannel('/searchResultChannel', 'searchResultChannel', 12),
  /* Channel detail  */
  channelVod('/channelVodAll', 'channelVodAll', 13),
  channelClip('/channelClipAll', 'channelClipAll', 14),
  /* Category deatil */
  categoryDetail('/categoryDetail', 'categoryDetail', 15),
  /* group */
  group('/group', 'group', 16),
  groupGenerate('/groupGenerate', 'groupGenerate', 17),
  /* clip player */
  clipPlayer('/clipPlayer', 'clipPlayer', 18),
  /* streaming */
  liveStream('/liveStream', 'liveStream', 19),
  vodStream('/vodStream', 'vodStream', 20);

  final String routePath;
  final String routeName;
  final int screenIndex;

  const AppRoute(this.routePath, this.routeName, this.screenIndex);
}

enum DpadAction {
  arrowUp,
  arrowDown,
  arrowLeft,
  arrowRight,
  select,
}

enum KeyboardCase {
  lower,
  upper,
}

enum KeyboardLanguage {
  english,
  korean,
}

enum LoginStep {
  id,
  password,
  passwordAgain,
  captcha,
}

enum VideoSortType {
  popular('POPULAR'),
  latest('LATEST'),
  live('LIVE'),
  vod('VOD'),
  following('FOLLOWING'),
  popularClip('POPULAR'),
  recentClip('RECENT'),
  recommendClip('RECOMMEND'),
  watchingHistory('WatchingHistory');

  final String value;

  const VideoSortType(this.value);
}

enum DialogButtonType {
  singleButton,
  doubleButton,
}

/// Type of the setting value.
///
/// It depends on whether the number of setting values is fixed or
/// it's an infinite(or finite) range like an int value.
enum SettingItemType {
  limited, // If there is a fixed number of values that can be set.
  range, // If the value that can be set is in the range of int or something.
}

enum FilterType {
  dayStr('WITHIN_ONE_DAY', '24시간'),
  dayNum('WITHIN_1_DAY', '실시간'),
  weekStr('WITHIN_SEVEN_DAYS', '7일'),
  weekNum('WITHIN_7_DAYS', '주간'),
  month('WITHIN_THIRTY_DAYS', '30일'),
  popular('POPULAR', '인기'),
  latest('LATEST', '최신'),
  all('ALL', '전체');

  final String value;
  final String name;

  const FilterType(this.value, this.name);
}

enum ClipOrderType {
  popular('POPULAR', '클립 (인기순)'),
  recent('RECENT', '클립 (최신순)'),
  recommend('RECOMMEND', '클립 (추천)');

  final String value;
  final String name;

  const ClipOrderType(this.value, this.name);
}

enum ChatCmd {
  ping(0),
  pong(10000),
  connect(100),
  connected(10100),
  requestRecentChat(5101),
  recentChat(15101),
  event(93006),
  chat(93101),
  donation(93102),
  kick(94005),
  block(94006),
  blind(94008),
  notice(94010),
  penalty(94015),
  sendChat(3101);

  final int value;

  const ChatCmd(this.value);
}

enum MsgTypeCode {
  text(1),
  image(2),
  sticker(3),
  video(4),
  rich(5),
  donation(10),
  subscription(11),
  systemMsg(30);

  final int value;

  const MsgTypeCode(this.value);
}

enum MissionDonationType {
  alone('ALONE'),
  participation('PARTICIPATION');

  final String value;

  const MissionDonationType(this.value);
}

enum DonationType {
  chat('CHAT'),
  video('VIDEO'),
  mission('MISSION');

  final String value;

  const DonationType(this.value);
}

enum WatchEventType {
  watchStarted('WATCH_STARTED'),
  watchContinued('WATCH_CONTINUED'),
  watchPaused('WATCH_PAUSED'),
  watchEnded('WATCH_ENDED'),
  watchResumed('WATCH_RESUMED');

  final String value;

  const WatchEventType(this.value);
}

enum PlaybackDirection {
  forward,
  backward,
}

enum VodStreamOverlayType {
  none,
  main,
  channel,
  chatSettings,
  resolutionSettings,
  playbackSpeedSettings,
}

enum LiveStreamOverlayType {
  none,
  main,
  following,
  popular,
  category,
  group,
  chatSettings,
  soundSettings,
  resolutionSettings,
  groupSettings,
  multiviewInfo,
  multiviewScreenSettings,
}

enum ChatWindowMode {
  off,
  overlay,
  side,
}

enum LiveMode {
  single,
  multi,
}

enum PlayAlertType {
  dialog,
  snankbar,
}