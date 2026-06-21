import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router/app_player_route_targets.dart';
import '../../../app/router/app_routes.dart';
import '../../../core/ui/ui.dart';
import '../../auth/presentation/bloc/auth_session_bloc.dart';
import '../../channel/domain/repositories/channel_repository.dart';
import '../../player_entry_guard.dart';
import '../../player_entry_viewer_benefits.dart';
import '../../vod_player/presentation/vod_player_route_target.dart';
import '../domain/entities/vod_detail.dart';
import '../domain/entities/vod_feed.dart';
import '../domain/repositories/vod_repository.dart';
import '../domain/use_cases/check_vod_player_entry.dart';
import 'view/shared/vod_card_formatters.dart';
import 'vod_player_entry_string.dart';
import 'vod_player_entry_target.dart';

part 'vod_player_entry_flow_checks.dart';
part 'vod_player_entry_flow_dialogs.dart';

typedef VodPlayerEntryAllowedCallback =
    FutureOr<void> Function(
      Vod item,
      VodPlayerInitialTarget target,
    );

final _pendingVodEntryVideoNos = <int>{};

Future<void> openVodPlayerFromCard(
  BuildContext context,
  Vod item, {
  VoidCallback? onPlayerClosed,
}) async {
  await playerEntryGuard.run(() async {
    await handleVodPlayerEntryFromCard(
      context,
      item,
      onAllowed: (_, target) async {
        await context.pushNamed(
          AppRoute.vodPlayer.name,
          queryParameters: vodPlayerRouteQuery(target),
          extra: target,
        );
        if (context.mounted) {
          onPlayerClosed?.call();
        }
      },
    );
  });
}

Future<void> handleVodPlayerEntryFromCard(
  BuildContext context,
  Vod item, {
  bool usePendingEntryGuard = true,
  required VodPlayerEntryAllowedCallback onAllowed,
}) async {
  if (!usePendingEntryGuard) {
    await _handleVodPlayerEntryFromCard(
      context,
      item,
      onAllowed: onAllowed,
    );
    return;
  }

  if (!_pendingVodEntryVideoNos.add(item.videoNo)) {
    return;
  }

  try {
    await _handleVodPlayerEntryFromCard(
      context,
      item,
      onAllowed: onAllowed,
    );
  } finally {
    _pendingVodEntryVideoNos.remove(item.videoNo);
  }
}

Future<void> _handleVodPlayerEntryFromCard(
  BuildContext context,
  Vod item, {
  required VodPlayerEntryAllowedCallback onAllowed,
}) async {
  final isSignedIn = context.read<AuthSessionBloc>().state.hasRequiredCookies;
  final vodRepository = context.read<VodRepository>();
  final channelRepository = context.read<ChannelRepository>();

  final initialDecision = await _checkVodEntry(
    context: context,
    vod: item,
    isSignedIn: isSignedIn,
    channelRepository: channelRepository,
  );
  if (!context.mounted || initialDecision == null) {
    return;
  }

  final initialBlockReason = initialDecision.blockReason;
  if (initialBlockReason != null &&
      initialBlockReason != VodPlayerEntryBlockReason.missingVideoId) {
    await _showBlockedDialog(context, initialBlockReason);
    return;
  }

  final detail = await _loadVodDetail(vodRepository, item.videoNo);
  if (!context.mounted) {
    return;
  }

  if (detail != null) {
    final detailDecision = await _checkVodDetailEntry(
      context: context,
      vod: detail,
      fallbackVideoId: item.videoId,
      fallbackChannelId: item.channel?.channelId,
      isSignedIn: isSignedIn,
      channelRepository: channelRepository,
    );
    if (!context.mounted || detailDecision == null) {
      return;
    }

    final detailBlockReason = detailDecision.blockReason;
    if (detailBlockReason != null) {
      await _showBlockedDialog(context, detailBlockReason);
      return;
    }
  } else if (initialBlockReason != null) {
    await _showBlockedDialog(context, initialBlockReason);
    return;
  }

  if (!context.mounted) {
    return;
  }
  final startPositionSeconds = await _resolveStartPositionSeconds(
    context: context,
    watchProgressSeconds: item.watchTimeline ?? detail?.watchTimeline,
  );
  if (!context.mounted || startPositionSeconds == null) {
    return;
  }

  await onAllowed(
    item,
    vodPlayerEntryTargetFromCard(
      item: item,
      detail: detail,
      startPositionSeconds: startPositionSeconds,
    ),
  );
}
