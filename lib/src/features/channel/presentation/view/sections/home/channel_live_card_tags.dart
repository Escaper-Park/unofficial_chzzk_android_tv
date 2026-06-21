part of 'channel_live_card_metadata.dart';

Iterable<String> _regularTagTexts(
  List<String> tags,
  String? watchPartyTag,
) sync* {
  for (final tag in tags) {
    final tagText = trimmedLiveCardTextOrNull(tag);
    if (tagText == null || tagText == watchPartyTag) {
      continue;
    }
    yield tagText;
  }
}

String? _watchPartyLabelFor(String? watchPartyType) {
  final type = trimmedLiveCardTextOrNull(watchPartyType);

  if (type == null) {
    return null;
  }

  if (type.toUpperCase() == 'NORMAL') {
    return LiveCardString.watchParty;
  }

  return LiveCardString.watchPartyPlus;
}
