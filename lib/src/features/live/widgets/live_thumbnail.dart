import 'package:flutter/material.dart';

import '../../../common/constants/dimensions.dart';
import '../../../common/widgets/ui/ui_widgets.dart' show Thumbnail;
import '../model/live_info.dart';

class LiveThumbnail extends StatelessWidget {
  /// A thumbnail image of live streaming.
  ///
  /// If the broadcast is adult-verified only and the user is not logged in
  /// or not verified as an adult, it shows an age restriction mark.
  const LiveThumbnail({
    super.key,
    this.imageWidth = Dimensions.videoThumbnailWidth,
    this.imageHeight = Dimensions.videoThumbnailHeight,
    required this.liveInfo,
  });

  final double imageWidth;
  final double imageHeight;
  final LiveInfo liveInfo;

  @override
  Widget build(BuildContext context) {
    // use default thumbnail if the streamer has set
    final bool hasDefaultThumbnail =
        (liveInfo.defaultThumbnailImageUrl?.isNotEmpty ?? false);
    final bool useLatestImage = !hasDefaultThumbnail;

    // in the general case
    final String? rawThumbnailUrl = hasDefaultThumbnail
        ? liveInfo.defaultThumbnailImageUrl
        : liveInfo.liveImageUrl;

    // use 360p image to reduce usage of resouces
    final String? thumbnailUrl = rawThumbnailUrl?.replaceAll(
      'image_{type}.jpg',
      'image_360.jpg',
    );

    return Thumbnail(
      thumbnailUrl: thumbnailUrl,
      adult: liveInfo.adult ?? false,
      abroad: liveInfo.blindType == "ABORAD",
      useLatestImage: useLatestImage,
    );
  }
}
