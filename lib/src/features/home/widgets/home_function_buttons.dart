import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/constants/styles.dart';
import '../../../common/widgets/focused_outline_button.dart';
import '../../../utils/router/app_router.dart';
import '../../dashboard/controller/dashboard_controller.dart';
import '../../live/controller/live_controller.dart';

class HomeFunctionButtons extends StatelessWidget {
  const HomeFunctionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        // Refresh
        _HomeRefreshButton(),
        SizedBox(width: 10.0),
        // All channels sort by popular
        _HomePopularButton(),
      ],
    );
  }
}

class _HomeFunctionButton extends StatelessWidget {
  const _HomeFunctionButton({
    required this.onPressed,
    required this.child,
  });

  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Material(
        elevation: 5.0,
        color: AppColors.greyContainerColor,
        borderRadius: BorderRadius.circular(12.0),
        child: FocusedOutlineButton(
          padding: const EdgeInsets.all(10.0),
          onPressed: onPressed,
          child: child,
        ),
      ),
    );
  }
}

class _HomeRefreshButton extends ConsumerWidget {
  const _HomeRefreshButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _HomeFunctionButton(
      onPressed: () {
        ref.invalidate(followingLiveControllerProvider);
        ref.invalidate(popularLivesControllerProvider);
      },
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.refresh,
            color: AppColors.whiteColor,
          ),
          SizedBox(width: 10.0),
          Text(
            '새로고침',
            style: TextStyle(
              fontSize: 14.0,
              color: AppColors.whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _HomePopularButton extends ConsumerWidget {
  const _HomePopularButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _HomeFunctionButton(
      onPressed: () {
        ref.read(dashboardControllerProvider.notifier).changeScreen(
              context,
              AppRoute.allLives,
            );
      },
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.sort_rounded,
            color: AppColors.whiteColor,
          ),
          SizedBox(width: 10.0),
          Text(
            '전체 라이브',
            style: TextStyle(
              fontSize: 14.0,
              color: AppColors.whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
