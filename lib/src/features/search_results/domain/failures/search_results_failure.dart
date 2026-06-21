sealed class SearchResultsFailure implements Exception {
  const SearchResultsFailure(this.message);

  final String message;

  @override
  String toString() {
    return message;
  }
}

final class SearchResultsLoadFailure extends SearchResultsFailure {
  const SearchResultsLoadFailure()
    : super('Unable to load CHZZK search results.');
}
