import 'package:flutter/material.dart';

import '../../../design/design.dart';
import '../../components/primitives/primitives.dart';
import 'tv_media_card_design.dart';
import 'tv_media_metadata_item.dart';

class TvMediaMetadataBadge extends StatelessWidget {
  const TvMediaMetadataBadge({
    super.key,
    required this.items,
    this.backgroundColor = TvMediaCardDesign.scrimBadgeColor,
    this.foregroundColor = AppColorTokens.neutral100,
  });

  final List<TvMediaMetadataItem> items;
  final Color backgroundColor;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    final values = TvTagDesign.resolve(TvTagSize.small);
    final style =
        (values.textStyle(Theme.of(context).textTheme) ?? const TextStyle())
            .copyWith(
              color: foregroundColor,
              fontWeight: FontWeight.w600,
            );

    return SizedBox(
      height: values.height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: TvRadius.sm.borderRadius,
        ),
        child: Padding(
          padding: values.padding,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var index = 0; index < items.length; index += 1) ...[
                if (index > 0) ...[
                  const SizedBox(
                    width: TvMediaCardDesign.metadataSeparatorSpacing,
                  ),
                  Text(
                    '•',
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    style: style,
                  ),
                  const SizedBox(
                    width: TvMediaCardDesign.metadataSeparatorSpacing,
                  ),
                ],
                Icon(
                  items[index].icon,
                  size: TvMediaCardDesign.metadataIconSize,
                  color: foregroundColor,
                ),
                const SizedBox(width: TvMediaCardDesign.metadataIconSpacing),
                Text(
                  items[index].label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: style,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
