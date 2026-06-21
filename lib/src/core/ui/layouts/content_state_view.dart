import 'package:flutter/material.dart';

import 'layouts_design.dart';

class ContentStateView extends StatelessWidget {
  const ContentStateView.loading({
    super.key,
    this.message,
    this.visual,
    this.action,
    this.size,
  });

  const ContentStateView.empty({
    super.key,
    required this.message,
    this.visual,
    this.action,
    this.size,
  });

  const ContentStateView.error({
    super.key,
    required this.message,
    this.visual,
    this.action,
    this.size,
  });

  final String? message;
  final Widget? visual;
  final Widget? action;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    final content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: TvLayoutDesign.stateContentGap,
        children: [
          ?visual,
          if (message != null)
            Text(
              message!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ?action,
        ],
      ),
    );

    final fixedSize = size;
    if (fixedSize != null) {
      return SizedBox.fromSize(size: fixedSize, child: content);
    }

    return SizedBox.expand(child: content);
  }
}
