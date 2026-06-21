sealed class VodFailure implements Exception {
  const VodFailure(this.message);

  final String message;

  @override
  String toString() {
    return message;
  }
}

final class VodLoadFailure extends VodFailure {
  const VodLoadFailure() : super('Unable to load CHZZK VOD data.');
}

final class VodWatchEventFailure extends VodFailure {
  const VodWatchEventFailure() : super('Unable to post CHZZK VOD watch event.');
}
