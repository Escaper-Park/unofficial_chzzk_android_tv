import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/constants/dimensions.dart';
import '../../../common/widgets/dpad_widgets.dart';
import '../../../utils/router/app_router.dart';
import '../controller/dashboard_controller.dart';
import './responsive_sidebar_menu.dart';
import './responsive_user_button.dart';

import '../../auth/controller/auth_controller.dart';

// typedef: SidebarItem to create menu items.
typedef SidebarItem = (IconData, String, AppRoute);

class ResponsiveSidebar extends HookConsumerWidget {
  /// A responsive sidebar with FocusScope.
  ///
  /// If sidebar's focusScopeNode has focus, this will be expanded.
  const ResponsiveSidebar({
    super.key,
    required this.sidebarFSN,
    required this.contentScreenFSN,
  });

  /// This sidebar's FocusScopeNode.
  final FocusScopeNode sidebarFSN;

  /// Content area's FocusScopeNode to navigate focus.
  final FocusScopeNode contentScreenFSN;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // To highlight and auto-focus current screen's menu item.
    final currentScreenIndex = ref.watch(dashboardControllerProvider);

    // Use state to change the [Sizedbox]'s width when the sidebar's focus state changes.
    final sidebarHasFocus = useState<bool>(sidebarFSN.hasFocus);

    // Menu items without login button(or user profile).
    final List<SidebarItem> sidebarMenuItemData = [
      (Icons.search_rounded, '검색', AppRoute.search),
      (Icons.home_rounded, '홈', AppRoute.home),
      (Icons.favorite_rounded, '팔로잉', AppRoute.following),
      (Icons.category_rounded, '카테고리', AppRoute.category),
      (Icons.settings_rounded, '설정', AppRoute.settings),
    ];

    // Add focusNodes to auto-focus current screen's menu item.
    //
    // This focusNodes' length have to be sidebarMenuItemData + 1,
    // because of the seperated login button.
    final focusNodes = List.generate(
      sidebarMenuItemData.length + 1,
      (index) => useFocusNode(),
    );

    // Create menu items.
    final List<ResponsiveSidebarMenu> menuItems =
        List.generate(sidebarMenuItemData.length, (index) {
      final item = sidebarMenuItemData[index];

      return ResponsiveSidebarMenu(
        sidebarHasFocus: sidebarHasFocus.value,
        focusNode: focusNodes[index],
        currentScreenIndex: currentScreenIndex,
        menuIndex: index,
        iconData: item.$1,
        menuText: item.$2,
        onPressed: () {
          ref
              .read(dashboardControllerProvider.notifier)
              .changeScreen(context, item.$3);
        },
      );
    });

    // Last menu item. Login or user profile button.
    final ResponsiveUserButton userButton = ResponsiveUserButton(
      sidebarHasFocus: sidebarHasFocus.value,
      focusNode: focusNodes[sidebarMenuItemData.length],
      currentScreenIndex: currentScreenIndex,
      menuIndex: sidebarMenuItemData
          .length, // 0: search ~ user: sidebarMenuItem.length.
      onPressedSignInButton: () {
        ref
            .read(dashboardControllerProvider.notifier)
            .changeScreen(context, AppRoute.auth);
      },
      onPressedUserProfile: () {
        ref.read(authControllerProvider.notifier).signOut();
        // ref
        //     .read(dashboardControllerProvider.notifier)
        //     .changeScreen(context, AppRoute.user);
      },
    );

    // Sidebar item's focus nodes to auto-focus current screen's menu item.
    return DpadFocusScopeNavigator(
      node: sidebarFSN,
      onFocusChange: (hasFocus) {
        sidebarHasFocus.value = hasFocus;
        if (hasFocus) {
          focusNodes[currentScreenIndex].requestFocus();
        }
      },
      dpadKeyFocusScopeNodeMap: {
        DpadAction.arrowRight: contentScreenFSN,
      },
      child: SizedBox(
        // Responsive width
        width: sidebarHasFocus.value
            ? Dimensions.expandedSidebarWidth
            : Dimensions.collapsedSidebarWidth,
        child: Column(
          // use spaceBetween to seperate the menu items and the user(or login) button.
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Menu Itmes
            Column(children: menuItems),
            // User profile or login button
            userButton,
          ],
        ),
      ),
    );
  }
}
