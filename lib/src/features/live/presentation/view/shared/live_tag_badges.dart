import 'package:flutter/widgets.dart';

import '../../../../../core/ui/ui.dart';
import '../../live_card_string.dart';
import 'live_card_formatters.dart';

List<Widget> buildLiveTagBadges({
  required String? categoryValue,
  required String? watchPartyTag,
  required String? watchPartyType,
  required List<String> tags,
}) {
  final categoryTag = trimmedLiveCardTextOrNull(categoryValue);
  final watchPartyLabel = watchPartyLabelFor(watchPartyType);
  final trimmedWatchPartyTag = watchPartyLabel == null
      ? null
      : trimmedLiveCardTextOrNull(watchPartyTag);

  return [
    if (categoryTag != null)
      TvMediaBadge(
        text: categoryTag,
        backgroundColor: TvMediaCardDesign.tagBackgroundColor,
      ),
    if (watchPartyLabel != null) ...[
      TvMediaBadge(
        text: watchPartyLabel,
        outlined: true,
        borderColor: AppColorTokens.brandColor,
        textColor: AppColorTokens.brandColor,
      ),
      if (trimmedWatchPartyTag != null)
        TvMediaBadge(
          text: trimmedWatchPartyTag,
          outlined: true,
          borderColor: AppColorTokens.brandColor,
          textColor: AppColorTokens.brandColor,
        ),
    ],
    for (final tag in regularLiveTagTexts(tags, trimmedWatchPartyTag))
      TvMediaBadge(
        text: tag,
        outlined: true,
        borderColor: TvMediaCardDesign.tagOutlineColor,
        textColor: AppColorTokens.neutral100,
      ),
  ];
}

Iterable<String> regularLiveTagTexts(
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

String? watchPartyLabelFor(String? watchPartyType) {
  final type = trimmedLiveCardTextOrNull(watchPartyType);

  if (type == null) {
    return null;
  }

  if (type.toUpperCase() == 'NORMAL') {
    return LiveCardString.watchParty;
  }

  return LiveCardString.watchPartyPlus;
}
