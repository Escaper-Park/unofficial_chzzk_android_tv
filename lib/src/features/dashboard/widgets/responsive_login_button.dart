import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/constants/styles.dart';
import '../../../utils/popup/popup_utils.dart';
import '../../../utils/router/app_router.dart';
import '../../auth/controller/auth_controller.dart';
import '../controller/dashboard_controller.dart';
import 'sidebar_item.dart';

class ResponsiveLoginButton extends ConsumerWidget {
  const ResponsiveLoginButton({
    super.key,
    required this.parentHasFocus,
    required this.focusNode,
    required this.currentIndex,
    required this.screenIndex,
  });

  final bool parentHasFocus;
  final FocusNode focusNode;
  final int currentIndex;
  final int screenIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncAuth = ref.watch(authControllerProvider);

    return switch (asyncAuth) {
      AsyncData(:final value) => SidebarItem(
          parentHasFocus: parentHasFocus,
          focusNode: focusNode,
          currentIndex: currentIndex,
          screenIndex: screenIndex,
          iconData: value == null ? Icons.login_rounded : Icons.logout_rounded,
          text: value == null ? '로그인' : '로그아웃',
          onPressed: value == null
              ? () {
                  ref
                      .read(dashboardControllerProvider.notifier)
                      .changeScreen(context, AppRoute.id);
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
        ),
      AsyncError() => const Center(
          child: Text('에러'),
        ),
      _ => const SizedBox.shrink(),
    };
  }
}
