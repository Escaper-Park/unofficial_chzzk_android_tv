import 'package:flutter/widgets.dart';

import '../../../../../../core/ui/ui.dart';
import '../../../../../category/domain/entities/category_item.dart';
import '../../../bloc/home_bloc.dart';
import '../../../home_screen_design.dart';
import '../../../home_screen_ui_mapper.dart';
import '../../shared/home_category_card.dart';
import '../../shared/home_rail_more_card.dart';
import '../shared/home_section_header.dart';
import '../shared/home_section_state_view.dart';

class HomeCategoryRailSection extends StatelessWidget {
  const HomeCategoryRailSection({
    super.key,
    required this.sectionId,
    required this.node,
    required this.data,
    required this.onRetry,
    required this.onItemPressed,
    required this.onMorePressed,
    this.up,
    this.down,
    this.autofocus = false,
  });

  final HomeSectionId sectionId;
  final FocusScopeNode node;
  final FocusScopeNode? up;
  final FocusScopeNode? down;
  final HomeSectionData<CategoryItem> data;
  final VoidCallback onRetry;
  final ValueChanged<CategoryItem> onItemPressed;
  final VoidCallback onMorePressed;
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
        height: HomeScreenDesign.categoryRailHeight,
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
          height: HomeScreenDesign.categoryRailHeight,
          child: TvRail(
            node: node,
            up: up,
            down: down,
            upFocusAlignment: HomeScreenDesign.verticalScrollAlignment,
            downFocusAlignment: HomeScreenDesign.verticalScrollAlignment,
            itemCount: data.items.length + 1,
            itemExtent: HomeScreenDesign.categoryRailItemExtent,
            itemBuilder: (context, index) {
              if (index == data.items.length) {
                return HomeRailMoreCard.category(
                  onPressed: onMorePressed,
                );
              }

              final item = data.items[index];
              return HomeCategoryCard(
                item: item,
                autofocus: autofocus && index == 0,
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
