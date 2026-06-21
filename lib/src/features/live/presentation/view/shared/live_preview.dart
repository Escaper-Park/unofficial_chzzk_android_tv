import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../live_player/domain/use_cases/resolve_live_playback_uri.dart';
import '../../../../settings/domain/entities/settings_preferences.dart';
import '../../../../settings/domain/repositories/settings_preferences_repository.dart';
import '../../../domain/entities/live_feed.dart';
import '../../../domain/repositories/live_repository.dart';
import 'live_preview_controller.dart';
import 'live_preview_settings.dart';
import 'live_preview_state.dart';

export 'live_preview_state.dart';

typedef LivePreviewBuilder =
    Widget Function(BuildContext context, LivePreviewState state);
typedef LivePreviewStateListenable = ValueListenable<LivePreviewState>;
typedef LivePreviewListenableBuilder =
    Widget Function(
      BuildContext context,
      LivePreviewStateListenable previewState,
    );

class LivePreview extends HookWidget {
  const LivePreview({
    super.key,
    required this.item,
    required this.focusNode,
    required this.builder,
    this.settings,
    this.settingsFromGeneralSetting = LivePreviewSettings.liveCard,
  });

  final Live item;
  final FocusNode focusNode;
  final LivePreviewBuilder builder;
  final LivePreviewSettings? settings;
  final LivePreviewSettings Function(GeneralSetting setting)
  settingsFromGeneralSetting;

  @override
  Widget build(BuildContext context) {
    return LivePreviewListenable(
      item: item,
      focusNode: focusNode,
      settings: settings,
      settingsFromGeneralSetting: settingsFromGeneralSetting,
      builder: (context, previewState) {
        return ValueListenableBuilder<LivePreviewState>(
          valueListenable: previewState,
          builder: (context, state, _) => builder(context, state),
        );
      },
    );
  }
}

class LivePreviewListenable extends HookWidget {
  const LivePreviewListenable({
    super.key,
    required this.item,
    required this.focusNode,
    required this.builder,
    this.settings,
    this.settingsFromGeneralSetting = LivePreviewSettings.liveCard,
  });

  final Live item;
  final FocusNode focusNode;
  final LivePreviewListenableBuilder builder;
  final LivePreviewSettings? settings;
  final LivePreviewSettings Function(GeneralSetting setting)
  settingsFromGeneralSetting;

  @override
  Widget build(BuildContext context) {
    useListenable(focusNode);

    final controller = useMemoized(LivePreviewController.new);

    useEffect(() => controller.dispose, [controller]);

    useEffect(() {
      void syncPreview() {
        unawaited(
          controller.start(
            hasFocus: focusNode.hasFocus,
            item: item,
            settings: settings,
            readSettings: () => _readPreviewSettings(context),
            resolvePlaybackUri:
                ({
                  required item,
                  required settings,
                  required isCancelled,
                }) => _resolvePlaybackUri(
                  context: context,
                  item: item,
                  settings: settings,
                  isCancelled: isCancelled,
                ),
          ),
        );
      }

      focusNode.addListener(syncPreview);
      syncPreview();
      return () {
        focusNode.removeListener(syncPreview);
        controller.stop(resetState: false);
      };
    }, [controller, focusNode, item, settings, settingsFromGeneralSetting]);

    return builder(context, controller);
  }

  Future<LivePreviewSettings?> _readPreviewSettings(
    BuildContext context,
  ) async {
    try {
      final preferences = await context
          .read<SettingsPreferencesRepository>()
          .read();
      return settingsFromGeneralSetting(preferences.generalSetting);
    } on Object {
      return null;
    }
  }
}

Future<Uri?> _resolvePlaybackUri({
  required BuildContext context,
  required Live item,
  required LivePreviewSettings settings,
  required bool Function() isCancelled,
}) async {
  final channelId = _nonBlank(item.channel?.channelId);
  if (channelId == null) {
    return null;
  }

  try {
    final liveRepository = context.read<LiveRepository>();
    final loadPlaylistText = context.read<LoadLivePlaybackPlaylistText>();
    final detail = await liveRepository.getLiveDetail(channelId: channelId);
    if (isCancelled()) {
      return null;
    }

    if (!canPlayLivePreviewFromDetail(detail)) {
      return null;
    }

    final playbackSource = await resolveLivePlaybackSource(
      livePlaybackJson: detail.livePlaybackJson,
      latencyIndex: _previewLatencyIndex,
      resolutionIndex: settings.resolutionIndex,
      loadPlaylistText: loadPlaylistText,
    );
    if (isCancelled()) {
      return null;
    }

    return playbackSource?.playbackUri;
  } on Object {
    return null;
  }
}

String? _nonBlank(String? value) {
  final trimmed = value?.trim();
  if (trimmed == null || trimmed.isEmpty) {
    return null;
  }

  return trimmed;
}

const _previewLatencyIndex = 0;
