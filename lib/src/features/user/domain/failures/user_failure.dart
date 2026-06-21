sealed class UserFailure implements Exception {
  const UserFailure(this.message);

  final String message;

  @override
  String toString() {
    return message;
  }
}

final class UserStatusLoadFailure extends UserFailure {
  const UserStatusLoadFailure() : super('Unable to load CHZZK user status.');
}

final class PrivateUserBlocksLoadFailure extends UserFailure {
  const PrivateUserBlocksLoadFailure()
    : super('Unable to load private user blocks.');
}
