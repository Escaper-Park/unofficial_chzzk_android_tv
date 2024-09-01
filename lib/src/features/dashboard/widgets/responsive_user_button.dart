import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/widgets/center_widgets.dart';
import '../../../common/widgets/circle_avatar_profile_image.dart';
import '../../user/controller/user_controller.dart';
import '../../user/model/user.dart';
import './responsive_sidebar_item_container.dart';
import './responsive_sidebar_menu.dart';

class ResponsiveUserButton extends ConsumerWidget {
  /// If you are logged in, it shows the icon and user name,
  /// and if you are not logged in, it shows the login button.
  const ResponsiveUserButton({
    super.key,
    required this.sidebarHasFocus,
    required this.focusNode,
    required this.currentScreenIndex,
    required this.menuIndex,
    required this.onPressedSignInButton,
    required this.onPressedUserProfile,
  });

  /// Sidebar's focus state.
  final bool sidebarHasFocus;

  /// This item's focusNode.
  final FocusNode focusNode;

  /// Current content area's index to notice you what screen is currently activate.
  final int currentScreenIndex;

  /// This menu's index is used to highlight the sidebar item when this menu's screen is activated.
  final int menuIndex;

  /// Go to sign in page.
  final VoidCallback onPressedSignInButton;

  /// Go to user profile page.
  final VoidCallback onPressedUserProfile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUser = ref.watch(userControllerProvider);

    return switch (asyncUser) {
      AsyncData(:final value) =>
        value == null ? _signInButton() : _userProfile(value),
      AsyncError() => _signInButton(), // Fallback
      _ => const SizedBox.shrink(),
    };
  }

  Widget _signInButton() {
    return ResponsiveSidebarMenu(
      sidebarHasFocus: sidebarHasFocus,
      focusNode: focusNode,
      currentScreenIndex: currentScreenIndex,
      menuIndex: menuIndex,
      iconData: Icons.login_rounded,
      menuText: '로그인',
      onPressed: onPressedSignInButton,
    );
  }

  Widget _userProfile(User user) {
    return ResponsiveSidebarItemContainer(
      focusNode: focusNode,
      sidebarHasFocus: sidebarHasFocus,
      onPressed: onPressedUserProfile,
      // user profile image
      collapsedWidget: Align(
        alignment: Alignment.centerLeft,
        child: CircleAvatarProfileImage(
          profileImageUrl: user.profileImageUrl,
          radius: 15.0,
        ),
      ),
      // nickname
      expandedWidget: CenteredText(text: user.nickname ?? 'error'),
    );
  }
}
