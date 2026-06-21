import 'package:flutter/material.dart';

import '../../../design/design.dart';

class TvPagination extends StatelessWidget {
  const TvPagination({
    super.key,
    required this.count,
    required this.activeIndex,
  });

  final int count;
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    if (count <= 0) {
      return const SizedBox.shrink();
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.4),
        borderRadius: TvRadius.xl.borderRadius,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 6,
          children: [
            for (var index = 0; index < count; index += 1)
              _TvPaginationDot(active: index == activeIndex),
          ],
        ),
      ),
    );
  }
}

class _TvPaginationDot extends StatelessWidget {
  const _TvPaginationDot({
    required this.active,
  });

  final bool active;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 8,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColorTokens.neutral100.withValues(
            alpha: active ? 1 : 0.2,
          ),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
