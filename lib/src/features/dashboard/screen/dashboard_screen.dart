import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../home/home.dart';
import '../dashboard.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({
    super.key,
    required this.body,
    this.topPadding = 12.0,
    this.useTextField = false,
  });

  final Widget body;
  final double topPadding;
  final bool useTextField;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncClientRepository = ref.watch(clientRepositoryProvider);

    return asyncClientRepository.when(
      data: (data) {
        final isLoggedIn = data == null ? false : true;

        return CustomScaffold(
          horizontalPadding: 16.0,
          topPadding: topPadding,
          useTextField: useTextField,
          appBar: DashboardAppBar(isLoggedIn: isLoggedIn),
          body: body,
        );
      },
      error: (error, stackTrace) {
        return Center(
          child: Text('$error'),
        );
      },
      loading: () => const Scaffold(
        body: Center(child: Text('로딩중...')),
      ),
    );
  }
}
