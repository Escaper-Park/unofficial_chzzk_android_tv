import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/network/network.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_sort.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search_tag_results/data/data_sources/search_tag_results_api.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search_tag_results/data/data_sources/search_tag_results_api_contract.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search_tag_results/data/dtos/search_tag_results_dtos.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search_tag_results/data/repositories/chzzk_search_tag_results_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_sort.dart';

void main() {
  test('maps typed search-tag live sort to API sortType', () async {
    final api = _FakeSearchTagResultsApi();
    final repository = ChzzkSearchTagResultsRepository(api: api);

    await repository.searchTagLives(tag: 'game', sortType: LiveSort.latest);

    expect(api.liveSortType, SearchTagResultsApiDefaults.sortTypeLatest);
  });

  test('maps typed search-tag video sort to API sortType', () async {
    final api = _FakeSearchTagResultsApi();
    final repository = ChzzkSearchTagResultsRepository(api: api);

    await repository.searchTagVideos(tag: 'game', sortType: VodSort.latest);

    expect(api.videoSortType, SearchTagResultsApiDefaults.sortTypeLatest);
  });
}

final class _FakeSearchTagResultsApi implements SearchTagResultsApi {
  String? liveSortType;
  String? videoSortType;

  @override
  Future<ApiResponseDto<SearchTagLiveListDto>> searchTagLives({
    int size = SearchTagResultsApiDefaults.pageSize,
    String sortType = SearchTagResultsApiDefaults.sortTypePopular,
    required String tags,
    int? concurrentUserCount,
    int? liveId,
  }) async {
    liveSortType = sortType;
    return const ApiResponseDto<SearchTagLiveListDto>(
      content: SearchTagLiveListDto(),
    );
  }

  @override
  Future<ApiResponseDto<SearchTagVideoListDto>> searchTagVideos({
    int size = SearchTagResultsApiDefaults.pageSize,
    String sortType = SearchTagResultsApiDefaults.sortTypePopular,
    required String tag,
    int? start,
  }) async {
    videoSortType = sortType;
    return const ApiResponseDto<SearchTagVideoListDto>(
      content: SearchTagVideoListDto(),
    );
  }
}
