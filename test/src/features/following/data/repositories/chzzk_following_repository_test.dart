import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/network/network.dart';
import 'package:unofficial_chzzk_android_tv/src/features/following/data/data_sources/following_api.dart';
import 'package:unofficial_chzzk_android_tv/src/features/following/data/data_sources/following_api_contract.dart';
import 'package:unofficial_chzzk_android_tv/src/features/following/data/dtos/following_dtos.dart';
import 'package:unofficial_chzzk_android_tv/src/features/following/data/repositories/chzzk_following_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/following/domain/entities/following_sort.dart';

void main() {
  test('maps typed following channel sort to API sortType', () async {
    final api = _FakeFollowingApi();
    final repository = ChzzkFollowingRepository(api: api);

    await repository.fetchFollowingChannels(
      sortType: FollowingChannelSort.follow,
    );

    expect(api.channelSortType, FollowingApiDefaults.channelSortType);
  });

  test('maps typed following live sort to API sortType', () async {
    final api = _FakeFollowingApi();
    final repository = ChzzkFollowingRepository(api: api);

    await repository.fetchFollowingLives(sortType: FollowingLiveSort.oldest);

    expect(api.liveSortType, 'OLDEST');
  });
}

final class _FakeFollowingApi implements FollowingApi {
  String? channelSortType;
  String? liveSortType;

  @override
  Future<ApiResponseDto<FollowingChannelListDto>> getFollowingChannels({
    int page = FollowingApiDefaults.channelPage,
    int size = FollowingApiDefaults.channelPageSize,
    String sortType = FollowingApiDefaults.channelSortType,
  }) async {
    channelSortType = sortType;
    return const ApiResponseDto<FollowingChannelListDto>(
      content: FollowingChannelListDto(),
    );
  }

  @override
  Future<ApiResponseDto<FollowingLiveListDto>> getFollowingLives({
    String sortType = FollowingApiDefaults.liveSortType,
  }) async {
    liveSortType = sortType;
    return const ApiResponseDto<FollowingLiveListDto>(
      content: FollowingLiveListDto(),
    );
  }
}
