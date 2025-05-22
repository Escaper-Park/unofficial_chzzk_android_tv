import 'package:flutter/material.dart';

import '../../constants/styles.dart' show AppColors;
import 'ui_widgets.dart' show OptimizedNetworkImage;

class CircleAvatarProfileImage extends StatelessWidget {
  /// A circle avatar profile image.
  const CircleAvatarProfileImage({
    super.key,
    this.radius = 25.0,
    this.borderWidth = 2.0,
    this.useBorder = false,
    this.profileImageUrl,
  });

  /// Half the width or height of the container(or diameter).
  final double radius;
  final double borderWidth;

  /// If the channel is broadcasting, set this value to true.
  ///
  /// Use the boolean value of [channel.openLive], [following.streamer.openLive].
  final bool useBorder;

  final String? profileImageUrl;

  @override
  Widget build(BuildContext context) {
    final bool isInvalidImage = _checkIsInvalidProfileImage(profileImageUrl);

    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: useBorder ? AppColors.chzzkColor : Colors.transparent,
          width: borderWidth,
        ),
      ),
      child: isInvalidImage
          // show a black circle.
          ? CircleAvatar(
              radius: radius,
              backgroundColor: AppColors.blackColor,
            )
          : // profile image
          ClipRRect(
              borderRadius: BorderRadius.circular(radius),
              child: OptimizedNetworkImage(
                imageUrl: profileImageUrl!,
                imageWidth: radius * 2,
                imageHeight: radius * 2,
                useLatestThumbnail: false,
              ),
            ),
    );
  }

  bool _checkIsInvalidProfileImage(String? profileImageUrl) =>
      (profileImageUrl == null || profileImageUrl.isEmpty);
}
