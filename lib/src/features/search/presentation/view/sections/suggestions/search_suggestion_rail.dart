import 'package:flutter/material.dart';

import '../../../../../../core/ui/ui.dart';
import '../../../search_screen_design.dart';

class SearchSuggestionRail extends StatelessWidget {
  const SearchSuggestionRail({
    super.key,
    required this.title,
    required this.icon,
    required this.node,
    required this.items,
    required this.upNode,
    required this.downNode,
    required this.onPressed,
  });

  final String title;
  final IconData icon;
  final FocusScopeNode node;
  final List<String> items;
  final FocusScopeNode? upNode;
  final FocusScopeNode? downNode;
  final ValueChanged<String> onPressed;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const SizedBox.shrink();
    }

    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: SearchScreenDesign.railTitlePadding,
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: SearchScreenDesign.railTitleStyle(context),
          ),
        ),
        const SizedBox(height: SearchScreenDesign.railTitleGap),
        SizedBox(
          height: SearchScreenDesign.railViewportHeight,
          child: TvRail(
            node: node,
            up: upNode,
            down: downNode,
            itemCount: items.length,
            itemExtent: SearchScreenDesign.suggestionCardWidth.value,
            itemBuilder: (context, index) {
              final item = items[index];

              return TvCard(
                type: TvCardType.compact,
                width: SearchScreenDesign.suggestionCardWidth,
                image: DecoratedBox(
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerHighest,
                  ),
                ),
                content: _SearchSuggestionCardContent(
                  icon: icon,
                  text: item,
                ),
                design: SearchScreenDesign.suggestionCardDesign(colorScheme),
                onPressed: () => onPressed(item),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _SearchSuggestionCardContent extends StatelessWidget {
  const _SearchSuggestionCardContent({
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      height: SearchScreenDesign.suggestionCardContentHeight,
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 18,
              color: colorScheme.onSurface,
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                text,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
