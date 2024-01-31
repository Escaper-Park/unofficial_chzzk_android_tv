import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../constants/styles.dart';
import '../../../../controller/auth/auth_controller.dart';
import '../../../../controller/dashboard/dashboard_controller.dart';
import '../../../../utils/popup/popup_utils.dart';

import './sidebar_menu.dart';

class LoginButton extends ConsumerWidget {
  const LoginButton({
    super.key,
    required this.parentHasFocus,
    required this.currentIndex,
  });

  final bool parentHasFocus;
  final int currentIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncAuthProvider = ref.watch(authControllerProvider);

    return asyncAuthProvider.when(
      data: (auth) {
        return SidebarMenu(
          iconData: auth == null ? Icons.login : Icons.logout,
          menuTitle: auth == null ? '로그인' : '로그아웃',
          parentHasFocus: parentHasFocus,
          currentIndex: currentIndex,
          screenIndex: 5,
          onPressed: auth == null
              ? () {
                  ref.read(dashboardControllerProvider.notifier).changeScreen(
                        context,
                        5,
                      );
                }
              : () async {
                  if (context.mounted) {
                    await PopupUtils.showDoubleButtonDialog(
                      context: context,
                      contentHeight: 50.0,
                      titleText: '로그아웃',
                      content: const Text(
                        '로그아웃 하시겠습니까?',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: AppColors.greyColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      confirmText: '로그아웃',
                      callback: () async {
                        await ref
                            .read(authControllerProvider.notifier)
                            .logOut();
                      },
                    );
                  }
                },
        );
      },
      error: (error, stackTrace) => SidebarMenu(
        iconData: Icons.logout,
        menuTitle: '로그아웃',
        parentHasFocus: parentHasFocus,
        currentIndex: currentIndex,
        screenIndex: 5,
        onPressed: () async {
          await ref.read(authControllerProvider.notifier).logOut();
        },
      ),
      loading: () => const SizedBox.shrink(),
    );
  }
}
