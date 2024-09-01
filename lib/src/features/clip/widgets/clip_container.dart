import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/constants/api.dart';
import '../../../common/constants/dimensions.dart';
import '../../../common/constants/styles.dart';
import '../../../common/widgets/focused_widget.dart';
import '../../../common/widgets/rounded_container.dart';

import '../../../utils/popup/popup_utils.dart';
import '../../../utils/router/app_router.dart';
import '../model/clip.dart';

import './clip_info.dart';
import './clip_thumbnail.dart';

class ClipContainer extends ConsumerWidget {
  const ClipContainer({
    super.key,
    this.autofocus = false,
    this.imageWidth = Dimensions.videoThumbnailWidth,
    required this.clip,
  });

  final bool autofocus;
  final double imageWidth;
  final NaverClip clip;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RoundedContainer(
      backgroundColor: AppColors.greyContainerColor,
      borderRadius: 12.0,
      width: Dimensions.videoThumbnailWidth,
      child: FocusedOutlinedButton(
        autofocus: autofocus,
        onPressed: () async {
          // non-auth Adult
          if (clip.videoId == null || clip.thumbnailImageUrl == null) {
            if (context.mounted) {
              await PopupUtils.showButtonDialog(
                context: context,
                titleText: clip.adult ? '연령 제한 클립' : '제한된 클립',
                contentText: '재생할 수 없는 영상입니다',
              );
            }
          }
          // Play clip
          else {
            context.pushNamed(
              AppRoute.clip.routeName,
              extra: {
                'url': '${ApiUrl.naverClipEmbed}/${clip.clipUID}?autoplay=1'
              },
            );
          }
        },
        child: (_) => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            ClipThumbnail(clip: clip),
            // Info
            Expanded(
              child: ClipInfo(clip: clip),
            ),
          ],
        ),
      ),
    );
  }
}
