import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../core/ui/ui.dart';
import '../../../settings_screen_design.dart';
import 'settings_license_loader.dart';

class SettingsLicenseContentPane extends StatefulWidget {
  const SettingsLicenseContentPane({
    super.key,
    required this.item,
    required this.focusNode,
  });

  final SettingsLicenseItem item;
  final FocusNode focusNode;

  @override
  State<SettingsLicenseContentPane> createState() {
    return _SettingsLicenseContentPaneState();
  }
}

class _SettingsLicenseContentPaneState
    extends State<SettingsLicenseContentPane> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: widget.focusNode,
      onKeyEvent: _handleKeyEvent,
      child: AnimatedBuilder(
        animation: widget.focusNode,
        builder: (context, child) {
          final colorScheme = Theme.of(context).colorScheme;
          final focused = widget.focusNode.hasFocus;
          final foreground = focused
              ? colorScheme.surface
              : colorScheme.onSurface;

          return DecoratedBox(
            decoration: BoxDecoration(
              color: focused
                  ? colorScheme.inverseSurface
                  : colorScheme.surfaceContainer,
              borderRadius: TvRadius.md.borderRadius,
              border: Border.all(
                color: focused
                    ? colorScheme.primary
                    : colorScheme.outlineVariant.withValues(alpha: 0.6),
              ),
            ),
            child: Scrollbar(
              controller: _scrollController,
              thumbVisibility: true,
              child: ListView.separated(
                key: ValueKey('settings-license-content-${widget.item.title}'),
                controller: _scrollController,
                padding: SettingsScreenDesign.licensesContentPadding,
                itemCount: widget.item.paragraphs.length + 1,
                separatorBuilder: (context, index) {
                  return const SizedBox(height: SettingsScreenDesign.rowGap);
                },
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Text(
                      widget.item.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: foreground,
                      ),
                    );
                  }

                  return Text(
                    widget.item.paragraphs[index - 1],
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: foreground.withValues(alpha: 0.82),
                      height: 1.35,
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  KeyEventResult _handleKeyEvent(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }

    final direction = switch (event.logicalKey) {
      LogicalKeyboardKey.arrowDown => 1.0,
      LogicalKeyboardKey.arrowUp => -1.0,
      _ => 0.0,
    };
    if (direction == 0 || !_scrollController.hasClients) {
      return KeyEventResult.ignored;
    }

    final position = _scrollController.position;
    final target =
        (position.pixels + SettingsScreenDesign.licensesScrollStep * direction)
            .clamp(position.minScrollExtent, position.maxScrollExtent)
            .toDouble();

    _scrollController.jumpTo(target);
    return KeyEventResult.handled;
  }
}
