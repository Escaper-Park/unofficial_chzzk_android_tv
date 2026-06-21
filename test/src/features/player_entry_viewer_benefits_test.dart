import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/entities/channel_detail.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/entities/channel_my_info.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/entities/channel_video.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/repositories/channel_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/player_entry_viewer_benefits.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_sort.dart';

void main() {
  group('playerEntryTextOrNull', () {
    test('trims usable text', () {
      expect(playerEntryTextOrNull(' channel-a '), 'channel-a');
    });

    test('treats blank and literal null text as absent', () {
      expect(playerEntryTextOrNull(' '), isNull);
      expect(playerEntryTextOrNull('NULL'), isNull);
    });
  });

  group('loadPlayerEntryViewerBenefits', () {
    test('maps channel my info to viewer benefits', () async {
      final benefits = await loadPlayerEntryViewerBenefits(
        const _FakeChannelRepository(
          myInfo: ChannelMyInfo(
            channelId: 'channel-a',
            cheatKey: true,
            naverMembership: false,
          ),
        ),
        channelId: 'channel-a',
      );

      expect(benefits.cheatKey, isTrue);
      expect(benefits.naverMembership, isFalse);
    });

    test('falls back to no benefits when loading fails', () async {
      final benefits = await loadPlayerEntryViewerBenefits(
        const _FakeChannelRepository(),
        channelId: 'channel-a',
      );

      expect(benefits, noPlayerEntryViewerBenefits);
    });
  });
}

class _FakeChannelRepository implements ChannelRepository {
  const _FakeChannelRepository({
    this.myInfo,
  });

  final ChannelMyInfo? myInfo;

  @override
  Future<ChannelDetail> getChannel({required String channelId}) {
    return _unsupportedFakeOperation('ChannelRepository.getChannel');
  }

  @override
  Future<ChannelMyInfo> getMyInfo({required String channelId}) async {
    final result = myInfo;
    if (result == null) {
      throw StateError('missing my info');
    }

    return result;
  }

  @override
  Future<ChannelVideoPage> getChannelVideos({
    required String channelId,
    VodSort? sortType,
    int? page,
    int? size,
    String? publishDateAt,
    String? videoType,
  }) {
    return _unsupportedFakeOperation('ChannelRepository.getChannelVideos');
  }

  @override
  Future<void> followChannel({required String channelId}) {
    return _unsupportedFakeOperation('ChannelRepository.followChannel');
  }

  @override
  Future<void> unfollowChannel({required String channelId}) {
    return _unsupportedFakeOperation('ChannelRepository.unfollowChannel');
  }

  @override
  Future<void> enableChannelNotification({required String channelId}) {
    return _unsupportedFakeOperation(
      'ChannelRepository.enableChannelNotification',
    );
  }

  @override
  Future<void> disableChannelNotification({required String channelId}) {
    return _unsupportedFakeOperation(
      'ChannelRepository.disableChannelNotification',
    );
  }
}

Never _unsupportedFakeOperation(String operation) {
  throw UnsupportedError(
    'Unsupported fake operation: $operation. Provide a focused fake '
    'implementation for this test.',
  );
}
