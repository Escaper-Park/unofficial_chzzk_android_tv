import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live_player/domain/use_cases/resolve_live_playback_uri.dart';

void main() {
  test('resolves HLS playback URI first', () {
    final uri = resolveLivePlaybackUri(
      '''
      {
        "media": [
          {"mediaId": "LLHLS", "path": "https://example.com/live-ll.m3u8"},
          {"mediaId": "HLS", "path": "https://example.com/live.m3u8"}
        ]
      }
      ''',
    );

    expect(uri, Uri.parse('https://example.com/live.m3u8'));
  });

  test('falls back to LLHLS when HLS is missing', () {
    final uri = resolveLivePlaybackUri(
      '''
      {
        "media": [
          {"mediaId": "LLHLS", "path": "https://example.com/live-ll.m3u8"}
        ]
      }
      ''',
    );

    expect(uri, Uri.parse('https://example.com/live-ll.m3u8'));
  });

  test('prefers LLHLS playback URI when latency index selects low latency', () {
    final uri = resolveLivePlaybackUri(
      '''
      {
        "media": [
          {"mediaId": "HLS", "path": "https://example.com/live.m3u8"},
          {"mediaId": "LLHLS", "path": "https://example.com/live-ll.m3u8"}
        ]
      }
      ''',
      latencyIndex: 1,
    );

    expect(uri, Uri.parse('https://example.com/live-ll.m3u8'));
  });

  test('resolves fixed resolution to matching HLS variant URI', () async {
    final source = await resolveLivePlaybackSource(
      livePlaybackJson: '''
      {
        "media": [
          {
            "mediaId": "HLS",
            "path": "https://example.com/master.m3u8?token=signed"
          }
        ]
      }
      ''',
      latencyIndex: 0,
      resolutionIndex: 2,
      loadPlaylistText: ({required playlistUri}) async {
        expect(
          playlistUri,
          Uri.parse('https://example.com/master.m3u8?token=signed'),
        );

        return '''
        #EXTM3U
        #EXT-X-STREAM-INF:BANDWIDTH=800000,RESOLUTION=640x360
        360p/index.m3u8
        #EXT-X-STREAM-INF:BANDWIDTH=3000000,RESOLUTION=1280x720
        720p/index.m3u8
        #EXT-X-STREAM-INF:BANDWIDTH=6000000,RESOLUTION=1920x1080
        1080p/index.m3u8
        ''';
      },
    );

    expect(
      source?.playbackUri,
      Uri.parse('https://example.com/720p/index.m3u8?token=signed'),
    );
    expect(source?.availableResolutionIndexes, [0, 2, 3, 4]);
    expect(source?.expectedVideoWidth, 1280);
    expect(source?.expectedVideoHeight, 720);
  });

  test('keeps master playlist URI when resolution is auto', () async {
    final source = await resolveLivePlaybackSource(
      livePlaybackJson: '''
      {
        "media": [
          {"mediaId": "HLS", "path": "https://example.com/master.m3u8"}
        ]
      }
      ''',
      latencyIndex: 0,
      resolutionIndex: LivePlaybackResolutionOptions.autoIndex,
      loadPlaylistText: ({required playlistUri}) async {
        return '''
        #EXTM3U
        #EXT-X-STREAM-INF:BANDWIDTH=800000,RESOLUTION=640x360
        360p/index.m3u8
        #EXT-X-STREAM-INF:BANDWIDTH=3000000,RESOLUTION=1280x720
        720p/index.m3u8
        ''';
      },
    );

    expect(source?.playbackUri, Uri.parse('https://example.com/master.m3u8'));
    expect(source?.availableResolutionIndexes, [0, 2, 4]);
    expect(source?.expectedVideoWidth, 1280);
    expect(source?.expectedVideoHeight, 720);
  });

  test(
    'falls back to nearest lower variant when fixed resolution is unavailable',
    () async {
      final source = await resolveLivePlaybackSource(
        livePlaybackJson: '''
      {
        "media": [
          {"mediaId": "HLS", "path": "https://example.com/master.m3u8"}
        ]
      }
      ''',
        latencyIndex: 0,
        resolutionIndex: 1,
        loadPlaylistText: ({required playlistUri}) async {
          return '''
        #EXTM3U
        #EXT-X-STREAM-INF:BANDWIDTH=300000,RESOLUTION=256x144
        144p/index.m3u8
        #EXT-X-STREAM-INF:BANDWIDTH=3000000,RESOLUTION=1280x720
        720p/index.m3u8
        ''';
        },
      );

      expect(
        source?.playbackUri,
        Uri.parse('https://example.com/144p/index.m3u8'),
      );
      expect(source?.availableResolutionIndexes, [2, 4]);
    },
  );

  test(
    'falls back to a lower variant when requested height is unavailable',
    () async {
      final source = await resolveLivePlaybackSource(
        livePlaybackJson: '''
      {
        "media": [
          {"mediaId": "HLS", "path": "https://example.com/master.m3u8"}
        ]
      }
      ''',
        latencyIndex: 0,
        resolutionIndex: 1,
        loadPlaylistText: ({required playlistUri}) async {
          return '''
        #EXTM3U
        #EXT-X-STREAM-INF:BANDWIDTH=800000,RESOLUTION=640x360
        360p/index.m3u8
        #EXT-X-STREAM-INF:BANDWIDTH=3000000,RESOLUTION=1280x720
        720p/index.m3u8
        ''';
        },
      );

      expect(
        source?.playbackUri,
        Uri.parse('https://example.com/360p/index.m3u8'),
      );
      expect(source?.availableResolutionIndexes, [0, 2, 4]);
    },
  );

  test('returns null when playback JSON has no playable absolute URI', () {
    final uri = resolveLivePlaybackUri(
      '''
      {
        "media": [
          {"mediaId": "HLS", "path": "/relative/live.m3u8"}
        ]
      }
      ''',
    );

    expect(uri, isNull);
  });
}
