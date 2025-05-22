import 'package:flutter/material.dart';

import '../../../common/widgets/ui/ui_widgets.dart';
import '../model/vod.dart';

class VodTags extends StatelessWidget {
  const VodTags({super.key, required this.vod});

  final Vod vod;

  @override
  Widget build(BuildContext context) {
    final categoryTagbadge =
        CategoryTagBadge(categoryValue: vod.videoCategoryValue);

    final streamerTags = StreamerTagBadges(tags: vod.tags);

    return SizedBox(
      height: 20.0,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            categoryTagbadge,
            streamerTags,
          ],
        ),
      ),
    );
  }
}
