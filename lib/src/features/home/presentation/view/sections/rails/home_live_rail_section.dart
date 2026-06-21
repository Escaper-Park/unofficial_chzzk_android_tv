import 'package:flutter/widgets.dart';

import '../../../../../../core/ui/ui.dart';
import '../../../../../live/domain/entities/live_feed.dart';
import '../../../../../live/presentation/view/shared/live_card.dart';
import '../../../../../live/presentation/view/shared/live_preview_settings.dart';
import '../../../bloc/home_bloc.dart';
import '../../../home_screen_design.dart';
import '../../../home_screen_ui_mapper.dart';
import '../../shared/home_rail_more_card.dart';
import '../shared/home_section_header.dart';
import '../shared/home_section_state_view.dart';

class HomeLiveRailSection extends StatelessWidget {
  const HomeLiveRailSection({
    super.key,
    required this.sectionId,
    required this.node,
    required this.data,
    required this.onRetry,
    required this.onItemPressed,
    required this.onMorePressed,
    this.previewSettings,
    this.up,
    this.down,
    this.autofocus = false,
  });

  final HomeSectionId sectionId;
  final FocusScopeNode node;
  final FocusScopeNode? up;
  final FocusScopeNode? down;
  final HomeSectionData<Live> data;
  final VoidCallback onRetry;
  final ValueChanged<Live> onItemPressed;
  final VoidCallback onMorePressed;
  final LivePreviewSettings? previewSettings;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    if (data.status != HomeSectionLoadStatus.ready || data.items.isEmpty) {
      return HomeSectionStateView(
        sectionId: sectionId,
        status: data.status,
        node: node,
        up: up,
        down: down,
        height: HomeScreenDesign.mediaRailHeight,
        autofocus: autofocus,
        onRetry: onRetry,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeSectionHeader(title: homeSectionTitle(sectionId)),
        const SizedBox(height: HomeScreenDesign.sectionTitleBottomGap),
        SizedBox(
          height: HomeScreenDesign.mediaRailHeight,
          child: TvRail(
            node: node,
            up: up,
            down: down,
            upFocusAlignment: HomeScreenDesign.verticalScrollAlignment,
            downFocusAlignment: HomeScreenDesign.verticalScrollAlignment,
            itemCount: data.items.length + 1,
            itemExtent: HomeScreenDesign.mediaRailItemExtent,
            itemBuilder: (context, index) {
              if (index == data.items.length) {
                return HomeRailMoreCard.media(
                  focusedElevation: HomeScreenDesign.focusedCardElevation,
                  focusedShadowColor: HomeScreenDesign.focusedCardShadowColor,
                  onPressed: onMorePressed,
                );
              }

              final item = data.items[index];
              return LiveCard(
                item: item,
                autofocus: autofocus && index == 0,
                focusedElevation: HomeScreenDesign.focusedCardElevation,
                focusedShadowColor: HomeScreenDesign.focusedCardShadowColor,
                previewSettings: previewSettings,
                onPressed: () {
                  onItemPressed(item);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
