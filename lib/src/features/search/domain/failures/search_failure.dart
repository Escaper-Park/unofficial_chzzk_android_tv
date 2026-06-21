sealed class SearchFailure implements Exception {
  const SearchFailure(this.message);

  final String message;

  @override
  String toString() {
    return message;
  }
}

final class SearchSuggestionLoadFailure extends SearchFailure {
  const SearchSuggestionLoadFailure()
    : super('Unable to load CHZZK search suggestions.');
}
