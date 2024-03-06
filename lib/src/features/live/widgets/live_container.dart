import 'package:flutter/material.dart';

import '../../../common/constants/dimensions.dart';

import '../../../common/constants/styles.dart';
import '../../../common/widgets/focused_outline_button.dart';

import '../../../common/widgets/rounded_container.dart';
import '../../../utils/popup/popup_utils.dart';
import '../../../utils/router/app_router.dart';
import '../model/live.dart';

import 'live_channel_info.dart';
import 'live_thumbnail.dart';

class LiveContainer extends StatelessWidget {
  const LiveContainer({
    super.key,
    required this.liveDetail,
    this.autofocus = false,
    this.focusNode,
    this.onPressed,
  });

  final LiveDetail liveDetail;
  final bool autofocus;
  final FocusNode? focusNode;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: RoundedContainer(
        backgroundColor: AppColors.greyContainerColor,
        borderRadius: 12.0,
        width: Dimensions.liveThumbnailSize.width,
        child: FocusedOutlineButton(
          autofocus: autofocus,
          focusNode: focusNode,
          onPressed: onPressed ??
              () async {
                final String? livePath = liveDetail.livePath;

                if (context.mounted) {
                  if (livePath == null) {
                    await PopupUtils.showSingleDialog(
                      context: context,
                      titleText: '19금 연령 제한',
                      contentText: '연령 제한된 콘텐츠는 로그인해야 시청할 수 있습니다',
                    );
                  } else {
                    context.pushNamed(
                      AppRoute.liveStreaming.routeName,
                      extra: liveDetail,
                    );
                  }
                }
              },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LiveThumbnailWithStatus(liveDetail: liveDetail),
              Expanded(
                child: LiveChannelInfo(liveDetail: liveDetail),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
