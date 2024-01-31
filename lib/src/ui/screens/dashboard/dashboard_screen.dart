import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/custom_scaffold.dart';

import './widgets/responsive_sidebar.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({
    super.key,
    required this.screen,
    required this.currentScreenIndex,
  });

  final int currentScreenIndex;
  final Widget screen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScaffold(
      useTextField: true,
      body: Row(
        children: [
          ResponsiveSidebar(
            currentIndex: currentScreenIndex,
          ),
          const VerticalDivider(
            thickness: 1.0,
            width: 0.0,
          ),
          Expanded(
            child: screen,
          ),
        ],
      ),
    );
  }
}
