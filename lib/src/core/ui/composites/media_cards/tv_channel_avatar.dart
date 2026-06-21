import 'package:flutter/material.dart';

import '../../components/primitives/profile_circle_avatar.dart';
import 'tv_media_badge.dart';
import 'tv_media_card_design.dart';

class TvChannelAvatar extends StatelessWidget {
  const TvChannelAvatar({
    super.key,
    required this.imageUrl,
    this.radius = 16,
    this.openLive = false,
    this.liveBorderWidth = 2,
    this.liveBadgeText = 'LIVE',
    this.liveBadgeHeight = 20,
    this.liveBadgeOverlap = 10,
  }) : assert(radius > 0),
       assert(liveBorderWidth >= 0),
       assert(liveBadgeHeight > 0),
       assert(liveBadgeOverlap >= 0);

  final String? imageUrl;
  final double radius;
  final bool openLive;
  final double liveBorderWidth;
  final String liveBadgeText;
  final double liveBadgeHeight;
  final double liveBadgeOverlap;

  @override
  Widget build(BuildContext context) {
    final avatarDiameter = radius * 2;
    final height = openLive
        ? avatarDiameter + liveBadgeHeight - liveBadgeOverlap
        : avatarDiameter;

    return SizedBox(
      width: avatarDiameter,
      height: height,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          ProfileCircleAvatar(
            imageUrl: imageUrl,
            radius: radius,
            openLive: openLive,
            liveBorderWidth: liveBorderWidth,
          ),
          if (openLive)
            Positioned(
              top: avatarDiameter - liveBadgeOverlap,
              child: TvMediaBadge(
                text: liveBadgeText,
                backgroundColor: TvMediaCardDesign.liveBadgeColor,
              ),
            ),
        ],
      ),
    );
  }
}
