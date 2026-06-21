import '../entities/watching_history.dart';

// ignore: one_member_abstracts
abstract interface class WatchingHistoryRepository {
  Future<WatchingHistoryPage> fetchWatchingHistory({
    int? size,
    WatchingHistoryCursor? cursor,
  });
}
