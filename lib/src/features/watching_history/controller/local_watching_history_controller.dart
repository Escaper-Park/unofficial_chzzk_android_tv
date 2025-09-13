import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../utils/shared_preferences/shared_prefs.dart';
import '../model/watching_history.dart';
import '../repository/local_watching_history_repository.dart';

part 'local_watching_history_controller.g.dart';

@riverpod
class LocalWatchingHistoryController extends _$LocalWatchingHistoryController {
  late LocalWatchingHistoryRepository _repository;

  @override
  List<WatchingHistory> build() {
    final prefs = ref.watch(sharedPrefsProvider);
    _repository = LocalWatchingHistoryRepository(prefs: prefs);
    return _repository.getValues();
  }

  Future<void> addWatchingHistory(WatchingHistory history) async {
    await _repository.saveWatchingHistory(history);
    ref.invalidateSelf();
  }

  WatchingHistory? getWatchingHistoryByVideoNo(int videoNo) {
    final currentState = state;

    if (currentState.isEmpty) {
      return null;
    }

    try {
      return currentState.firstWhere(
            (history) => history.videoNo == videoNo,
      );
    } catch (e) {
      return null;
    }
  }

  Future<void> removeWatchingHistory(int videoNo) async {
    await _repository.removeWatchingHistory(videoNo);
    ref.invalidateSelf();
  }

  Future<void> removeAllWatchingHistory() async {
    await _repository.clearAll();
    ref.invalidateSelf();
  }
}