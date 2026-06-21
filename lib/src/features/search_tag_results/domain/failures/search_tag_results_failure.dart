sealed class SearchTagResultsFailure implements Exception {
  const SearchTagResultsFailure(this.message);

  final String message;

  @override
  String toString() {
    return message;
  }
}

final class SearchTagResultsLoadFailure extends SearchTagResultsFailure {
  const SearchTagResultsLoadFailure()
    : super('Unable to load CHZZK tag search results.');
}
