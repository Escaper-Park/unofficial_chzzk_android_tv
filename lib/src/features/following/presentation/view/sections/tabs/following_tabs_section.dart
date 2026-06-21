import 'package:flutter/material.dart';

import '../../../../../../core/ui/ui.dart';
import '../../../bloc/following_bloc.dart';
import '../../../following_screen_string.dart';

class FollowingTabsSection extends StatelessWidget {
  const FollowingTabsSection({
    super.key,
    required this.selectedTab,
    required this.onTabSelected,
  });

  final FollowingTab selectedTab;
  final ValueChanged<FollowingTab> onTabSelected;

  @override
  Widget build(BuildContext context) {
    return TvTabRow(
      tabs: [
        for (final tab in FollowingTab.values)
          TvTab(
            label: FollowingScreenString.tabLabel(tab),
            variant: TvTabVariant.secondary,
            selected: selectedTab == tab,
            onPressed: () => onTabSelected(tab),
          ),
      ],
    );
  }
}

class FollowingSortAction extends StatelessWidget {
  const FollowingSortAction({
    super.key,
    required this.option,
    required this.onPressed,
  });

  final FollowingLiveSortOption option;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TvTabActionButton(
      text: FollowingScreenString.liveSortLabel(option),
      icon: Icons.sort_rounded,
      onPressed: onPressed,
    );
  }
}
