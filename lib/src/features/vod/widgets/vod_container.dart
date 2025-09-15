import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/extensions/custom_extensions.dart';
import '../../../common/constants/dimensions.dart' show Dimensions;
import '../../../common/constants/enums.dart' show AppRoute;
import '../../../common/constants/styles.dart' show AppColors;
import '../../../common/widgets/ui/custom_badge.dart';
import '../../../common/widgets/ui/ui_widgets.dart'
    show
        CircleAvatarProfileImage,
        CustomBadge,
        FocusedOutlinedButton,
        RoundedContainer;
import '../../../utils/extensions/custom_formatter.dart';
import '../../../utils/popup/popup_utils.dart';
import '../../channel/widgets/channel_widgets.dart'
    show ChannelNameWithVerifiedMark;
import '../controller/vod_controller.dart';
import '../model/vod.dart';
import 'vod_widgets.dart';

part 'vod_container/vod_container_body.dart';
part 'vod_container/vod_info_card.dart';
part 'vod_container/vod_status_badges.dart';
part 'vod_container/vod_title.dart';

class VodContainer extends HookConsumerWidget {
  const VodContainer({
    super.key,
    required this.appRoute,
    required this.autofocus,
    this.displayChannelData = true,
    required this.focusNode,
    required this.vod,
    this.onVideoPop,
  });

  final AppRoute appRoute;
  final bool autofocus;
  final bool displayChannelData;
  final FocusNode focusNode;
  final Vod vod;
  final VoidCallback? onVideoPop;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoadingState = useState<bool>(false);

    return RoundedContainer(
      width: Dimensions.videoContainerWidth,
      height: Dimensions.videoContainerHeight,
      child: FocusedOutlinedButton(
        autofocus: autofocus,
        focusNode: focusNode,
        backgroundColor: AppColors.greyContainerColor,
        onPressed: isLoadingState.value == false
            ? () async {
                isLoadingState.value = true;

                await _tryPlay(ref, context);

                isLoadingState.value = false;
              }
            : () {},
        child: _VodContainerBody(
          vodThumbnail: VodThumbnail(
            vod: vod,
            timeline: vod.watchTimeline,
            duration: vod.duration,
          ),
          vodStatusBadge: _VodStatusBadges(vod: vod),
          vodInfoCard: _VodInfoCard(
            vod: vod,
            displayChannelData: displayChannelData,
          ),
        ),
      ),
    );
  }

  Future<void> _tryPlay(WidgetRef ref, BuildContext context) async {
    if (vod.channel?.personalData?.privateUserBlock == true) return;

    const String bannedTitle = '시청 제한 안내';

    if (vod.adult == true && vod.thumbnailImageUrl == null) {
      if (context.mounted) {
        const String adultBannedText1 = '사용자 보호를 위해 연령 제한이 설정된 라이브입니다.';
        const String adultBannedText2 = '시청을 원하면 로그인 후 본인 인증을 완료해주세요.';

        await PopupUtils.showButtonDialog(
          context: context,
          titleText: bannedTitle,
          contentText: '$adultBannedText1\n$adultBannedText2',
        );

        return;
      }
    }

    if (vod.blindType == 'ABROAD') {
      if (context.mounted) {
        const String abroadBannedText = '해외 시청 제한';

        await PopupUtils.showButtonDialog(
          context: context,
          titleText: bannedTitle,
          contentText: abroadBannedText,
        );
      }
      return;
    }

    final getVodResult = await ref
        .read(vodControllerProvider.notifier)
        .addVodToPlaylist(videoNo: vod.videoNo);

    if (getVodResult == false) {
      if (context.mounted) {
        const String errorText = '시청 오류';

        await PopupUtils.showButtonDialog(
          context: context,
          titleText: bannedTitle,
          contentText: errorText,
        );
      }
      return;
    }

    if (context.mounted) {
      await GoRouter.of(context).push('/${AppRoute.vodStream.name}');
      onVideoPop?.call();
    }
  }
}
