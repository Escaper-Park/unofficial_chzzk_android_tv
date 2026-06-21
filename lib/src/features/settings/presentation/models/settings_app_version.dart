bool isSettingsUpdateAvailable({
  required String currentVersion,
  required String latestTag,
}) {
  final current = SettingsAppVersion.tryParse(currentVersion);
  final latest = SettingsAppVersion.tryParse(latestTag);
  if (current == null || latest == null) {
    return false;
  }

  return latest.compareTo(current) > 0;
}

final class SettingsAppVersion implements Comparable<SettingsAppVersion> {
  const SettingsAppVersion._({
    required this.major,
    required this.minor,
    required this.patch,
    required this.preRelease,
  });

  final int major;
  final int minor;
  final int patch;
  final String? preRelease;

  static SettingsAppVersion? tryParse(String value) {
    final normalized = value.trim().replaceFirst(
      RegExp('^v', caseSensitive: false),
      '',
    );
    final match = RegExp(
      r'^(\d+)(?:\.(\d+))?(?:\.(\d+))?(?:-([0-9A-Za-z.-]+))?(?:\+[0-9A-Za-z.-]+)?$',
    ).firstMatch(normalized);
    if (match == null) {
      return null;
    }

    return SettingsAppVersion._(
      major: int.parse(match.group(1)!),
      minor: int.parse(match.group(2) ?? '0'),
      patch: int.parse(match.group(3) ?? '0'),
      preRelease: match.group(4),
    );
  }

  @override
  int compareTo(SettingsAppVersion other) {
    final coreComparison = _compareValues([
      major.compareTo(other.major),
      minor.compareTo(other.minor),
      patch.compareTo(other.patch),
    ]);
    if (coreComparison != 0) {
      return coreComparison;
    }

    return _comparePreRelease(preRelease, other.preRelease);
  }
}

int _compareValues(List<int> comparisons) {
  for (final comparison in comparisons) {
    if (comparison != 0) {
      return comparison;
    }
  }

  return 0;
}

int _comparePreRelease(String? left, String? right) {
  if (left == null && right == null) {
    return 0;
  }
  if (left == null) {
    return 1;
  }
  if (right == null) {
    return -1;
  }

  final leftParts = left.split('.');
  final rightParts = right.split('.');
  final length = leftParts.length > rightParts.length
      ? leftParts.length
      : rightParts.length;

  for (var index = 0; index < length; index += 1) {
    if (index >= leftParts.length) {
      return -1;
    }
    if (index >= rightParts.length) {
      return 1;
    }

    final comparison = _comparePreReleasePart(
      leftParts[index],
      rightParts[index],
    );
    if (comparison != 0) {
      return comparison;
    }
  }

  return 0;
}

int _comparePreReleasePart(String left, String right) {
  final leftNumber = int.tryParse(left);
  final rightNumber = int.tryParse(right);
  if (leftNumber != null && rightNumber != null) {
    return leftNumber.compareTo(rightNumber);
  }
  if (leftNumber != null) {
    return -1;
  }
  if (rightNumber != null) {
    return 1;
  }

  return left.compareTo(right);
}
