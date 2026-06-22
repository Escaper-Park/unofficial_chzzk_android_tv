import 'package:flutter/material.dart';

import '../../../../../../core/ui/composites/media_cards/tv_media_title.dart';
import '../../../../../../core/ui/ui.dart';
import '../../../../../live/domain/entities/live_feed.dart';
import '../../../../../live/presentation/live_card_string.dart';
import '../../../../../live/presentation/view/shared/live_card_elapsed_ticker.dart';
import '../../../../../live/presentation/view/shared/live_card_formatters.dart';
import '../../../../../live/presentation/view/shared/live_tag_badges.dart';
import '../../../channel_screen_design.dart';

part 'channel_live_card_stats.dart';

class ChannelLiveMetadata extends StatelessWidget {
  const ChannelLiveMetadata({
    super.key,
    required this.item,
    required this.now,
  });

  final Live item;
  final DateTime Function() now;

  @override
  Widget build(BuildContext context) {
    final tags = _buildTags();

    return ColoredBox(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Padding(
        padding: TvMediaCardDesign.contentPadding,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TvMediaTitle(text: item.title, maxLines: 2),
              if (tags.isNotEmpty) ...[
                const SizedBox(height: ChannelScreenDesign.liveCardMetadataGap),
                TvMediaTagStrip(tags: tags),
              ],
              const SizedBox(height: ChannelScreenDesign.liveCardMetadataGap),
              _ChannelLiveStats(item: item, now: now),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildTags() {
    return buildLiveTagBadges(
      categoryValue: item.categoryValue,
      watchPartyTag: item.watchPartyTag,
      watchPartyType: item.watchPartyType,
      tags: item.tags,
    );
  }
}
