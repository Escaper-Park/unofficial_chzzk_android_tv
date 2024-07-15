import 'package:flutter/material.dart';

import '../constants/styles.dart';
import './optimized_image.dart';

class CircleAvatarProfileImage extends StatelessWidget {
  const CircleAvatarProfileImage({
    super.key,
    this.radius = 30.0,
    this.useBorder = false,
    this.fit = BoxFit.cover,
    required this.profileImageUrl,
  });

  final double radius;
  final bool useBorder;
  final BoxFit fit;
  final String? profileImageUrl;

  @override
  Widget build(BuildContext context) {
    return (profileImageUrl == null ||
            profileImageUrl!.isEmpty ||
            profileImageUrl!.contains('.gif') ||
            profileImageUrl!.contains('.GIF'))
        ? _circleShapedContainerWithBorder(
            CircleAvatar(
              radius: radius,
              backgroundColor: AppColors.blackColor,
            ),
            null,
          )
        : OptimizedNetworkImage(
            useCacheKey: true,
            useDynamicCacheKey: false,
            imageWidth: radius,
            imageHeight: radius,
            imageUrl: profileImageUrl!,
            imageBuilder: (context, imageProvider) {
              return _circleShapedContainerWithBorder(
                null,
                DecorationImage(
                  image: imageProvider,
                  fit: fit,
                ),
              );
            },
          );
  }

  Widget _circleShapedContainerWithBorder(
    Widget? child,
    DecorationImage? image,
  ) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        border: Border.all(
          color: useBorder ? AppColors.chzzkColor : Colors.transparent,
          width: 2.0,
        ),
        shape: BoxShape.circle,
        image: image,
      ),
      child: child,
    );
  }
}
