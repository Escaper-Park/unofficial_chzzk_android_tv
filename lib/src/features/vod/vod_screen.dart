import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/constants/dimensions.dart';
import '../../common/widgets/base_scaffold.dart';
import '../../common/widgets/center_text.dart';
import '../../common/widgets/header_text.dart';
import './controller/vod_controller.dart';
import './widgets/vod_list.dart';
import './widgets/vod_sidebar_page_buttons.dart';
import 'widgets/vod_sort_buttons.dart';

class VodScreen extends HookConsumerWidget {
  const VodScreen({
    super.key,
    required this.channelId,
    required this.channelName,
  });

  final String channelId;
  final String channelName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const double horizontalPadding = 16.0;
    const double crossAxisSpacing = 5.0;
    const int crossAxisCount = 3;

    final double sidebarWidth = MediaQuery.of(context).size.width -
        horizontalPadding * 2 -
        crossAxisSpacing * 2 * (crossAxisCount - 1) -
        Dimensions.liveThumbnailSize.width * crossAxisCount;

    final sidebarFocusNode = useFocusNode();

    final asyncTotalPages =
        ref.watch(channelVodTotalPagesProvider(channelId: channelId));

    return switch (asyncTotalPages) {
      AsyncData(:final value) => (value == null || value == 0)
          ? BaseScaffold(body: CenterText(text: '$channelName 채널에 동영상이 없습니다'))
          : PopScope(
              canPop: false,
              onPopInvoked: (_) {
                if (sidebarFocusNode.hasFocus) {
                  context.pop();
                }
                sidebarFocusNode.requestFocus();
              },
              child: BaseScaffold(
                horizontalPadding: horizontalPadding,
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HeaderText(
                          text: '$channelName 채널의 동영상',
                          fontSize: 24.0,
                        ),
                        const VodSortButtons(),
                      ],
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: sidebarWidth,
                            child: VodSidebarPageButtons(
                              channelId: channelId,
                              totalPages: value,
                              sidebarFocusNode: sidebarFocusNode,
                            ),
                          ),
                          Expanded(
                            child: VodList(
                              channelId: channelId,
                              crossAxisCount: crossAxisCount,
                              crossAxisSpacing: crossAxisSpacing,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
      AsyncError() =>
        BaseScaffold(body: CenterText(text: '$channelName 채널 동영상을 불러올 수 없습니다')),
      _ => const BaseScaffold(
          body: SizedBox.shrink(),
        ),
    };
  }
}
