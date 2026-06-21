import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'layouts_design.dart';

class DebugLayout extends StatelessWidget {
  const DebugLayout({
    super.key,
    required this.child,
    this.enabled = true,
  });

  static const guideKey = Key('debug-layout-guide');

  final Widget child;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    if (!enabled || !kDebugMode) {
      return child;
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        child,
        const Positioned.fill(
          child: IgnorePointer(
            child: _DebugLayoutGuide(key: guideKey),
          ),
        ),
      ],
    );
  }
}

class _DebugLayoutGuide extends StatelessWidget {
  const _DebugLayoutGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Positioned.fill(child: _DebugColumns()),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: TvLayoutDesign.debugEdgeBarHeight,
          child: _DebugEdgeBar(),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          height: TvLayoutDesign.debugEdgeBarHeight,
          child: _DebugEdgeBar(),
        ),
      ],
    );
  }
}

class _DebugColumns extends StatelessWidget {
  const _DebugColumns();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: TvLayoutDesign.debugHorizontalPadding,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (
            var index = 0;
            index < TvLayoutDesign.debugColumnCount;
            index++
          ) ...[
            Expanded(
              child: ColoredBox(color: TvLayoutDesign.debugColumnColor),
            ),
            if (index != TvLayoutDesign.debugColumnCount - 1)
              const SizedBox(width: TvLayoutDesign.debugColumnGap),
          ],
        ],
      ),
    );
  }
}

class _DebugEdgeBar extends StatelessWidget {
  const _DebugEdgeBar();

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: TvLayoutDesign.debugEdgeBarColor,
    );
  }
}
