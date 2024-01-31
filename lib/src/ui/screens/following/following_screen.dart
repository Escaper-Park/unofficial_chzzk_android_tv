import 'package:flutter/material.dart';

import '../../../constants/dimensions.dart';

import '../../common/header_text.dart';
import '../dashboard/dashboard_screen.dart';
import './widgets/following_list.dart';
import './widgets/following_channel_data.dart';

class FollowingScreen extends StatelessWidget {
  const FollowingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DashboardScreen(
      currentScreenIndex: 1,
      screen: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 12.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: Dimensions.followingInfoCardWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: HeaderText(
                      text: '팔로우 채널',
                      fontSize: 20.0,
                    ),
                  ),
                  Expanded(
                    child: FollowingList(),
                  ),
                ],
              ),
            ),
            VerticalDivider(
              thickness: 1.0,
              width: 0.0,
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
