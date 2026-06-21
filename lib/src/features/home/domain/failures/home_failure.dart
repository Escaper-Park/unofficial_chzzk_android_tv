sealed class HomeFailure implements Exception {
  const HomeFailure(this.message);

  final String message;

  @override
  String toString() {
    return message;
  }
}

final class HomeTopLivesLoadFailure extends HomeFailure {
  const HomeTopLivesLoadFailure()
    : super('Unable to load CHZZK home top lives.');
}
