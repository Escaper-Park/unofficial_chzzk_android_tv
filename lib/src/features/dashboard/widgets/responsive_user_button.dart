import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/widgets/ui/ui_widgets.dart'
    show CenteredText, CircleAvatarProfileImage;
import 'dashboard_widgets.dart'
    show ResponsiveSidebarMenuItem, ResponsiveSidebarTile;

import '../dashboard_state.dart';
import '../../user/model/user.dart';

class ResponsiveUserButton extends ConsumerWidget with DashboardState {
  /// If you are logged in, it displays the user profile image and the user name.
  ///
  /// otherwise, it displays the login button.
  const ResponsiveUserButton({
    super.key,
    required this.sidebarHasFocus,
    required this.onPressedSignInButton,
    required this.onPressedUserProfile,
  });

  final bool sidebarHasFocus;

  /// Go to the sign in screen.
  final VoidCallback onPressedSignInButton;

  /// Ask sign out.
  final VoidCallback onPressedUserProfile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUser = getUserState(ref);

    return switch (asyncUser) {
      AsyncData(:final value) => value == null
          ? _signInButton()
          : _UserProfile(
              user: value,
              sidebarHasFocus: sidebarHasFocus,
              onPressedUserProfile: onPressedUserProfile,
            ),
      AsyncError() => _signInButton(),
      _ => const SizedBox.shrink(),
    };
  }

  Widget _signInButton() {
    return _SignInButton(
      sidebarHasFocus: sidebarHasFocus,
      onPressedSignInButton: onPressedSignInButton,
    );
  }
}

class _SignInButton extends StatelessWidget {
  const _SignInButton({
    required this.sidebarHasFocus,
    required this.onPressedSignInButton,
  });

  final bool sidebarHasFocus;
  final VoidCallback onPressedSignInButton;

  @override
  Widget build(BuildContext context) {
    return ResponsiveSidebarMenuItem(
      sidebarHasFocus: sidebarHasFocus,
      isCurrentScreen: false,
      iconData: Icons.login_rounded,
      menuText: '로그인',
      onPressed: onPressedSignInButton,
    );
  }
}

class _UserProfile extends StatelessWidget {
  const _UserProfile({
    required this.user,
    required this.sidebarHasFocus,
    required this.onPressedUserProfile,
  });

  final User? user;
  final bool sidebarHasFocus;
  final VoidCallback onPressedUserProfile;

  @override
  Widget build(BuildContext context) {
    final nickname = user == null ? '에러' : user!.nickname;

    return ResponsiveSidebarTile(
      autofocus: false,
      sidebarHasFocus: sidebarHasFocus,
      collapsedWidget: Align(
        alignment: Alignment.centerLeft,
        child: CircleAvatarProfileImage(
          radius: 15.0,
          profileImageUrl: user?.profileImageUrl,
        ),
      ),
      expandedWidget: CenteredText(text: nickname),
      onPressed: onPressedUserProfile,
    );
  }
}
