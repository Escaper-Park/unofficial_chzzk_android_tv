import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../controller/dashboard/dashboard_controller.dart';
import './chzzk_logo.dart';
import './sidebar_menu.dart';
import './login_button.dart';
import './user_profile.dart';

class ResponsiveSidebar extends HookConsumerWidget {
  /// The width of this widget varies depending on the 'Focus' state.
  const ResponsiveSidebar({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusNode = useFocusNode();
    final focusState = useState<bool>(focusNode.hasFocus);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Focus(
        focusNode: focusNode,
        onFocusChange: (value) {
          focusState.value = value;
        },
        skipTraversal: true, // Set this true to use [FocusNode] of children.
        child: SizedBox(
          width: focusNode.hasFocus ? 200.0 : 76.25,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  // Logo
                  ChzzkLogo(parentHasFocus: focusState.value),
                  const SizedBox(height: 12.0),
                  UserProfile(parentHasFocus: focusState.value),
                  // Divider
                  const Divider(thickness: 2.0),
                  // Menu
                  SidebarMenu(
                    iconData: Icons.home,
                    menuTitle: '홈',
                    parentHasFocus: focusState.value,
                    currentIndex: currentIndex,
                    screenIndex: 0,
                    onPressed: () {
                      ref
                          .read(dashboardControllerProvider.notifier)
                          .changeScreen(
                            context,
                            0,
                          );
                    },
                  ),
                  SidebarMenu(
                    iconData: Icons.favorite,
                    menuTitle: '팔로우',
                    parentHasFocus: focusState.value,
                    currentIndex: currentIndex,
                    screenIndex: 1,
                    onPressed: () {
                      ref
                          .read(dashboardControllerProvider.notifier)
                          .changeScreen(
                            context,
                            1,
                          );
                    },
                  ),
                  SidebarMenu(
                    iconData: Icons.search,
                    menuTitle: '탐색',
                    parentHasFocus: focusState.value,
                    currentIndex: currentIndex,
                    screenIndex: 2,
                    onPressed: () {
                      ref
                          .read(dashboardControllerProvider.notifier)
                          .changeScreen(
                            context,
                            2,
                          );
                    },
                  ),
                  SidebarMenu(
                    iconData: Icons.window_rounded,
                    menuTitle: '멀티뷰',
                    parentHasFocus: focusState.value,
                    currentIndex: currentIndex,
                    screenIndex: 3,
                    onPressed: () {
                      ref
                          .read(dashboardControllerProvider.notifier)
                          .changeScreen(
                            context,
                            3,
                          );
                    },
                  ),
                  SidebarMenu(
                    iconData: Icons.settings,
                    menuTitle: '설정',
                    parentHasFocus: focusState.value,
                    currentIndex: currentIndex,
                    screenIndex: 4,
                    onPressed: () {
                      ref
                          .read(dashboardControllerProvider.notifier)
                          .changeScreen(
                            context,
                            4,
                          );
                    },
                  ),
                ],
              ),

              // Login Button
              LoginButton(
                parentHasFocus: focusState.value,
                currentIndex: currentIndex,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
