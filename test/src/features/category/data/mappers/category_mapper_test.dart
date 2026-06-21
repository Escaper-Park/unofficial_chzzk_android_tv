import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/data/dtos/category_dtos.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/data/mappers/category_mapper.dart';

void main() {
  group('Category mapper', () {
    test('maps category list dto into domain page', () {
      const dto = CategoryListDto(
        data: [
          CategoryDto(
            categoryId: 'game',
            categoryType: 'GAME',
            categoryValue: 'Game',
            posterImageUrl: 'https://example.com/poster.png',
            openLiveCount: 12,
            concurrentUserCount: 345,
          ),
        ],
        page: CategoryPageDto(
          next: CategoryPageNextDto(
            categoryId: 'next',
            concurrentUserCount: 123,
            openLiveCount: 4,
          ),
        ),
        size: 18,
      );

      final page = categoryPageFromDto(dto);

      expect(page.size, 18);
      expect(page.items, hasLength(1));
      expect(page.items.single.categoryId, 'game');
      expect(page.items.single.categoryType, 'GAME');
      expect(page.items.single.title, 'Game');
      expect(
        page.items.single.posterImageUrl,
        'https://example.com/poster.png',
      );
      expect(page.items.single.openLiveCount, 12);
      expect(page.items.single.concurrentUserCount, 345);
      expect(page.cursor?.categoryId, 'next');
      expect(page.cursor?.concurrentUserCount, 123);
      expect(page.cursor?.openLiveCount, 4);
    });

    test('maps category info dto into domain info', () {
      const dto = CategoryInfoDto(
        categoryId: 'game',
        categoryType: 'GAME',
        categoryValue: 'Game',
        posterImageUrl: 'https://example.com/poster.png',
        openLiveCount: 7,
        concurrentUserCount: 890,
        tags: ['tag'],
        following: true,
      );

      final info = categoryInfoFromDto(dto);

      expect(info.categoryId, 'game');
      expect(info.categoryType, 'GAME');
      expect(info.title, 'Game');
      expect(info.openLiveCount, 7);
      expect(info.concurrentUserCount, 890);
      expect(info.tags, ['tag']);
      expect(info.following, true);
    });

    test('parses category info with object drops campaign list', () {
      final dto = CategoryInfoDto.fromJson({
        'categoryId': 'League_of_Legends',
        'categoryType': 'GAME',
        'categoryValue': 'League of Legends',
        'posterImageUrl': 'https://example.com/lol.png',
        'openLiveCount': 259,
        'concurrentUserCount': 46475,
        'tags': ['AOS', 'MOBA'],
        'following': false,
        'dropsCampaignList': [
          {'campaignNo': 1174, 'title': 'Drops'},
        ],
      });

      final info = categoryInfoFromDto(dto);

      expect(info.categoryId, 'League_of_Legends');
      expect(info.categoryType, 'GAME');
      expect(info.title, 'League of Legends');
      expect(info.openLiveCount, 259);
      expect(info.concurrentUserCount, 46475);
      expect(info.tags, ['AOS', 'MOBA']);
    });

    test('fails fast when category list item identity is missing', () {
      expect(
        () => CategoryDto.fromJson(const <String, dynamic>{
          'categoryType': 'GAME',
          'categoryValue': 'Game',
        }),
        throwsA(isA<TypeError>()),
      );
      expect(
        () => CategoryDto.fromJson(const <String, dynamic>{
          'categoryId': 'game',
          'categoryValue': 'Game',
        }),
        throwsA(isA<TypeError>()),
      );
      expect(
        () => CategoryDto.fromJson(const <String, dynamic>{
          'categoryId': 'game',
          'categoryType': 'GAME',
        }),
        throwsA(isA<TypeError>()),
      );
    });

    test('fails fast when category info identity is missing', () {
      expect(
        () => CategoryInfoDto.fromJson(const <String, dynamic>{
          'categoryType': 'GAME',
          'categoryValue': 'Game',
        }),
        throwsA(isA<TypeError>()),
      );
      expect(
        () => CategoryInfoDto.fromJson(const <String, dynamic>{
          'categoryId': 'game',
          'categoryValue': 'Game',
        }),
        throwsA(isA<TypeError>()),
      );
      expect(
        () => CategoryInfoDto.fromJson(const <String, dynamic>{
          'categoryId': 'game',
          'categoryType': 'GAME',
        }),
        throwsA(isA<TypeError>()),
      );
    });

    test('maps following category dto into category items', () {
      const dto = FollowingCategoryListDto(
        followingList: [
          FollowingCategoryDto(
            categoryId: 'game',
            categoryType: 'GAME',
            categoryValue: 'Game',
            posterImageUrl: 'https://example.com/poster.png',
            openLiveCount: 4,
            concurrentUserCount: 56,
          ),
        ],
      );

      final items = categoryItemsFromFollowingDto(dto);

      expect(items, hasLength(1));
      expect(items.single.categoryId, 'game');
      expect(items.single.categoryType, 'GAME');
      expect(items.single.title, 'Game');
      expect(items.single.posterImageUrl, 'https://example.com/poster.png');
      expect(items.single.openLiveCount, 4);
      expect(items.single.concurrentUserCount, 56);
    });

    test('fails fast when following category identity is missing', () {
      expect(
        () => FollowingCategoryDto.fromJson(const <String, dynamic>{
          'categoryType': 'GAME',
          'categoryValue': 'Game',
        }),
        throwsA(isA<TypeError>()),
      );
      expect(
        () => FollowingCategoryDto.fromJson(const <String, dynamic>{
          'categoryId': 'game',
          'categoryValue': 'Game',
        }),
        throwsA(isA<TypeError>()),
      );
      expect(
        () => FollowingCategoryDto.fromJson(const <String, dynamic>{
          'categoryId': 'game',
          'categoryType': 'GAME',
        }),
        throwsA(isA<TypeError>()),
      );
    });

    test('maps category live list dto into domain page', () {
      const dto = CategoryLiveListDto(
        data: [
          CategoryLiveDto(
            liveId: 1,
            liveTitle: 'Live',
            liveImageUrl: 'https://example.com/live.png',
            concurrentUserCount: 20,
            liveCategoryValue: 'Game',
            watchPartyTag: 'party',
            watchPartyType: 'Normal',
            channel: CategoryChannelDto(
              channelId: 'channel',
              channelName: 'Streamer',
              verifiedMark: true,
            ),
          ),
        ],
        page: CategoryLivePageDto(
          next: CategoryLivePageNextDto(
            concurrentUserCount: 10,
            liveId: 2,
          ),
        ),
        size: 18,
      );

      final page = categoryLivePageFromDto(dto);

      expect(page.size, 18);
      expect(page.items.single.liveId, 1);
      expect(page.items.single.title, 'Live');
      expect(
        page.items.single.thumbnailImageUrl,
        'https://example.com/live.png',
      );
      expect(page.items.single.categoryValue, 'Game');
      expect(page.items.single.watchPartyTag, 'party');
      expect(page.items.single.watchPartyType, 'Normal');
      expect(page.items.single.channel?.channelId, 'channel');
      expect(page.items.single.channel?.verifiedMark, true);
      expect(page.cursor?.concurrentUserCount, 10);
      expect(page.cursor?.liveId, 2);
    });

    test('maps category video list dto into domain page', () {
      const dto = CategoryVideoListDto(
        data: [
          CategoryVideoDto(
            videoNo: 1,
            videoId: 'video',
            videoTitle: 'Video',
            videoType: 'REPLAY',
            publishDate: '2026-06-06',
            thumbnailImageUrl: 'https://example.com/video.png',
            duration: 60,
            readCount: 20,
            publishDateAt: 123,
            videoCategoryValue: 'Game',
            channel: CategoryChannelDto(
              channelId: 'channel',
              channelName: 'Streamer',
            ),
          ),
        ],
        page: CategoryVideoPageDto(
          next: CategoryVideoPageNextDto(
            publishDateAt: 456,
            readCount: 10,
          ),
        ),
        size: 18,
      );

      final page = categoryVideoPageFromDto(dto);

      expect(page.size, 18);
      expect(page.items.single.videoNo, 1);
      expect(page.items.single.videoId, 'video');
      expect(page.items.single.title, 'Video');
      expect(
        page.items.single.thumbnailImageUrl,
        'https://example.com/video.png',
      );
      expect(page.items.single.categoryValue, 'Game');
      expect(page.items.single.channel?.channelName, 'Streamer');
      expect(page.cursor?.publishDateAt, 456);
      expect(page.cursor?.readCount, 10);
    });
  });
}
