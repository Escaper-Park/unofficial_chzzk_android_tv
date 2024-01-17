import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/popup/popup_utils.dart';
import '../../../utils/router/app_router.dart';
import '../../client/repository/client_repository.dart';
import 'user_profile.dart';

class LoginButton extends ConsumerWidget {
  const LoginButton(this.isLoggedIn, {super.key});

  final bool isLoggedIn;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed: () async {
          if (isLoggedIn) {
            await PopupUtils.showDoubleButtonDialog(
              context: context,
              contentHeight: 30.0,
              titleText: '로그아웃',
              content: const Text(
                '로그아웃 하시겠습니까?',
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ),
              callback: () async {
                await ref.read(clientRepositoryProvider.notifier).logOut();
              },
            );
          } else {
            context.push(AppRoute.auth.routePath);
          }
        },
        child: isLoggedIn ? const UserProfile() : const Text('로그인'),
      ),
    );
  }
}
