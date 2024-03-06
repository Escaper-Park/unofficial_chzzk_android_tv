import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/widgets/base_scaffold.dart';
import '../../utils/router/app_router.dart';
import '../dashboard/controller/dashboard_controller.dart';
import './widgets/search_textfield.dart';

class SearchScreen extends HookConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textInputFocusNode = useFocusNode();

    return PopScope(
      canPop: false,
      onPopInvoked: (_) async {
        textInputFocusNode.unfocus();
        ref
            .read(dashboardControllerProvider.notifier)
            .changeScreen(context, AppRoute.home);
      },
      child: BaseScaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: Center(
            child: SearchTextField(
              textInputFocusNode: textInputFocusNode,
              goBackAction: () {},
            ),
          ),
        ),
      ),
    );
  }
}
