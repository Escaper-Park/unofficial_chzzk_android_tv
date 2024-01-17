import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../screens.dart';
import '../home.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const DashboardScreen(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MenuHeaderText(text: '팔로우 라이브 채널'),
            SizedBox(height: 12.0),
            HomeFollowingLiveChannels(),
            SizedBox(height: 12.0),
            MenuHeaderText(text: '인기 채널'),
            SizedBox(height: 12.0),
            HomePopularLiveChannels(),
            SizedBox(height: 12.0),
            MenuHeaderText(text: '추천 채널'),
            SizedBox(height: 12.0),
            RecommendationChannels(),
          ],
        ),
      ),
    );
  }
}
