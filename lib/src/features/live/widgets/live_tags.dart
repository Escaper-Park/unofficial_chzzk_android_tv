import 'package:flutter/material.dart';

import '../../../common/widgets/ui/tags.dart';

class LiveTagsAll extends StatelessWidget {
  /// Category tag, Streamer tags, WatchParty tags.
  const LiveTagsAll({
    super.key,
    this.tags,
    this.watchPartyTag,
    this.categoryValue,
  });

  final List<String>? tags;
  final String? watchPartyTag;
  final String? categoryValue;

  @override
  Widget build(BuildContext context) {
    final categoryTagbadge = CategoryTagBadge(categoryValue: categoryValue);
    final watchpartyTagBadges =
        WatchPartyTagBadges(watchPartyTag: watchPartyTag);
    final streamerTags = StreamerTagBadges(tags: tags);

    return SizedBox(
      height: 20.0,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            categoryTagbadge,
            watchpartyTagBadges,
            streamerTags,
          ],
        ),
      ),
    );
  }
}
