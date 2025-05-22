import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/constants/enums.dart' show AppRoute;
import '../../../utils/extensions/custom_extensions.dart';

import '../../../common/constants/dimensions.dart';
import '../../../common/constants/styles.dart' show AppColors;
import '../../../common/widgets/ui/rich_icon_text.dart';
import '../../../common/widgets/ui/ui_widgets.dart'
    show FocusedOutlinedButton, Thumbnail;
import '../../../utils/popup/popup_utils.dart';
import '../controller/clip_controller.dart';
import '../model/clip.dart';

part 'clip/clip_container_body.dart';
part 'clip/clip_thumbnail.dart';
part 'clip/clip_info.dart';

class ClipContainer extends HookConsumerWidget {
  const ClipContainer({
    super.key,
    required this.appRoute,
    required this.autofocus,
    required this.focusNode,
    this.thumbnailWidth = Dimensions.clipContainerWidth,
    this.thumbnailHeight = Dimensions.clipContainerHeight,
    required this.clip,
    required this.channelName,
  });

  final AppRoute appRoute;
  final bool autofocus;
  final FocusNode focusNode;
  final double thumbnailWidth; // 9
  final double thumbnailHeight; // 16
  final NaverClip clip;
  final String channelName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoadingState = useState<bool>(false);

    return FocusedOutlinedButton(
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
      child: _ClipContainerBody(
        clipThumbnail: _ClipThumbnail(
          clip: clip,
          thumbnailWidth: thumbnailWidth,
          thumbnailHeight: thumbnailHeight,
        ),
        clipInfo: _ClipInfo(
          clip: clip,
          clipContainerWidth: thumbnailWidth,
          channelName: channelName,
        ),
      ),
    );
  }

  Future<void> _tryPlay(WidgetRef ref, BuildContext context) async {
    // blocked
    if (clip.privateUserBlock == true) return;

    const String bannedTitle = '시청 제한 안내';
    if (clip.adult == true && clip.thumbnailImageUrl == null) {
      const String adultBannedText1 = '사용자 보호를 위해 연령 제한이 설정된 라이브입니다.';
      const String adultBannedText2 = '시청을 원하면 로그인 후 본인 인증을 완료해주세요.';

      if (context.mounted) {
        await PopupUtils.showButtonDialog(
          context: context,
          titleText: bannedTitle,
          contentText: '$adultBannedText1\n$adultBannedText2',
        );
      }

      return;
    }

    if (clip.blindType == 'ABROAD') {
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
    
    final String clipEmbedUrl =
        ref.read(clipControllerProvider.notifier).getPlayUrl(clip: clip);

    if (context.mounted) {
      context.pushTo(
        context: context,
        currentLocation: appRoute,
        appRoute: AppRoute.clipPlayer,
        extra: {'clipEmbedUrl': clipEmbedUrl},
      );
    }
  }
}
