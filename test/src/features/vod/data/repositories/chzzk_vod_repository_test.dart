import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/network/network.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/data/data_sources/vod_api.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/data/data_sources/vod_api_contract.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/data/dtos/vod_dtos.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/data/repositories/chzzk_vod_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_sort.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/failures/vod_failure.dart';

void main() {
  test('maps typed VOD sort to API sortType', () async {
    const api = _FakeVodApi();
    const repository = ChzzkVodRepository(
      api: api,
      playbackApi: _FakeVodPlaybackApi(),
    );

    await repository.getVods(sortType: VodSort.latest);

    expect(api.vodSortType, VodApiDefaults.sortTypeLatest);
  });

  test('wraps VOD watch event failures', () async {
    const repository = ChzzkVodRepository(
      api: _FakeVodApi(failPostWatchEvent: true),
      playbackApi: _FakeVodPlaybackApi(),
    );

    await expectLater(
      repository.postVideoWatchEvent(
        channelId: 'channel-a',
        videoNo: 123,
        watchEventType: 'WATCH_CONTINUED',
        awtSeconds: null,
        positionSeconds: 30,
        sessionId: 'session-a',
        eventDurationSeconds: 10,
        totalLengthSeconds: 100,
      ),
      throwsA(isA<VodWatchEventFailure>()),
    );
  });
}

final class _FakeVodApi implements VodApi {
  const _FakeVodApi({
    this.failPostWatchEvent = false,
  });

  final bool failPostWatchEvent;
  static String? _vodSortType;

  String? get vodSortType => _vodSortType;

  @override
  Future<ApiResponseDto<FollowingVodListDto>> getFollowingVods({
    int size = VodApiDefaults.browsePageSize,
    String? nextNo,
  }) {
    return _unsupportedFakeOperation('VodApi.getFollowingVods');
  }

  @override
  Future<ApiResponseDto<VodDetailDto>> getVodDetail({required int videoNo}) {
    return _unsupportedFakeOperation('VodApi.getVodDetail');
  }

  @override
  Future<ApiResponseDto<VodListDto>> getVods({
    int size = VodApiDefaults.browsePageSize,
    String sortType = VodApiDefaults.sortTypePopular,
    int? publishDateAt,
    int? readCount,
  }) async {
    _vodSortType = sortType;
    return const ApiResponseDto<VodListDto>(content: VodListDto());
  }

  @override
  Future<void> postWatchEvent({required Map<String, dynamic> request}) async {
    if (failPostWatchEvent) {
      throw StateError('failed watch event');
    }
  }
}

final class _FakeVodPlaybackApi implements VodPlaybackApi {
  const _FakeVodPlaybackApi();

  @override
  Future<VodPlaybackDto> getPlayback({
    required String videoId,
    required String key,
    String sid = VodApiDefaults.playbackSid,
    String deviceType = VodApiDefaults.playbackDeviceType,
    String status = VodApiDefaults.playbackStatus,
    String locale = VodApiDefaults.playbackLocale,
    String captionLocale = VodApiDefaults.playbackCaptionLocale,
  }) {
    return _unsupportedFakeOperation('VodPlaybackApi.getPlayback');
  }
}

Never _unsupportedFakeOperation(String operation) {
  throw UnsupportedError(
    'Unsupported fake operation: $operation. Provide a focused fake '
    'implementation for this test.',
  );
}
