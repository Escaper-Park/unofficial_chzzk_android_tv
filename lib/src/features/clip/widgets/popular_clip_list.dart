import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/constants/api.dart';
import '../../../common/widgets/center_widgets.dart';
import '../../../utils/image/image_utils.dart';
import '../../../utils/popup/popup_utils.dart';
import '../../../utils/router/app_router.dart';
import '../controller/clip_controller.dart';
import './popular_clip_container.dart';

class PopularClipList extends HookConsumerWidget {
  const PopularClipList({
    super.key,
    required this.horizontalPadding,
    required this.verticalPadding,
  });

  /// For calculate dynamic size of category container.
  final double horizontalPadding;

  /// Damping for infinite scrolls.
  final double verticalPadding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final asyncPopularClips = ref.watch(popularClipControllerProvider);

    useEffect(() {
      scrollController.addListener(() async {
        // damping: -verticalPadding
        if (scrollController.offset >=
                scrollController.position.maxScrollExtent - verticalPadding &&
            !scrollController.position.outOfRange) {
          await ref.read(popularClipControllerProvider.notifier).fetchMore();
        }
      });
      return null;
    }, [scrollController]);

    const int crossAxisCount = 5;
    const double crossAxisSpacing = 10.0;

    // Calculate image size
    final imageWidth = ImageUtils.imageWidthByCrossAxisCount(
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: crossAxisSpacing,
      context: context,
    );

    final imageHeight = ImageUtils.imageHeightByRatio(
      w: 3,
      h: 4,
      imageWidth: imageWidth,
    );

    return switch (asyncPopularClips) {
      AsyncData(:final value) => value == null
          ? const CenteredText(text: '인기 클립을 불러올 수 없습니다')
          : GridView.builder(
              controller: scrollController,
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: crossAxisSpacing,
                mainAxisSpacing: 10.0,
                mainAxisExtent: imageHeight,
              ),
              itemCount: value.length,
              itemBuilder: (BuildContext context, int index) {
                final clip = value[index];

                return PopularClipContainer(
                  autofocus: index == 0 ? true : false,
                  imageWidth: imageWidth,
                  imageHeight: imageHeight,
                  clip: clip,
                  onPressed: () async {
                    // non-auth Adult
                    if (clip.videoId == null ||
                        clip.thumbnailImageUrl == null) {
                      if (context.mounted) {
                        await PopupUtils.showButtonDialog(
                          context: context,
                          titleText: '제한된 클립',
                          contentText: '재생할 수 없는 영상입니다',
                        );
                      }
                    }
                    // Play clip
                    else {
                      context.pushNamed(
                        AppRoute.clip.routeName,
                        extra: {
                          'url':
                              '${ApiUrl.naverClipEmbed}/${clip.clipUID}?autoplay=1'
                        },
                      );
                    }
                  },
                );
              },
            ),
      AsyncError() => const CenteredText(text: '인기 클립을 불러올 수 없습니다'),
      _ => const SizedBox.shrink(),
    };
  }
}
