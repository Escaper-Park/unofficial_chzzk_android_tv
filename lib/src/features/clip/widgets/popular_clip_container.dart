import 'package:flutter/material.dart';

import '../../../common/constants/styles.dart';
import '../../../common/widgets/focused_widget.dart';
import '../../../common/widgets/rounded_container.dart';

import '../model/clip.dart';

import './popular_clip_info.dart';
import './popular_clip_thumbnail.dart';

class PopularClipContainer extends StatelessWidget {
  /// Popular clip container
  const PopularClipContainer({
    super.key,
    required this.autofocus,
    required this.imageWidth,
    required this.imageHeight,
    required this.clip,
    required this.onPressed,
  });

  final bool autofocus;

  /// Width of thumbnail image
  final double imageWidth;

  /// Height of thumbnail image
  final double imageHeight;

  final NaverClip clip;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      backgroundColor: AppColors.greyContainerColor,
      width: imageWidth,
      height: imageHeight,
      child: FocusedOutlinedButton(
        autofocus: autofocus,
        onPressed: onPressed,
        child: (_) => Stack(
          children: [
            // Thumbnail
            PopularClipThumbnail(
              clip: clip,
              imageWidth: imageWidth,
              imageHeight: imageHeight,
            ),
            // Info
            PopularClipInfo(clipTitle: clip.clipTitle),
          ],
        ),
      ),
    );
  }
}
