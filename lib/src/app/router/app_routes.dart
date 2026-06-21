enum AppRoute {
  home('/'),
  following('/following'),
  category('/category'),
  categoryDetail('/category-detail/:categoryType/:categoryId'),
  browse('/browse'),
  search('/search'),
  searchResults('/search/results'),
  searchTagResults('/search/tag-results'),
  group('/group'),
  settings('/settings'),
  settingsLicenses('/settings/licenses'),
  auth('/auth'),
  channel('/channel/:channelId'),
  livePlayer('/live'),
  vodPlayer('/vod');

  const AppRoute(this.path);

  final String path;
}
