sealed class SettingsUpdateFailure implements Exception {
  const SettingsUpdateFailure(this.message);

  final String message;

  @override
  String toString() {
    return message;
  }
}

final class SettingsUpdateLoadFailure extends SettingsUpdateFailure {
  const SettingsUpdateLoadFailure()
    : super('Unable to load latest release information.');
}
