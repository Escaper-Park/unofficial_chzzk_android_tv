import 'package:flutter/material.dart';

import 'tv_media_card_design.dart';
import 'tv_media_metadata_item.dart';

class TvMediaMetadataRow extends StatelessWidget {
  const TvMediaMetadataRow({
    super.key,
    required this.items,
  });

  final List<TvMediaMetadataItem> items;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final style = textTheme.bodySmall?.copyWith(
      color: colorScheme.onSurface.withValues(alpha: 0.7),
      fontWeight: FontWeight.w600,
    );

    return ClipRect(
      child: Row(
        children: [
          for (var index = 0; index < items.length; index += 1) ...[
            if (index > 0)
              const SizedBox(width: TvMediaCardDesign.metadataGroupSpacing),
            Icon(
              items[index].icon,
              size: TvMediaCardDesign.metadataIconSize,
              color: colorScheme.onSurface.withValues(alpha: 0.7),
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
}
