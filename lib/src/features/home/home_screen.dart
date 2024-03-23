import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/widgets/center_text.dart';
import '../../common/widgets/header_text.dart';
import '../auth/controller/auth_controller.dart';
import '../dashboard/dashboard_screen.dart';
import './widgets/home_following_lives.dart';
import './widgets/home_popular_lives.dart';
import './widgets/home_favorite_categories.dart';
import 'widgets/home_function_buttons.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncAuth = ref.watch(authControllerProvider);

    return DashboardScreen(
      screen: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: switch (asyncAuth) {
          AsyncData(:final value) => ListView(
              children: [
                const HomeFunctionButtons(),
                // Following live channels
                if (value != null) const HeaderText(text: '팔로잉 라이브 채널'),
                if (value != null) const HomeFollowingLives(),
                // Popular live channels
                const HeaderText(text: '인기 라이브 채널'),
                const HomePopularLives(),
                // Categories
                const HeaderText(text: '즐겨찾는 카테고리'),
                const HomeFavoriteCategories(),
              ],
            ),
          AsyncError() => const CenterText(text: '로그인 에러'),
          _ => const SizedBox.shrink(),
        },
      ),
    );
  }
}
