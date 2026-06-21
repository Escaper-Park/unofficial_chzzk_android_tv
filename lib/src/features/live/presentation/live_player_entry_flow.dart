import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router/app_player_route_targets.dart';
import '../../../app/router/app_routes.dart';
import '../../../core/ui/ui.dart';
import '../../channel/domain/repositories/channel_repository.dart';
import '../../player_entry_guard.dart';
import '../../player_entry_viewer_benefits.dart';
import '../domain/entities/live_feed.dart';
import '../domain/entities/live_status.dart';
import '../domain/repositories/live_repository.dart';
import '../domain/use_cases/check_live_player_entry.dart';
import 'live_player_entry_string.dart';
import 'live_player_entry_target.dart';

part 'live_player_entry_flow_checks.dart';
part 'live_player_entry_flow_dialogs.dart';

typedef LivePlayerEntryAllowedCallback =
    FutureOr<void> Function(
      Live item,
      String channelId,
    );
typedef LivePlayerChannelEntryAllowedCallback =
    FutureOr<void> Function(
      String channelId,
      LiveStatus status,
    );

final _pendingLiveEntryChannelIds = <String>{};

Future<void> openLivePlayerFromCard(
  BuildContext context,
  Live item, {
  VoidCallback? onPlayerClosed,
}) async {
  await playerEntryGuard.run(() async {
    await handleLivePlayerEntryFromCard(
      context,
      item,
      onAllowed: (item, channelId) async {
        final target = livePlayerEntryTargetFromCard(item, channelId);
        await context.pushNamed(
          AppRoute.livePlayer.name,
          queryParameters: livePlayerRouteQuery(target),
          extra: target,
        );
        if (context.mounted) {
          onPlayerClosed?.call();
        }
      },
    );
  });
}

Future<void> openLivePlayerFromChannel(
  BuildContext context, {
  required String channelId,
  String? title,
  String? thumbnailImageUrl,
}) async {
  await playerEntryGuard.run(() async {
    await handleLivePlayerEntryFromChannel(
      context,
      channelId: channelId,
      onAllowed: (channelId, status) async {
        final target = livePlayerEntryTargetFromChannel(
          channelId: channelId,
          status: status,
          title: title,
          thumbnailImageUrl: thumbnailImageUrl,
        );
        await context.pushNamed(
          AppRoute.livePlayer.name,
          queryParameters: livePlayerRouteQuery(target),
          extra: target,
        );
      },
    );
  });
}

Future<void> handleLivePlayerEntryFromCard(
  BuildContext context,
  Live item, {
  required LivePlayerEntryAllowedCallback onAllowed,
  bool usePendingEntryGuard = true,
}) async {
  final channelId = playerEntryTextOrNull(item.channel?.channelId);
  if (channelId == null) {
    await _showBlockedDialog(
      context,
      LivePlayerEntryBlockReason.restricted,
    );
    return;
  }

  if (!usePendingEntryGuard) {
    await _handleLivePlayerEntryFromCard(
      context,
      item,
      channelId,
      onAllowed: onAllowed,
    );
    return;
  }

  if (!_pendingLiveEntryChannelIds.add(channelId)) {
    return;
  }

  try {
    await _handleLivePlayerEntryFromCard(
      context,
      item,
      channelId,
      onAllowed: onAllowed,
    );
  } finally {
    _pendingLiveEntryChannelIds.remove(channelId);
  }
}

Future<void> handleLivePlayerEntryFromChannel(
  BuildContext context, {
  required String channelId,
  required LivePlayerChannelEntryAllowedCallback onAllowed,
}) async {
  final normalizedChannelId = playerEntryTextOrNull(channelId);
  if (normalizedChannelId == null) {
    await _showBlockedDialog(
      context,
      LivePlayerEntryBlockReason.restricted,
    );
    return;
  }

  if (!_pendingLiveEntryChannelIds.add(normalizedChannelId)) {
    return;
  }

  try {
    await _handleLivePlayerEntryFromChannel(
      context,
      normalizedChannelId,
      onAllowed: onAllowed,
    );
  } finally {
    _pendingLiveEntryChannelIds.remove(normalizedChannelId);
  }
}

Future<void> _handleLivePlayerEntryFromCard(
  BuildContext context,
  Live item,
  String channelId, {
  required LivePlayerEntryAllowedCallback onAllowed,
}) async {
  final status = await _allowedLiveStatusForChannel(context, channelId);
  if (status == null) {
    return;
  }

  await onAllowed(item, channelId);
}

Future<void> _handleLivePlayerEntryFromChannel(
  BuildContext context,
  String channelId, {
  required LivePlayerChannelEntryAllowedCallback onAllowed,
}) async {
  final status = await _allowedLiveStatusForChannel(context, channelId);
  if (status == null) {
    return;
  }

  await onAllowed(channelId, status);
}
