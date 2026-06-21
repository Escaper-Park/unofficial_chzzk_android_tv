import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/app/router/app_player_route_targets.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live_player/presentation/live_player_route_target.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod_player/presentation/vod_player_route_target.dart';

void main() {
  group('live player route targets', () {
    test('serializes the restorable target data', () {
      expect(
        livePlayerRouteQuery(
          const LivePlayerInitialTarget(
            channelId: 'channel-1',
            liveId: 42,
            title: 'Live title',
          ),
        ),
        {
          'channelId': 'channel-1',
          'liveId': '42',
        },
      );
    });

    test('restores the minimum target from query parameters', () {
      final target = livePlayerInitialTargetFromRoute(
        queryParameters: const {
          'channelId': ' channel-1 ',
          'liveId': '42',
        },
      );

      expect(target?.channelId, 'channel-1');
      expect(target?.liveId, 42);
      expect(target?.title, isNull);
    });

    test('keeps extra as the richer target when it is present', () {
      const extra = LivePlayerInitialTarget(
        channelId: 'extra-channel',
        title: 'Extra title',
      );

      expect(
        livePlayerInitialTargetFromRoute(
          queryParameters: const {'channelId': 'query-channel'},
          extra: extra,
        ),
        same(extra),
      );
    });

    test('returns null when the required channel id is missing', () {
      expect(
        livePlayerInitialTargetFromRoute(queryParameters: const {}),
        isNull,
      );
    });

    test('ignores invalid optional live ids from query parameters', () {
      final target = livePlayerInitialTargetFromRoute(
        queryParameters: const {
          'channelId': 'channel-1',
          'liveId': '-1',
        },
      );

      expect(target?.channelId, 'channel-1');
      expect(target?.liveId, isNull);
    });
  });

  group('vod player route targets', () {
    test('serializes the restorable target data', () {
      expect(
        vodPlayerRouteQuery(
          const VodPlayerInitialTarget(
            videoNo: 100,
            title: 'VOD title',
            startPositionSeconds: 30,
          ),
        ),
        {
          'videoNo': '100',
          'start': '30',
        },
      );
    });

    test('omits the optional start value when it is zero', () {
      expect(
        vodPlayerRouteQuery(
          const VodPlayerInitialTarget(videoNo: 100),
        ),
        {'videoNo': '100'},
      );
    });

    test('restores the minimum target from query parameters', () {
      final target = vodPlayerInitialTargetFromRoute(
        queryParameters: const {
          'videoNo': '100',
          'start': '30',
        },
      );

      expect(target?.videoNo, 100);
      expect(target?.startPositionSeconds, 30);
      expect(target?.title, isNull);
    });

    test('keeps extra as the richer target when it is present', () {
      const extra = VodPlayerInitialTarget(
        videoNo: 200,
        title: 'Extra title',
      );

      expect(
        vodPlayerInitialTargetFromRoute(
          queryParameters: const {'videoNo': '100'},
          extra: extra,
        ),
        same(extra),
      );
    });

    test('returns null when the required video number is invalid', () {
      expect(
        vodPlayerInitialTargetFromRoute(
          queryParameters: const {'videoNo': 'abc'},
        ),
        isNull,
      );
    });

    test('returns null when the required video number is not positive', () {
      expect(
        vodPlayerInitialTargetFromRoute(
          queryParameters: const {'videoNo': '0'},
        ),
        isNull,
      );
      expect(
        vodPlayerInitialTargetFromRoute(
          queryParameters: const {'videoNo': '-1'},
        ),
        isNull,
      );
    });

    test('ignores negative optional start positions', () {
      final target = vodPlayerInitialTargetFromRoute(
        queryParameters: const {
          'videoNo': '100',
          'start': '-1',
        },
      );

      expect(target?.videoNo, 100);
      expect(target?.startPositionSeconds, 0);
    });
  });
}
