import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/network/network.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/data/data_sources/channel_api.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/data/data_sources/channel_api_contract.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/data/dtos/channel_dtos.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/data/repositories/chzzk_channel_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/failures/channel_failure.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_sort.dart';

void main() {
  test('maps typed channel VOD sort to API sortType', () async {
    final api = _FakeChannelApi();
    final repository = ChzzkChannelRepository(api: api);

    await repository.getChannelVideos(
      channelId: 'channel-a',
      sortType: VodSort.popular,
    );

    expect(api.channelVideoSortType, ChannelApiDefaults.videoSortTypePopular);
  });

  test('follow disables channel notification by default', () async {
    final api = _FakeChannelApi();
    final repository = ChzzkChannelRepository(api: api);

    await repository.followChannel(channelId: 'channel-a');

    expect(api.calls, ['follow channel-a', 'disable channel-a']);
  });

  test('wraps channel mutation failures', () async {
    final repository = ChzzkChannelRepository(
      api: _FakeChannelApi(failingCalls: {'disable channel-a'}),
    );

    await expectLater(
      repository.followChannel(channelId: 'channel-a'),
      throwsA(isA<ChannelMutationFailure>()),
    );
  });
}

final class _FakeChannelApi implements ChannelApi {
  _FakeChannelApi({
    this.failingCalls = const {},
  });

  final Set<String> failingCalls;
  final calls = <String>[];
  String? channelVideoSortType;

  @override
  Future<void> followChannel({required String channelId}) async {
    _record('follow $channelId');
  }

  @override
  Future<void> disableChannelNotification({required String channelId}) async {
    _record('disable $channelId');
  }

  @override
  Future<void> enableChannelNotification({required String channelId}) async {
    _record('enable $channelId');
  }

  @override
  Future<ApiResponseDto<ChannelDetailDto>> getChannel({
    required String channelId,
  }) {
    return _unsupportedFakeOperation('ChannelApi.getChannel');
  }

  @override
  Future<ApiResponseDto<ChannelVideoListDto>> getChannelVideos({
    required String channelId,
    String sortType = ChannelApiDefaults.videoSortTypeLatest,
    String pagingType = ChannelApiDefaults.videoPagingTypePage,
    int page = ChannelApiDefaults.videoPage,
    int size = ChannelApiDefaults.videoPageSize,
    String publishDateAt = ChannelApiDefaults.publishDateAt,
    String videoType = ChannelApiDefaults.videoType,
  }) async {
    channelVideoSortType = sortType;
    return const ApiResponseDto<ChannelVideoListDto>(
      content: ChannelVideoListDto(),
    );
  }

  @override
  Future<ApiResponseDto<ChannelMyInfoDto>> getMyInfo({
    required String channelId,
  }) {
    return _unsupportedFakeOperation('ChannelApi.getMyInfo');
  }

  @override
  Future<void> unfollowChannel({required String channelId}) async {
    _record('unfollow $channelId');
  }

  void _record(String call) {
    calls.add(call);
    if (failingCalls.contains(call)) {
      throw StateError('failed $call');
    }
  }
}

Never _unsupportedFakeOperation(String operation) {
  throw UnsupportedError(
    'Unsupported fake operation: $operation. Provide a focused fake '
    'implementation for this test.',
  );
}
