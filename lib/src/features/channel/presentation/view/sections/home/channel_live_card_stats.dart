part of 'channel_live_card_metadata.dart';

class _ChannelLiveStats extends StatelessWidget {
  const _ChannelLiveStats({
    required this.item,
    required this.now,
  });

  final Live item;
  final DateTime Function() now;

  @override
  Widget build(BuildContext context) {
    final startedAt = parseLiveCardOpenDate(item.openDate);

    if (startedAt == null) {
      return _ChannelLiveStatsContent(
        item: item,
        startedAt: null,
        currentTime: now(),
      );
    }

    return LiveCardElapsedSnapshot(
      now: now,
      snapshotKey: startedAt,
      builder: (context, currentTime) {
        return _ChannelLiveStatsContent(
          item: item,
          startedAt: startedAt,
          currentTime: currentTime,
        );
      },
    );
  }
}

class _ChannelLiveStatsContent extends StatelessWidget {
  const _ChannelLiveStatsContent({
    required this.item,
    required this.startedAt,
    required this.currentTime,
  });

  final Live item;
  final DateTime? startedAt;
  final DateTime currentTime;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final color = colorScheme.onSurface.withValues(alpha: 0.7);
    final style = textTheme.bodySmall?.copyWith(
      color: color,
      fontWeight: FontWeight.w600,
    );
    final items = _items;

    return ClipRect(
      child: Row(
        children: [
          for (var index = 0; index < items.length; index += 1) ...[
            if (index > 0) ...[
              const SizedBox(width: TvMediaCardDesign.metadataGroupSpacing),
              _ChannelLiveStatsDot(color: color),
              const SizedBox(width: TvMediaCardDesign.metadataGroupSpacing),
            ],
            Icon(
              items[index].icon,
              size: TvMediaCardDesign.metadataIconSize,
              color: color,
            ),
            const SizedBox(width: TvMediaCardDesign.metadataIconSpacing),
            Flexible(
              child: Text(
                items[index].label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: style,
              ),
            ),
          ],
        ],
      ),
    );
  }

  List<_ChannelLiveStatsItem> get _items {
    return [
      _ChannelLiveStatsItem(
        icon: Icons.person_rounded,
        label: LiveCardString.watchingCount(
          formatLiveCardGrouped(item.concurrentUserCount),
        ),
      ),
      if (_elapsedLabel != null)
        _ChannelLiveStatsItem(
          icon: Icons.schedule_rounded,
          label: _elapsedLabel!,
        ),
    ];
  }

  String? get _elapsedLabel {
    if (startedAt == null) {
      return null;
    }

    return formatLiveCardElapsed(currentTime.difference(startedAt!));
  }
}

class _ChannelLiveStatsDot extends StatelessWidget {
  const _ChannelLiveStatsDot({
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: const SizedBox.square(
        dimension: TvMediaCardDesign.metadataIconSize / 4,
      ),
    );
  }
}

final class _ChannelLiveStatsItem {
  const _ChannelLiveStatsItem({
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;
}
