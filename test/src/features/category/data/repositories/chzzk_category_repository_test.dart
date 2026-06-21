import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/network/network.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/data/data_sources/category_api.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/data/data_sources/category_api_contract.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/data/dtos/category_dtos.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/data/repositories/chzzk_category_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/failures/category_failure.dart';

void main() {
  group('ChzzkCategoryRepository', () {
    test('uses empty fallbacks when category API content is null', () async {
      const categoryType = 'GAME';
      const categoryId = 'missing-category';
      const repository = ChzzkCategoryRepository(
        api: _NullContentCategoryApi(),
      );

      final categories = await repository.fetchCategories();
      final followingCategories = await repository.fetchFollowingCategories();
      final info = await repository.fetchCategoryInfo(
        categoryType: categoryType,
        categoryId: categoryId,
      );
      final lives = await repository.fetchCategoryLives(
        categoryType: categoryType,
        categoryId: categoryId,
      );
      final videos = await repository.fetchCategoryVideos(
        categoryType: categoryType,
        categoryId: categoryId,
      );

      expect(categories.items, isEmpty);
      expect(categories.cursor, isNull);
      expect(categories.size, 0);
      expect(followingCategories, isEmpty);
      expect(info.categoryType, categoryType);
      expect(info.categoryId, categoryId);
      expect(info.title, categoryId);
      expect(info.openLiveCount, 0);
      expect(info.concurrentUserCount, 0);
      expect(lives.items, isEmpty);
      expect(lives.cursor, isNull);
      expect(lives.size, 0);
      expect(videos.items, isEmpty);
      expect(videos.cursor, isNull);
      expect(videos.size, 0);
    });

    test('wraps category mutation failures', () async {
      const followRepository = ChzzkCategoryRepository(
        api: _NullContentCategoryApi(failFollow: true),
      );
      const unfollowRepository = ChzzkCategoryRepository(
        api: _NullContentCategoryApi(failUnfollow: true),
      );

      await expectLater(
        followRepository.followCategory(
          categoryType: 'GAME',
          categoryId: 'category-a',
        ),
        throwsA(isA<CategoryMutationFailure>()),
      );
      await expectLater(
        unfollowRepository.unfollowCategory(
          categoryType: 'GAME',
          categoryId: 'category-a',
        ),
        throwsA(isA<CategoryMutationFailure>()),
      );
    });
  });
}

final class _NullContentCategoryApi implements CategoryApi {
  const _NullContentCategoryApi({
    this.failFollow = false,
    this.failUnfollow = false,
  });

  final bool failFollow;
  final bool failUnfollow;

  @override
  Future<ApiResponseDto<CategoryListDto>> getCategories({
    int size = CategoryApiDefaults.pageSize,
    String? categoryId,
    String? categoryType,
    int? concurrentUserCount,
    int? openLiveCount,
  }) async {
    return const ApiResponseDto<CategoryListDto>();
  }

  @override
  Future<ApiResponseDto<CategoryInfoDto>> getCategoryInfo({
    required String categoryType,
    required String categoryId,
  }) async {
    return const ApiResponseDto<CategoryInfoDto>();
  }

  @override
  Future<ApiResponseDto<CategoryLiveListDto>> getCategoryLives({
    required String categoryType,
    required String categoryId,
    int size = CategoryApiDefaults.pageSize,
    int? concurrentUserCount,
    int? liveId,
  }) async {
    return const ApiResponseDto<CategoryLiveListDto>();
  }

  @override
  Future<ApiResponseDto<CategoryVideoListDto>> getCategoryVideos({
    required String categoryType,
    required String categoryId,
    int size = CategoryApiDefaults.pageSize,
    int? publishDateAt,
    int? readCount,
  }) async {
    return const ApiResponseDto<CategoryVideoListDto>();
  }

  @override
  Future<ApiResponseDto<FollowingCategoryListDto>>
  getFollowingCategories() async {
    return const ApiResponseDto<FollowingCategoryListDto>();
  }

  @override
  Future<void> followCategory({
    required String categoryType,
    required String categoryId,
  }) async {
    if (failFollow) {
      throw StateError('failed follow');
    }
  }

  @override
  Future<void> unfollowCategory({
    required String categoryType,
    required String categoryId,
  }) async {
    if (failUnfollow) {
      throw StateError('failed unfollow');
    }
  }
}
