import 'package:flutter/material.dart';

import '../dashboard/dashboard_screen.dart';
import './widgets/popular_lives.dart';
import './widgets/home_following_live_channels.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardScreen(
      currentScreenIndex: 0,
      screen: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0,
        ),
        child: ListView(
          children: const [
            HomeFollowingLives(),
            PopularLives(),
          ],
        ),
      ),
    );
  }
}
