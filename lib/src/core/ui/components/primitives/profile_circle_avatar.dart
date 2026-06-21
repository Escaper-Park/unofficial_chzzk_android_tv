import 'package:flutter/material.dart';

import '../../../design/design.dart';
import 'chzzk_image_url.dart';
import 'optimized_image.dart';

class ProfileCircleAvatar extends StatelessWidget {
  const ProfileCircleAvatar({
    super.key,
    required this.imageUrl,
    this.radius = _ProfileCircleAvatarDesign.radius,
    this.openLive = false,
    this.liveBorderWidth = _ProfileCircleAvatarDesign.liveBorderWidth,
  }) : assert(radius > 0, 'radius must be greater than zero.'),
       assert(liveBorderWidth >= 0, 'liveBorderWidth must not be negative.');

  final String? imageUrl;
  final double radius;
  final bool openLive;
  final double liveBorderWidth;

  @override
  Widget build(BuildContext context) {
    assert(
      !openLive || liveBorderWidth < radius,
      'liveBorderWidth must be smaller than radius.',
    );

    final borderWidth = openLive ? liveBorderWidth : 0.0;
    final outerSize = radius * 2;
    final imageSize = outerSize - borderWidth * 2;
    final fallback = _ProfileCircleAvatarFallback(size: imageSize);
    final url = chzzkImageUrlWithType(
      imageUrl,
      ChzzkImageVariant.profileAvatar,
    );

    return SizedBox.square(
      dimension: outerSize,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: openLive
              ? Border.all(
                  color: AppColorTokens.brandColor,
                  width: liveBorderWidth,
                )
              : null,
        ),
        child: Padding(
          padding: EdgeInsets.all(borderWidth),
          child: ClipOval(
            child: url == null
                ? fallback
                : OptimizedImage.network(
                    url,
                    width: imageSize,
                    height: imageSize,
                    placeholder: fallback,
                    errorFallback: fallback,
                  ),
          ),
        ),
      ),
    );
  }
}

class _ProfileCircleAvatarFallback extends StatelessWidget {
  const _ProfileCircleAvatarFallback({
    required this.size,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox.square(
      dimension: size,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colorScheme.surfaceContainerHighest,
        ),
        child: Icon(
          Icons.person,
          size: size * _ProfileCircleAvatarDesign.iconSizeFactor,
          color: colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}

abstract final class _ProfileCircleAvatarDesign {
  static const radius = 16.0;
  static const liveBorderWidth = 2.0;
  static const iconSizeFactor = 0.56;
}
