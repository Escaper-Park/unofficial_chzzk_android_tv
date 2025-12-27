import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../..//utils/popup/popup_utils.dart';
import '../../../common/constants/enums.dart' show AppRoute;
import '../../../common/constants/styles.dart' show AppColors;
import '../../../common/constants/dimensions.dart';
import '../../../common/widgets/ui/custom_badge.dart';
import '../../../common/widgets/ui/ui_widgets.dart'
    show
        CenteredText,
        CircleAvatarProfileImage,
        CustomBadge,
        FocusedOutlinedButton,
        RoundedContainer;
import '../../../utils/extensions/custom_formatter.dart' show CustomFormatter;
import '../../channel/model/channel.dart';
import '../../../utils/extensions/custom_extensions.dart';
import '../../channel/widgets/channel_widgets.dart'
    show ChannelNameWithVerifiedMark;
import '../../home/controller/home_refresh_controller.dart';
import '../controller/live_controller.dart';
import '../model/live_detail.dart';
import '../model/live_info.dart';
import 'live_widgets.dart';

part 'live_container/live_container_body.dart';
part 'live_container/live_title.dart';
part 'live_container/live_thumbnail.dart';
part 'live_container/live_status_badge.dart';
part 'live_container/live_info_card.dart';
part 'live_container/live_uptime_badge.dart';
part 'live_container/live_channel_name.dart';

class LiveContainer extends HookConsumerWidget {
  const LiveContainer({
    super.key,
    required this.autofocus,
    required this.focusNode,
    required this.appRoute,
    required this.channel,
    required this.liveInfo,
  });

  final bool autofocus;
  final FocusNode focusNode;

  final AppRoute appRoute;

  /// Basic information of the live stream.
  final LiveInfo liveInfo;

  /// Some [LiveInfo] api data doesn't include channel information, so add this.
  final Channel channel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoadingState = useState<bool>(false);

    final isBlocked = liveInfo.channel?.personalData?.privateUserBlock;

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
        child: isBlocked == true
            ? _blockedMessage()
            : _LiveContainerBody(
                openDate: liveInfo.openDate,
                liveThumbnail: _LiveThumbnail(liveInfo),
                liveStatusBadge: _LiveStatusBadge(liveInfo.concurrentUserCount),
                liveUptimeBadge: _LiveUptimeBadge(liveInfo.openDate),
                liveInfoCard: _LiveInfoCard(channel, liveInfo),
              ),
      ),
    );
  }

  Widget _blockedMessage() {
    return CenteredText(text: '차단한 유저의 라이브입니다.');
  }

  Future<void> _tryPlay(WidgetRef ref, BuildContext context) async {
    // blocked
    if (channel.personalData?.privateUserBlock == true) return;

    const String bannedTitle = '시청 제한 안내';
    const String streamEndTitle = '방송 종료 안내';

    // adult banned alert
    if (liveInfo.adult == true && liveInfo.liveImageUrl == null) {
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

    // abroad banned alert
    if (liveInfo.blindType == 'ABROAD') {
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

    // get live detail
    final LiveDetail? liveDetail = await ref
        .read(liveControllerProvider.notifier)
        .getLiveDetail(channelId: channel.channelId);

    // error
    if (liveDetail == null) return;

    // ended stream.
    if (liveDetail.livePlaybackJson.media.isEmpty) {
      if (context.mounted) {
        const String streamEndText = '종료된 방송입니다.';

        await PopupUtils.showButtonDialog(
          context: context,
          titleText: streamEndTitle,
          contentText: streamEndText,
          confirmCallback: appRoute == AppRoute.home
              ? () async => await ref
                  .read(homeRefreshControllerProvider.notifier)
                  .refresh()
              : () {},
        );
      }
      return;
    }

    // add to playlist
    ref
        .read(liveControllerProvider.notifier)
        .addLiveToPlaylist(liveDetail: liveDetail);

    // change screen
    if (context.mounted) {
      context.pushTo(
        context: context,
        currentLocation: appRoute,
        appRoute: AppRoute.liveStream,
        extra: {'fromHome': appRoute == AppRoute.home},
      );
    }
  }
}
