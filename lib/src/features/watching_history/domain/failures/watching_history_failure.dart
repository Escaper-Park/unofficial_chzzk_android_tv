sealed class WatchingHistoryFailure implements Exception {
  const WatchingHistoryFailure(this.message);

  final String message;

  @override
  String toString() {
    return message;
  }
}

final class WatchingHistoryLoadFailure extends WatchingHistoryFailure {
  const WatchingHistoryLoadFailure()
    : super('Unable to load CHZZK watching history.');
}
