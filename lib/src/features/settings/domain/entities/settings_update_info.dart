abstract interface class SettingsUpdateInfo {
  String get tagName;

  String get body;
}

final class SettingsReleaseInfo implements SettingsUpdateInfo {
  const SettingsReleaseInfo({
    required this.tagName,
    required this.body,
  });

  @override
  final String tagName;

  @override
  final String body;
}
