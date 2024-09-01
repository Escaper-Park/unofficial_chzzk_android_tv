import 'package:flutter/material.dart';

import '../constants/styles.dart';
import 'optimized_image.dart';

class CircleAvatarProfileImage extends StatelessWidget {
  /// A circle avatar profile image.
  ///
  /// If the image's extension is 'gif', shows the empty CircleAvatar
  /// to prevent memory leaking problem.
  const CircleAvatarProfileImage({
    super.key,
    this.radius = 25.0,
    this.useBorder = false,
    required this.profileImageUrl,
  });

  /// Half the width or height of the container(or diameter).
  final double radius;

  /// If the channel is broadcasting, set this value to true.
  ///
  /// Use [channel.openLive], [following.streamer.openLive].
  final bool useBorder;

  final String? profileImageUrl;

  @override
  Widget build(BuildContext context) {
    // Check the profileImageUrl is available or the extension of the image is 'gif'.
    final bool isInvalidProfileImage = (profileImageUrl == null ||
        profileImageUrl!.isEmpty ||
        profileImageUrl!.toLowerCase().contains('.gif'));

    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: useBorder ? AppColors.chzzkColor : Colors.transparent,
          width: 2.0,
        ),
      ),
      child: isInvalidProfileImage
          ? CircleAvatar(
              radius: radius,
              backgroundColor: AppColors.blackColor,
            )
          : ClipRRect(
              borderRadius: BorderRadius.circular(radius),
              child: OptimizedNetworkImage(
                imageUrl: profileImageUrl!,
                useCacheKey: true,
                useDynamicCacheKey: false,
                imageWidth: radius * 2,
                imageHeight: radius * 2,
              ),
            ),
    );
  }
}
