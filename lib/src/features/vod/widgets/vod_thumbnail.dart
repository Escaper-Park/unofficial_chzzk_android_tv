import 'package:flutter/widgets.dart';

import '../../../common/widgets/ui/thumbnail.dart';
import '../model/vod.dart';

class VodThumbnail extends StatelessWidget {
  const VodThumbnail({super.key, required this.vod});

  final Vod vod;

  @override
  Widget build(BuildContext context) {
    return Thumbnail(
      thumbnailUrl: vod.thumbnailImageUrl,
      abroad: vod.blindType == "ABROAD",
      adult: vod.adult,
    );
  }
}
