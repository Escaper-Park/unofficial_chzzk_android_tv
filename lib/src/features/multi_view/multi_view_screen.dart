import 'package:flutter/material.dart';

import '../../common/widgets/header_text.dart';
import '../dashboard/dashboard_screen.dart';
import 'widgets/multi_view_channel_list.dart';
import 'widgets/multi_view_selected_channels.dart';

class MultiViewScreen extends StatelessWidget {
  const MultiViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DashboardScreen(
      screen: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderText(text: '팔로우 라이브 목록'),
                  MultiViewChannelList(),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: MultiViewSelectedChannels(),
            ),
          ],
        ),
      ),
    );
  }
}
