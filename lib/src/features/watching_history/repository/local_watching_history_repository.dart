import '../../../utils/shared_preferences/shared_prefs.dart';
import '../../../utils/shared_preferences/shared_prefs_repository.dart';
import '../model/watching_history.dart';

class LocalWatchingHistoryRepository
    extends SharedPrefsRepository<List<WatchingHistory>> {
  LocalWatchingHistoryRepository({required super.prefs})
      : super(dbKey: SharedPrefsDBKey.watchingHistory);

  @override
  List<WatchingHistory> fromJson(Map<String, dynamic> json) {
    final List<dynamic> list = json['data'];
    return list.map((item) => WatchingHistory.fromJson(item)).toList();
  }

  @override
  List<WatchingHistory> initValue() => [];

  @override
  Map<String, dynamic> toJson(List<WatchingHistory> item) {
    return {'data': item.map((history) => history.toJson()).toList()};
  }

  Future<void> saveWatchingHistory(WatchingHistory history) async {
    final histories = getValues();

    final existingIndex =
    histories.indexWhere((h) => h.videoNo == history.videoNo);

    if (existingIndex != -1) {
      histories.removeAt(existingIndex);
    }

    histories.insert(0, history);

    while (histories.length > 10) {
      histories.removeLast();
    }

    await updateValue(histories);
  }

  Future<void> removeWatchingHistory(int videoNo) async {
    final histories = getValues();

    histories.removeWhere((history) => history.videoNo == videoNo);

    await updateValue(histories);
  }
}