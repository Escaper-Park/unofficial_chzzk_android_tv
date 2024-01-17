import 'package:flutter/material.dart';

import './login_button.dart';
import './title_menu.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppBar({super.key, required this.isLoggedIn});

  final bool isLoggedIn;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 5.0,
        ),
        child: Image.asset('assets/images/logo.png'),
      ),
      leadingWidth: 100.0,
      centerTitle: true,
      title: const TitleMenu(),
      actions: [
        LoginButton(isLoggedIn),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
