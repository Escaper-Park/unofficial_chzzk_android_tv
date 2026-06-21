import 'package:flutter/material.dart';

import '../../../../core/ui/components/cards/cards.dart';
import 'tv_player_browse_overlay_design.dart';

class TvPlayerBrowseMessage extends StatelessWidget {
  const TvPlayerBrowseMessage({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        label,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TvPlayerBrowseOverlayDesign.headerTextStyle(
          context,
          TvCardWidth.four,
        ),
      ),
    );
  }
}
