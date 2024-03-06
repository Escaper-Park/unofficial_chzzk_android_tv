import 'package:flutter/material.dart';

import '../../common/constants/dimensions.dart';
import '../dashboard/dashboard_screen.dart';
import 'widgets/following_channel_data.dart';
import 'widgets/following_list.dart';

class FollowingScreen extends StatelessWidget {
  const FollowingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DashboardScreen(
      screen: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: Dimensions.followingListWidth,
              child: FollowingList(),
            ),
            Expanded(
              child: FollowingChannelData(),
            ),
          ],
        ),
      ),
    );
  }
}
