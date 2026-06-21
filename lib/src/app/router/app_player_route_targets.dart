import '../../features/live_player/presentation/live_player_route_target.dart';
import '../../features/vod_player/presentation/vod_player_route_target.dart';

Map<String, String> livePlayerRouteQuery(
  LivePlayerInitialTarget target,
) {
  return {
    _PlayerRouteQuery.channelId: target.channelId,
    if (target.liveId != null) _PlayerRouteQuery.liveId: '${target.liveId}',
  };
}

LivePlayerInitialTarget? livePlayerInitialTargetFromRoute({
  required Map<String, String> queryParameters,
  Object? extra,
}) {
  if (extra is LivePlayerInitialTarget) {
    return extra;
  }

  final channelId = _nonBlank(queryParameters[_PlayerRouteQuery.channelId]);
  if (channelId == null) {
    return null;
  }

  return LivePlayerInitialTarget(
    channelId: channelId,
    liveId: _optionalPositiveInt(queryParameters[_PlayerRouteQuery.liveId]),
  );
}

Map<String, String> vodPlayerRouteQuery(
  VodPlayerInitialTarget target,
) {
  return {
    _PlayerRouteQuery.videoNo: '${target.videoNo}',
    if (target.startPositionSeconds > 0)
      _PlayerRouteQuery.start: '${target.startPositionSeconds}',
  };
}

VodPlayerInitialTarget? vodPlayerInitialTargetFromRoute({
  required Map<String, String> queryParameters,
  Object? extra,
}) {
  if (extra is VodPlayerInitialTarget) {
    return extra;
  }

  final videoNo = _requiredPositiveInt(
    queryParameters[_PlayerRouteQuery.videoNo],
  );
  if (videoNo == null) {
    return null;
  }

  return VodPlayerInitialTarget(
    videoNo: videoNo,
    startPositionSeconds:
        _optionalNonNegativeInt(queryParameters[_PlayerRouteQuery.start]) ?? 0,
  );
}

abstract final class _PlayerRouteQuery {
  static const channelId = 'channelId';
  static const liveId = 'liveId';
  static const videoNo = 'videoNo';
  static const start = 'start';
}

String? _nonBlank(String? value) {
  final trimmed = value?.trim();
  if (trimmed == null || trimmed.isEmpty) {
    return null;
  }

  return trimmed;
}

int? _requiredPositiveInt(String? value) {
  final normalized = _nonBlank(value);
  if (normalized == null) {
    return null;
  }

  final parsed = int.tryParse(normalized);
  if (parsed == null || parsed <= 0) {
    return null;
  }

  return parsed;
}

int? _optionalInt(String? value) {
  final normalized = _nonBlank(value);
  if (normalized == null) {
    return null;
  }

  return int.tryParse(normalized);
}

int? _optionalPositiveInt(String? value) {
  final parsed = _optionalInt(value);
  if (parsed == null || parsed <= 0) {
    return null;
  }

  return parsed;
}

int? _optionalNonNegativeInt(String? value) {
  final parsed = _optionalInt(value);
  if (parsed == null || parsed < 0) {
    return null;
  }

  return parsed;
}
