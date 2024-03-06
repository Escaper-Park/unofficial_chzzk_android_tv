import 'package:flutter/material.dart';

import '../dashboard/dashboard_screen.dart';
import './widgets/home_following_lives.dart';
import './widgets/home_popular_lives.dart';
import 'widgets/home_favorite_categories.dart';
import './widgets/home_refresh_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardScreen(
      screen: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: const [
            HomeRefreshButton(),
            // Following live channels
            HomeFollowingLives(),
            // Popular live channels
            HomePopularLives(),
            // Categories
            HomeFavoriteCategories(),
          ],
        ),
      ),
    );
  }
}
