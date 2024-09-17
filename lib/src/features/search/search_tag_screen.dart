import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/widgets/pop_scope_screen.dart';
import '../../utils/router/app_router.dart';
import '../dashboard/controller/dashboard_controller.dart';
import 'widgets/search/search_widgets.dart';

class SearchTagScreen extends ConsumerWidget {
  const SearchTagScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScopeScreen(
      onPopInvoked: (_) {
        ref
            .read(dashboardControllerProvider.notifier)
            .changeScreen(context, AppRoute.home);
      },
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            child: SearchField(hintText: '검색할 태그를 입력하세요'),
          ),
          SearchKeyboard(
            onEnterPressed: (input) {
              if (context.mounted) {
                context.pushNamed(
                  AppRoute.searchTagResults.routeName,
                  extra: {'tag': input},
                );
              }
            },
          )
        ],
      ),
    );
  }
}
