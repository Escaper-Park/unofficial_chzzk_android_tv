import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/widgets/pop_scope_screen.dart';
import '../../utils/router/app_router.dart';
import '../dashboard/controller/dashboard_controller.dart';
import './widgets/search/search_widgets.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScopeScreen(
      onPopInvokedWithResult: (_, __) {
        ref
            .read(dashboardControllerProvider.notifier)
            .changeScreen(context, AppRoute.home);
      },
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SearchField(),
          ),
          SearchKeyboard(),
        ],
      ),
    );
  }
}
