import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/constants/dimensions.dart';
import '../../../../common/constants/styles.dart';
import '../../../../common/widgets/focused_widget.dart';
import '../../../../common/widgets/rounded_container.dart';

import '../../../../utils/router/app_router.dart';
import '../../controller/vod_controller.dart';
import '../../model/vod.dart';
import 'vod_container_widgets.dart';

class VodContainer extends StatelessWidget {
  const VodContainer({
    super.key,
    this.autofocus = false,
    this.focusNode,
    required this.vod,
    required this.infoWidget,
  });

  final bool autofocus;
  final FocusNode? focusNode;
  final Vod vod;

  /// Vod info is different when using in Channel Vod Container.
  final Widget infoWidget;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      backgroundColor: AppColors.greyContainerColor,
      borderRadius: 12.0,
      width: Dimensions.videoThumbnailSize.width,
      child: Consumer(
        builder: (context, ref, child) {
          return FocusedOutlinedButton(
            autofocus: autofocus,
            focusNode: focusNode,
            onPressed: () async {
              final vodResponse = await ref
                  .read(vodControllerProvider.notifier)
                  .getVodPlayback(videoNo: vod.videoNo);

              if (context.mounted) {
                if (vodResponse != null) {
                  context.pushNamed(AppRoute.vodStreaming.routeName, extra: {
                    'vodPath': vodResponse,
                    'vod': vod,
                  });
                }
              }
            },
            child: (hasFocus) => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: Dimensions.videoThumbnailSize.width,
                  height: Dimensions.videoThumbnailSize.height,
                  child: Stack(
                    children: [
                      VodThumbnail(vod: vod),
                      VodDuration(durationInSeconds: vod.duration),
                      VodPublishDateAt(publishDateAt: vod.publishDateAt),
                    ],
                  ),
                ),
                // Info Widget
                Expanded(child: infoWidget),
              ],
            ),
          );
        },
      ),
    );
  }
}
