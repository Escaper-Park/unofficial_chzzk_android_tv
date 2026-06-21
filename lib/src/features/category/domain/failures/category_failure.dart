sealed class CategoryFailure implements Exception {
  const CategoryFailure(this.message);

  final String message;

  @override
  String toString() {
    return message;
  }
}

final class CategoryLoadFailure extends CategoryFailure {
  const CategoryLoadFailure() : super('Unable to load categories from CHZZK.');
}

final class CategoryMutationFailure extends CategoryFailure {
  const CategoryMutationFailure()
    : super('Unable to update CHZZK category state.');
}
