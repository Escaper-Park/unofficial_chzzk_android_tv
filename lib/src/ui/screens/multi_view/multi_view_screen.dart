import 'package:flutter/material.dart';

import '../dashboard/dashboard_screen.dart';
import './widgets/multi_view_selection_list.dart';
import './widgets/multi_view_selected_channels.dart';

class MultiViewScreen extends StatelessWidget {
  const MultiViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DashboardScreen(
      currentScreenIndex: 3,
      screen: Row(
        children: [
          Expanded(
            flex: 2,
            child: MultiViewSelectionList(),
          ),
          Expanded(
            flex: 1,
            child: MultiViewSelectedChannels(),
          )
        ],
      ),
    );
  }
}
