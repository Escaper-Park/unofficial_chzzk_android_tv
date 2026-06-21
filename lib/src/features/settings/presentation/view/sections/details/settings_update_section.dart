import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../app/app_build_info.dart';
import '../../../../../../core/ui/ui.dart';
import '../../../bloc/settings_bloc.dart';
import '../../../models/settings_app_version.dart';
import '../../../settings_screen_design.dart';
import '../../../settings_screen_string.dart';

class SettingsUpdateSection extends StatelessWidget {
  const SettingsUpdateSection({
    super.key,
    required this.state,
    required this.firstFocusNode,
  });

  final SettingsState state;
  final FocusNode firstFocusNode;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: SettingsScreenDesign.rowGap,
      children: [
        TvListItem(
          key: const ValueKey('settings-update-check'),
          title: SettingsScreenString.updateCheckTitle,
          subtitle: SettingsScreenString.updateCheckDescription,
          action: _actionLabel,
          icon: Icons.system_update,
          focusNode: firstFocusNode,
          autofocus: true,
          enabled: state.updateStatus != SettingsUpdateStatus.checking,
          onPressed: () {
            context.read<SettingsBloc>().add(
              const SettingsEvent.updateCheckRequested(),
            );
          },
        ),
        if (state.latestRelease != null) ...[
          TvListItem(
            key: const ValueKey('settings-release-notes'),
            title: SettingsScreenString.releaseNotes,
            action: state.latestRelease!.tagName,
            icon: Icons.article,
            onPressed: () {},
          ),
          _ReleaseNotesBody(text: _releaseNotesText),
        ],
      ],
    );
  }

  String get _releaseNotesText {
    final body = state.latestRelease?.body.trim();
    if (body == null || body.isEmpty) {
      return SettingsScreenString.noReleaseNotes;
    }

    return body;
  }

  String get _actionLabel {
    return switch (state.updateStatus) {
      SettingsUpdateStatus.idle => SettingsScreenString.currentVersion(
        AppBuildInfo.version,
      ),
      SettingsUpdateStatus.checking => SettingsScreenString.updateChecking,
      SettingsUpdateStatus.failure => SettingsScreenString.updateFailed,
      SettingsUpdateStatus.success => _successLabel,
    };
  }

  String get _successLabel {
    final latestTag = state.latestRelease?.tagName ?? '';
    if (isSettingsUpdateAvailable(
      currentVersion: AppBuildInfo.version,
      latestTag: latestTag,
    )) {
      return SettingsScreenString.updateAvailable;
    }

    return SettingsScreenString.latestVersion;
  }
}

class _ReleaseNotesBody extends StatefulWidget {
  const _ReleaseNotesBody({
    required this.text,
  });

  final String text;

  @override
  State<_ReleaseNotesBody> createState() => _ReleaseNotesBodyState();
}

class _ReleaseNotesBodyState extends State<_ReleaseNotesBody> {
  late final FocusNode _focusNode;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode(debugLabel: 'settings release notes body');
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      key: const ValueKey('settings-release-notes-body-focus'),
      focusNode: _focusNode,
      onFocusChange: _handleFocusChange,
      onKeyEvent: _handleKeyEvent,
      child: AnimatedBuilder(
        animation: _focusNode,
        builder: (context, child) {
          final colorScheme = Theme.of(context).colorScheme;
          final textTheme = Theme.of(context).textTheme;
          final focused = _focusNode.hasFocus;
          final foreground = focused
              ? colorScheme.surface
              : colorScheme.onSurface;

          return ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: SettingsScreenDesign.releaseNotesMaxHeight,
            ),
            child: DecoratedBox(
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
                child: SingleChildScrollView(
                  key: const ValueKey('settings-release-notes-body-scroll'),
                  controller: _scrollController,
                  padding: SettingsScreenDesign.releaseNotesPadding,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.text,
                      key: const ValueKey('settings-release-notes-body'),
                      softWrap: true,
                      style: textTheme.bodySmall?.copyWith(
                        color: foreground.withValues(alpha: 0.82),
                        height: 1.35,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _handleFocusChange(bool focused) {
    if (!focused) {
      return;
    }

    unawaited(
      Scrollable.ensureVisible(
        context,
        alignment: 1,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeOut,
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
    final current = position.pixels;
    final target =
        (current + SettingsScreenDesign.releaseNotesScrollStep * direction)
            .clamp(position.minScrollExtent, position.maxScrollExtent)
            .toDouble();
    if ((target - current).abs() < 0.5) {
      return KeyEventResult.ignored;
    }

    _scrollController.jumpTo(target);
    return KeyEventResult.handled;
  }
}
