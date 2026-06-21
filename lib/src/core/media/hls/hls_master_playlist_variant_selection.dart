part of 'hls_master_playlist.dart';

HlsVariantStream _selectByHeight(
  List<HlsVariantStream> variants,
  int targetHeight,
) {
  HlsVariantStream? bestAtOrBelowTarget;

  for (final variant in variants) {
    final height = variant.height!;
    if (height <= targetHeight) {
      bestAtOrBelowTarget = variant;
      continue;
    }

    return bestAtOrBelowTarget ?? variant;
  }

  return bestAtOrBelowTarget!;
}

int _clampRank(int rank, int length) {
  if (rank < 0) {
    return 0;
  }
  if (rank >= length) {
    return length - 1;
  }

  return rank;
}

int _compareByHeightThenBandwidth(
  HlsVariantStream left,
  HlsVariantStream right,
) {
  final heightComparison = left.height!.compareTo(right.height!);
  if (heightComparison != 0) {
    return heightComparison;
  }

  return _compareByBandwidth(left, right);
}

int _compareByBandwidth(
  HlsVariantStream left,
  HlsVariantStream right,
) {
  final leftBandwidth = left.preferredBandwidth ?? -1;
  final rightBandwidth = right.preferredBandwidth ?? -1;
  return leftBandwidth.compareTo(rightBandwidth);
}
