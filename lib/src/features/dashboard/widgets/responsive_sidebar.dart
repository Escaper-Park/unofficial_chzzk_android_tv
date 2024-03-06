import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/constants/dimensions.dart';
import '../../../utils/router/app_router.dart';
import '../controller/dashboard_controller.dart';
import './responsive_chzzk_logo.dart';
import './responsive_login_button.dart';
import './sidebar_item.dart';
import 'user_profile.dart';

class ResponsiveSidebar extends HookConsumerWidget {
  /// A responsive sidebar.
  ///
  /// The width of this widget varies depending on the focus state.
  const ResponsiveSidebar(
    this.parentFocusNode, {
    super.key,
  });

  final FocusNode parentFocusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final parentHasFocus = useState<bool>(parentFocusNode.hasFocus);
    final currentScreenIndex = ref.watch(dashboardControllerProvider);

    final List<(IconData, String, AppRoute)> itemData = [
      (Icons.search_rounded, '검색', AppRoute.search),
      (Icons.home_rounded, '홈', AppRoute.home),
      (Icons.favorite_rounded, '팔로잉', AppRoute.following),
      (Icons.category_rounded, '카테고리', AppRoute.category),
      (Icons.window_rounded, '멀티뷰', AppRoute.multiView),
      (Icons.settings_rounded, '설정', AppRoute.settings),
    ];

    final focusNodes = List.generate(
      itemData.length + 1, // +1 : login button's fucusNode.
      (index) => useFocusNode(),
    );

    final List<SidebarItem> items = List.generate(
      itemData.length,
      (index) {
        return SidebarItem(
          parentHasFocus: parentHasFocus.value,
          focusNode: focusNodes[index],
          currentIndex: currentScreenIndex,
          screenIndex: index,
          iconData: itemData[index].$1,
          text: itemData[index].$2,
          onPressed: () {
            ref
                .read(dashboardControllerProvider.notifier)
                .changeScreen(context, itemData[index].$3);
          },
        );
      },
    );

    return Focus(
      focusNode: parentFocusNode,
      skipTraversal: true, // Set this true to use [FocusNode] of children.
      autofocus: false,
      onFocusChange: (value) {
        parentHasFocus.value = parentFocusNode.hasFocus;
        // Request focus to a menu item according to the currnet screen's index.
        if (parentHasFocus.value) focusNodes[currentScreenIndex].requestFocus();
      },
      child: SizedBox(
        width: parentHasFocus.value
            ? Dimensions.sidebarWidth
            : Dimensions.logoIconWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Logo
                ResponsiveChzzkLogo(parentHasFocus: parentHasFocus.value),
                const SizedBox(height: 5.0),
                // Profile
                UserProfile(parentHasFocus: parentHasFocus.value),
                // Menu items
                ...items.sublist(0, itemData.length)
              ],
            ),
            // Login button
            ResponsiveLoginButton(
              parentHasFocus: parentHasFocus.value,
              focusNode: focusNodes.last,
              currentIndex: currentScreenIndex,
              screenIndex: focusNodes.length - 1,
            ),
          ],
        ),
      ),
    );
  }
}
