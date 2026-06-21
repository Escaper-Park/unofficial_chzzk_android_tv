import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_playback.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod_player/domain/use_cases/resolve_vod_playback_uri.dart';

void main() {
  test('rewrites selected VOD media playlist with inherited query', () async {
    const masterText = '''
#EXTM3U
#EXT-X-STREAM-INF:BANDWIDTH=1000,RESOLUTION=640x360
low/index.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=3000,RESOLUTION=1280x720
high/index.m3u8
''';
    const highText = '''
#EXTM3U
#EXT-X-VERSION:3
#EXT-X-KEY:METHOD=AES-128,URI="key.bin"
#EXTINF:6.0,
segment0.ts
#EXTINF:6.0,
https://media.example.com/segment1.ts?existing=1
''';
    final requestedUris = <Uri>[];
    final result = await resolveVodPlaybackSource(
      masterPlaylistUri: Uri.parse(
        'https://vod.example.com/master.m3u8?token=signed&policy=p',
      ),
      resolutionIndex: 2,
      startPositionSeconds: 12,
      loadPlaylistText: ({required playlistUri}) async {
        requestedUris.add(playlistUri);
        if (playlistUri.path.endsWith('/master.m3u8')) {
          return masterText;
        }
        if (playlistUri.path.endsWith('/high/index.m3u8')) {
          return highText;
        }
        fail('Unexpected playlist URI: $playlistUri');
      },
    );
    addTearDown(() async {
      await result.cache?.delete();
    });

    expect(
      requestedUris.last.toString(),
      'https://vod.example.com/high/index.m3u8?token=signed&policy=p',
    );
    expect(result.availableResolutionIndexes, [0, 2, 4]);

    final rewrittenText = File.fromUri(result.playbackUri).readAsStringSync();
    expect(
      rewrittenText,
      contains('#EXT-X-START:TIME-OFFSET=12,PRECISE=YES'),
    );
    expect(
      rewrittenText,
      contains(
        'URI="https://vod.example.com/high/key.bin?token=signed&policy=p"',
      ),
    );
    expect(
      rewrittenText,
      contains(
        'https://vod.example.com/high/segment0.ts?token=signed&policy=p',
      ),
    );
    expect(
      rewrittenText,
      contains(
        'https://media.example.com/segment1.ts?existing=1&token=signed&policy=p',
      ),
    );
  });

  test(
    'falls back to highest variant when fixed resolution is unavailable',
    () async {
      const masterText = '''
#EXTM3U
#EXT-X-STREAM-INF:BANDWIDTH=300000,RESOLUTION=256x144
144p/index.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=3000000,RESOLUTION=1280x720
720p/index.m3u8
''';
      const highText = '''
#EXTM3U
#EXTINF:6.0,
segment0.ts
''';
      final requestedUris = <Uri>[];
      final result = await resolveVodPlaybackSource(
        masterPlaylistUri: Uri.parse('https://vod.example.com/master.m3u8'),
        resolutionIndex: 1,
        startPositionSeconds: null,
        loadPlaylistText: ({required playlistUri}) async {
          requestedUris.add(playlistUri);
          if (playlistUri.path.endsWith('/master.m3u8')) {
            return masterText;
          }
          if (playlistUri.path.endsWith('/720p/index.m3u8')) {
            return highText;
          }
          fail('Unexpected playlist URI: $playlistUri');
        },
      );
      addTearDown(() async {
        await result.cache?.delete();
      });

      expect(
        requestedUris.last,
        Uri.parse('https://vod.example.com/720p/index.m3u8'),
      );
      expect(result.availableResolutionIndexes, [2, 4]);
    },
  );

  test('falls back to auto when selected fixed variant fails', () async {
    const masterText = '''
#EXTM3U
#EXT-X-STREAM-INF:BANDWIDTH=1000000,RESOLUTION=640x360
360p/index.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=3000000,RESOLUTION=1280x720
720p/index.m3u8
''';
    const variantText = '''
#EXTM3U
#EXTINF:6.0,
segment0.ts
''';
    final requestedUris = <Uri>[];
    final result = await resolveVodPlaybackSource(
      masterPlaylistUri: Uri.parse(
        'https://vod.example.com/master.m3u8?token=signed',
      ),
      resolutionIndex: 2,
      startPositionSeconds: null,
      loadPlaylistText: ({required playlistUri}) async {
        requestedUris.add(playlistUri);
        if (playlistUri.path.endsWith('/master.m3u8')) {
          return masterText;
        }
        if (playlistUri.path.endsWith('/720p/index.m3u8') &&
            requestedUris
                    .where((uri) => uri.path.endsWith('/720p/index.m3u8'))
                    .length ==
                1) {
          throw StateError('blocked variant');
        }
        if (playlistUri.path.endsWith('/360p/index.m3u8') ||
            playlistUri.path.endsWith('/720p/index.m3u8')) {
          return variantText;
        }
        fail('Unexpected playlist URI: $playlistUri');
      },
    );
    addTearDown(() async {
      await result.cache?.delete();
    });

    expect(requestedUris.map((uri) => uri.path), [
      '/master.m3u8',
      '/720p/index.m3u8',
      '/360p/index.m3u8',
      '/720p/index.m3u8',
    ]);

    final rewrittenMasterText = File.fromUri(
      result.playbackUri,
    ).readAsStringSync();
    expect(rewrittenMasterText, contains('variant_0.m3u8'));
    expect(rewrittenMasterText, contains('variant_1.m3u8'));
  });

  test('treats invalid resolution index as auto', () async {
    const masterText = '''
#EXTM3U
#EXT-X-STREAM-INF:BANDWIDTH=1000000,RESOLUTION=640x360
360p/index.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=3000000,RESOLUTION=1280x720
720p/index.m3u8
''';
    const variantText = '''
#EXTM3U
#EXTINF:6.0,
segment0.ts
''';
    final requestedUris = <Uri>[];
    final result = await resolveVodPlaybackSource(
      masterPlaylistUri: Uri.parse('https://vod.example.com/master.m3u8'),
      resolutionIndex: 999,
      startPositionSeconds: null,
      loadPlaylistText: ({required playlistUri}) async {
        requestedUris.add(playlistUri);
        if (playlistUri.path.endsWith('/master.m3u8') ||
            playlistUri.path.endsWith('/360p/index.m3u8') ||
            playlistUri.path.endsWith('/720p/index.m3u8')) {
          return playlistUri.path.endsWith('/master.m3u8')
              ? masterText
              : variantText;
        }
        fail('Unexpected playlist URI: $playlistUri');
      },
    );
    addTearDown(() async {
      await result.cache?.delete();
    });

    expect(
      requestedUris.map((uri) => uri.path),
      [
        '/master.m3u8',
        '/360p/index.m3u8',
        '/720p/index.m3u8',
      ],
    );
    expect(result.availableResolutionIndexes, [0, 2, 4]);

    final rewrittenMasterText = File.fromUri(
      result.playbackUri,
    ).readAsStringSync();
    expect(rewrittenMasterText, contains('variant_0.m3u8'));
    expect(rewrittenMasterText, contains('variant_1.m3u8'));
  });

  test('auto mode loads variant playlists concurrently', () async {
    const masterText = '''
#EXTM3U
#EXT-X-STREAM-INF:BANDWIDTH=1000000,RESOLUTION=640x360
360p/index.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=3000000,RESOLUTION=1280x720
720p/index.m3u8
''';
    const variantText = '''
#EXTM3U
#EXTINF:6.0,
segment0.ts
''';
    var inFlightVariantRequests = 0;
    var maxInFlightVariantRequests = 0;

    final result = await resolveVodPlaybackSource(
      masterPlaylistUri: Uri.parse('https://vod.example.com/master.m3u8'),
      resolutionIndex: VodPlaybackResolutionOptions.autoIndex,
      startPositionSeconds: null,
      loadPlaylistText: ({required playlistUri}) async {
        if (playlistUri.path.endsWith('/master.m3u8')) {
          return masterText;
        }
        if (playlistUri.path.endsWith('/360p/index.m3u8') ||
            playlistUri.path.endsWith('/720p/index.m3u8')) {
          inFlightVariantRequests += 1;
          if (inFlightVariantRequests > maxInFlightVariantRequests) {
            maxInFlightVariantRequests = inFlightVariantRequests;
          }
          await Future<void>.delayed(const Duration(milliseconds: 20));
          inFlightVariantRequests -= 1;
          return variantText;
        }
        fail('Unexpected playlist URI: $playlistUri');
      },
    );
    addTearDown(() async {
      await result.cache?.delete();
    });

    expect(maxInFlightVariantRequests, greaterThan(1));
  });

  test('parses live rewind HLS URI from legacy playback json', () {
    final uri = vodLiveRewindMasterPlaylistUri('''
{
  "media": [
    {"mediaId": "DASH", "path": "https://example.com/video.mpd"},
    {"mediaId": "HLS", "path": "https://example.com/master.m3u8?token=a"}
  ]
}
''');

    expect(uri, Uri.parse('https://example.com/master.m3u8?token=a'));
  });

  test('parses live rewind seek thumbnail sprite metadata', () {
    final thumbnail = vodLiveRewindSeekThumbnail(
      liveOpenDate: '2026-06-15 17:42:38',
      rawJson: '''
{
  "thumbnail": {
    "spriteSeekingThumbnail": {
      "urlTemplate": "https://example.com/image_4x3x20000_19458271_{spriteIndex}.jpg",
      "processingSeconds": 0,
      "spriteFormat": {
        "intervalType": "millisecond",
        "interval": 20000,
        "columnCount": 4,
        "rowCount": 3,
        "thumbnailWidth": 160,
        "thumbnailHeight": 90
      }
    }
  }
}
''',
    );

    expect(
      thumbnail?.source,
      'https://example.com/image_4x3x20000_19458271_{spriteIndex}.jpg',
    );
    expect(thumbnail?.indexPlaceholder, '{spriteIndex}');
    expect(thumbnail?.indexMode, VodSeekThumbnailIndexMode.absoluteTimestamp);
    expect(thumbnail?.rowCount, 3);
    expect(thumbnail?.columnCount, 4);
    expect(thumbnail?.intervalMilliseconds, 20000);
    expect(thumbnail?.thumbnailWidth, 160);
    expect(thumbnail?.thumbnailHeight, 90);
    expect(thumbnail?.baseTimeMilliseconds, isNotNull);
  });
}
