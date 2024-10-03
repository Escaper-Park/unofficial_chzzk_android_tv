import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../../src/utils/formatter/formatter.dart';
import '../../../../../../common/constants/dimensions.dart';
import '../../../../../../common/constants/styles.dart';
import '../../../../../../common/widgets/dpad_widgets.dart';
import '../../../../../../common/widgets/tag_badge.dart';
import '../../../../../../utils/popup/popup_utils.dart';
import '../../../../../channel/controller/channel_controller.dart';
import '../../../../../channel/model/channel.dart';
import '../../../../../vod/controller/vod_controller.dart';
import '../../../../../vod/model/vod.dart';
import '../../../../../vod/repository/vod_repository.dart';
import '../../../../../vod/widgets/vod_container/vod_thumbnail.dart';
import '../../../../common/controls_overlay_container.dart';
import '../../../controller/vod_overlay_controller.dart';
import '../../../controller/vod_player_controller.dart';
import '../../../controller/vod_playlist_controller.dart';

class VodStreamChannelVod extends ConsumerWidget {
  /// Current vod's steamer channel vod list.
  const VodStreamChannelVod({
    super.key,
    required this.channel,
    required this.vodListFSN,
    required this.followingButtonFSN,
    required this.videoFocusNode,
  });

  final Channel channel;
  final FocusScopeNode vodListFSN;
  final FocusScopeNode followingButtonFSN;
  final FocusNode videoFocusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncChannelVods = ref.watch(
      channelVodControllerProvider(
          channelId: channel.channelId, sortType: VodSortType.latest),
    );

    return DpadHorizontalListViewContainer<Vod>(
      containerHeight: Dimensions.vodStreamVodContainerHeight,
      containerWidth: Dimensions.vodstreamVodThumbnailWidth,
      aboveFSN: followingButtonFSN,
      useExceptionFallbackWidget: false,
      useFetchMore: true,
      horizontalPadding: 10.0,
      fetchMore: () async {
        await ref
            .read(channelVodControllerProvider(
                    channelId: channel.channelId, sortType: VodSortType.latest)
                .notifier)
            .fetchMore();
      },
      asyncValue: asyncChannelVods,
      emptyText: '채널에 동영상이 없습니다',
      errorText: '채널 동영상을 불러올 수 없습니다',
      listFSN: vodListFSN,
      itemBuilder: (index, focusNode, object) {
        return VodStreamChannelVodContainer(
          autofocus: index == 0 ? true : false,
          focusNode: focusNode,
          vod: object,
          videoFocusNode: videoFocusNode,
        );
      },
    );
  }
}

class VodStreamChannelVodContainer extends ConsumerWidget {
  /// Vod Container in the vod stream channel vod list.
  const VodStreamChannelVodContainer({
    super.key,
    required this.autofocus,
    required this.focusNode,
    required this.vod,
    required this.videoFocusNode,
  });

  final bool autofocus;
  final FocusNode focusNode;
  final Vod vod;
  final FocusNode videoFocusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // yyyy-MM-dd
    final String publishDate = vod.publishDate.split(' ')[0];
    final String paddedDuration =
        Duration(seconds: vod.duration).paddedDuration();

    return SizedBox(
      height: Dimensions.vodStreamVodContainerHeight,
      width: Dimensions.vodstreamVodThumbnailWidth,
      child: DpadActionWidget(
        autofocus: autofocus,
        focusNode: focusNode,
        useFocusedBorder: true,
        useKeyRepeatEvent: false,
        dpadActionCallbacks: {
          DpadAction.arrowRight: () {
            // Reset overlay timer
            ref.read(vodOverlayControllerProvider.notifier).changeOverlay(
                  overlayType: VodOverlayType.channelData,
                  videoFocusNode: videoFocusNode,
                );
          },
          DpadAction.arrowLeft: () {
            // Reset overlay timer
            ref.read(vodOverlayControllerProvider.notifier).changeOverlay(
                  overlayType: VodOverlayType.channelData,
                  videoFocusNode: videoFocusNode,
                );
          },
          DpadAction.select: () async {
            if (vod.channel.personalData?.privateUserBlock == true) {
              return;
            }

            final vodPath = await ref
                .read(vodControllerProvider.notifier)
                .getVodPlayback(videoNo: vod.videoNo);
            // Error
            if (vodPath == null) {
              if (context.mounted) {
                await PopupUtils.showButtonDialog(
                  context: context,
                  titleText: '재생 오류',
                  contentText: '다시보기 재생 오류',
                );
              }

              return;
            }
            //
            else {
              final bool checkIsSame = ref
                  .read(vodPlaylistControllerProvider.notifier)
                  .checkIsSameVod(videoNo: vod.videoNo);

              if (!checkIsSame) {
                ref.read(vodPlaylistControllerProvider.notifier).setVod(
                  vodPlay: (vod, vodPath),
                );
                ref.read(vodPlayerControllerProvider.notifier).changeSource();
              }

              return;
            }
          }
        },
        child: Stack(
          children: [
            // Thumbnail
            VodThumbnail(
              vod: vod,
              imageHeight: Dimensions.vodstreamVodThumbnailHeight,
              imageWidth: Dimensions.vodstreamVodThumbnailWidth,
            ),
            TagBadge(
              alignment: Alignment.topLeft,
              text: publishDate,
              fontSize: 10.0,
              backgroundColor: AppColors.blackColor.withOpacity(0.75),
              margin: const EdgeInsets.all(5.0),
            ),
            TagBadge(
              alignment: Alignment.topRight,
              text: paddedDuration,
              fontSize: 10.0,
              backgroundColor: AppColors.blackColor.withOpacity(0.75),
              margin: const EdgeInsets.all(5.0),
            ),
            ControlsOverlayContainer(
              height: 30.0,
              width: double.infinity,
              alignment: Alignment.bottomCenter,
              backgroundColor: AppColors.blackColor,
              borderRadius: 12.0,
              backgroundOpacity: 0.5,
              useTopBorder: false,
              useBottomBorder: true,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  vod.videoTitle,
                  style: const TextStyle(
                    fontSize: 11.0,
                    color: AppColors.whiteColor,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
