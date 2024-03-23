import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/constants/dimensions.dart';
import '../../../common/constants/styles.dart';
import '../../../common/widgets/focused_outline_button.dart';
import '../../../common/widgets/rounded_container.dart';
import '../../../utils/popup/popup_utils.dart';
import '../../../utils/router/app_router.dart';
import '../model/vod.dart';
import 'vod_thumbnail.dart';
import 'vod_info.dart';

class VodContainer extends ConsumerWidget {
  const VodContainer({
    super.key,
    required this.vod,
    required this.getVodPath,
    this.autofocus = false,
  });

  final Vod vod;
  final bool autofocus;
  final Future<String?> Function() getVodPath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: RoundedContainer(
        backgroundColor: AppColors.greyContainerColor,
        borderRadius: 12.0,
        width: Dimensions.liveThumbnailSize.width,
        child: FocusedOutlineButton(
          autofocus: autofocus,
          onPressed: () async {
            final String? vodPath = await getVodPath();

            if (context.mounted) {
              if (vodPath == null) {
                await PopupUtils.showSingleDialog(
                  context: context,
                  titleText: '19금 연령 제한',
                  contentText: '연령 제한된 콘텐츠는 로그인해야 시청할 수 있습니다',
                );
              } else if (vodPath == 'RESTRICT') {
                await PopupUtils.showSingleDialog(
                  context: context,
                  titleText: '게재 제한',
                  contentText: '이 영상은 게재가 제한되었습니다',
                );
              } else {
                context.pushNamed(
                  AppRoute.vodStreaming.routeName,
                  extra: {
                    'vodPath': vodPath,
                    'vod': vod,
                  },
                );
              }
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VodThumbnailWithStatus(vod: vod),
              Expanded(
                child: VodInfo(vod: vod),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
