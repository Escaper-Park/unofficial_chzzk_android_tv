sealed class LiveFailure implements Exception {
  const LiveFailure(this.message);

  final String message;

  @override
  String toString() {
    return message;
  }
}

final class LiveLoadFailure extends LiveFailure {
  const LiveLoadFailure() : super('Unable to load CHZZK live data.');
}

final class LiveWatchEventFailure extends LiveFailure {
  const LiveWatchEventFailure()
    : super('Unable to post CHZZK live watch event.');
}
