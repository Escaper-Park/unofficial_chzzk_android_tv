sealed class FollowingFailure implements Exception {
  const FollowingFailure(this.message);

  final String message;

  @override
  String toString() {
    return message;
  }
}

final class FollowingLoadFailure extends FollowingFailure {
  const FollowingLoadFailure() : super('Unable to load CHZZK following data.');
}
