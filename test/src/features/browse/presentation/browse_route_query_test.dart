import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/browse/presentation/bloc/browse_bloc.dart';
import 'package:unofficial_chzzk_android_tv/src/features/browse/presentation/browse_route_query.dart';

void main() {
  test('builds popular live query parameters', () {
    final query = BrowseRouteQuery.popularLive();

    expect(query[BrowseRouteQuery.tabKey], BrowseTab.live.name);
    expect(
      query[BrowseRouteQuery.liveSortKey],
      BrowseLiveSortOption.popular.name,
    );
  });

  test('builds watching history query parameters', () {
    final query = BrowseRouteQuery.watchingHistory();

    expect(query[BrowseRouteQuery.tabKey], BrowseTab.vod.name);
    expect(
      query[BrowseRouteQuery.vodSortKey],
      BrowseVodSortOption.watchingHistory.name,
    );
  });

  test('falls back to default values for invalid query parameters', () {
    const query = {
      BrowseRouteQuery.tabKey: 'unknown',
      BrowseRouteQuery.liveSortKey: 'unknown',
      BrowseRouteQuery.vodSortKey: 'unknown',
    };

    expect(BrowseRouteQuery.tabFrom(query), BrowseTab.live);
    expect(BrowseRouteQuery.liveSortFrom(query), BrowseLiveSortOption.popular);
    expect(BrowseRouteQuery.vodSortFrom(query), BrowseVodSortOption.popular);
  });
}
