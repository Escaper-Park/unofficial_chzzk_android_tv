import 'package:flutter/material.dart';

import 'tv_back_scope.dart';

class TvScaffold extends StatelessWidget {
  const TvScaffold({
    super.key,
    required this.backController,
    this.body,
    this.backgroundColor,
  });

  final TvBackController backController;
  final Widget? body;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return TvBackScope(
      controller: backController,
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: body,
      ),
    );
  }
}
