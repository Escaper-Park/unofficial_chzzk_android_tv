import 'package:flutter/material.dart';

import '../../../../core/ui/ui.dart';
import '../../../player_shared/presentation/player_browse/player_browse.dart';
import '../bloc/live_player_bloc.dart';
import '../live_player_screen_string.dart';

class LivePlayerBrowsePlaceholder extends StatelessWidget {
  const LivePlayerBrowsePlaceholder({
    super.key,
    required this.section,
    required this.status,
    required this.fallbackAction,
    required this.onFallbackPressed,
  });

  final LivePlayerBrowseSection section;
  final LivePlayerBrowseLoadStatus status;
  final LivePlayerBrowseFallbackAction fallbackAction;
  final VoidCallback onFallbackPressed;

  @override
  Widget build(BuildContext context) {
    final actionLabel = LivePlayerScreenString.browseFallbackActionLabel(
      fallbackAction,
    );
    if (actionLabel == null) {
      return TvPlayerBrowseMessage(
        label: LivePlayerScreenString.browseFallbackMessage(section, status),
      );
    }

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            LivePlayerScreenString.browseFallbackMessage(section, status),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColorTokens.neutral100,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          TvButton.label(
            text: actionLabel,
            icon: _fallbackIcon(fallbackAction),
            autofocus: true,
            onPressed: onFallbackPressed,
          ),
        ],
      ),
    );
  }
}

IconData _fallbackIcon(LivePlayerBrowseFallbackAction action) {
  return switch (action) {
    LivePlayerBrowseFallbackAction.none => Icons.info_outline,
    LivePlayerBrowseFallbackAction.showPopular => Icons.trending_up,
    LivePlayerBrowseFallbackAction.closeBrowse => Icons.close,
  };
}
