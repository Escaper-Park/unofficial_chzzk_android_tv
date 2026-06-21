import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/network/network.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/data/data_sources/live_api.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/data/data_sources/live_api_contract.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/data/dtos/live_dtos.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/data/repositories/chzzk_live_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_sort.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/failures/live_failure.dart';

void main() {
  test('maps typed live sort to API sortType', () async {
    final api = _FakeLiveApi();
    final repository = ChzzkLiveRepository(api: api);

    await repository.getLives(sortType: LiveSort.latest);

    expect(api.liveListSortType, LiveApiDefaults.sortTypeLatest);
  });

  test('requests live detail with web query defaults', () async {
    final api = _FakeLiveApi();
    final repository = ChzzkLiveRepository(
      api: api,
      liveDetailDtFactory: () => '1b6d9',
    );

    final detail = await repository.getLiveDetail(channelId: 'channel');

    expect(detail.liveId, 1);
    expect(api.liveDetailChannelId, 'channel');
    expect(api.liveDetailDt, '1b6d9');
    expect(api.liveDetailCu, LiveApiDefaults.liveDetailCu);
    expect(api.liveDetailTm, LiveApiDefaults.liveDetailTm);
  });

  test('posts live watch event with web request body', () async {
    final api = _FakeLiveApi();
    final repository = ChzzkLiveRepository(api: api);

    await repository.postLiveWatchEvent(
      channelId: 'channel-a',
      liveId: 19505830,
      watchEventType: 'WATCH_CONTINUED',
      sessionId: 'session-a',
      eventDurationSeconds: 30,
      positionSeconds: 12203,
      awtSeconds: 150,
      liveTokens: const ['token-a'],
      radioMode: true,
    );

    expect(api.watchEventScene, LiveWatchEventHeaderValues.liveEndScene);
    expect(api.watchEventRequest, {
      LiveWatchEventRequestKeys.channelId: 'channel-a',
      LiveWatchEventRequestKeys.liveId: 19505830,
      LiveWatchEventRequestKeys.payload: {
        LiveWatchEventRequestKeys.watchEventType: 'WATCH_CONTINUED',
        LiveWatchEventRequestKeys.sessionId: 'session-a',
        LiveWatchEventRequestKeys.duration: 30,
        LiveWatchEventRequestKeys.positionAt: 12203,
        LiveWatchEventRequestKeys.awt: 150,
      },
      LiveWatchEventRequestKeys.liveTokens: ['token-a'],
      LiveWatchEventRequestKeys.autoPlay: false,
      LiveWatchEventRequestKeys.radioMode: true,
    });
  });

  test('wraps live watch event failures', () async {
    final repository = ChzzkLiveRepository(
      api: _FakeLiveApi(failPostWatchEvent: true),
    );

    await expectLater(
      repository.postLiveWatchEvent(
        channelId: 'channel-a',
        liveId: 19505830,
        watchEventType: 'WATCH_CONTINUED',
        sessionId: 'session-a',
        eventDurationSeconds: 30,
        positionSeconds: 12203,
        awtSeconds: null,
      ),
      throwsA(isA<LiveWatchEventFailure>()),
    );
  });
}

final class _FakeLiveApi implements LiveApi {
  _FakeLiveApi({
    this.failPostWatchEvent = false,
  });

  final bool failPostWatchEvent;
  String? liveDetailChannelId;
  String? liveDetailDt;
  bool? liveDetailCu;
  bool? liveDetailTm;
  String? liveListSortType;
  String? watchEventScene;
  Map<String, dynamic>? watchEventRequest;

  @override
  Future<ApiResponseDto<LiveListDto>> getLives({
    int size = LiveApiDefaults.browsePageSize,
    String sortType = LiveApiDefaults.sortTypePopular,
    int? concurrentUserCount,
    int? liveId,
  }) async {
    liveListSortType = sortType;
    return const ApiResponseDto<LiveListDto>(content: LiveListDto());
  }

  @override
  Future<ApiResponseDto<LiveStatusDto>> getLiveStatus({
    required String channelId,
    bool includePlayerRecommendContent =
        LiveApiDefaults.includePlayerRecommendContent,
  }) {
    return _unsupportedFakeOperation('LiveApi.getLiveStatus');
  }

  @override
  Future<ApiResponseDto<LiveDetailDto>> getLiveDetail({
    required String channelId,
    required String dt,
    bool cu = LiveApiDefaults.liveDetailCu,
    bool tm = LiveApiDefaults.liveDetailTm,
  }) async {
    liveDetailChannelId = channelId;
    liveDetailDt = dt;
    liveDetailCu = cu;
    liveDetailTm = tm;

    return const ApiResponseDto<LiveDetailDto>(
      content: LiveDetailDto(
        liveId: 1,
        liveTitle: 'Live',
        status: 'OPEN',
      ),
    );
  }

  @override
  Future<void> postWatchEvent({
    String scene = LiveWatchEventHeaderValues.liveEndScene,
    required Map<String, dynamic> request,
  }) async {
    if (failPostWatchEvent) {
      throw StateError('failed watch event');
    }
    watchEventScene = scene;
    watchEventRequest = request;
  }
}

Never _unsupportedFakeOperation(String operation) {
  throw UnsupportedError(
    'Unsupported fake operation: $operation. Provide a focused fake '
    'implementation for this test.',
  );
}
