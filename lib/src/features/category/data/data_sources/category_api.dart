import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/network/network.dart';
import '../dtos/category_dtos.dart';
import 'category_api_contract.dart';

part 'category_api.g.dart';

@RestApi(baseUrl: ChzzkApiBaseUrls.service)
// ignore: one_member_abstracts
abstract class CategoryApi {
  factory CategoryApi(Dio dio, {String? baseUrl}) = _CategoryApi;

  @GET(CategoryApiPaths.categories)
  Future<ApiResponseDto<CategoryListDto>> getCategories({
    @Query(CategoryApiQueryKeys.size) int size = CategoryApiDefaults.pageSize,
    @Query(CategoryApiQueryKeys.categoryId) String? categoryId,
    @Query(CategoryApiQueryKeys.categoryType) String? categoryType,
    @Query(CategoryApiQueryKeys.concurrentUserCount) int? concurrentUserCount,
    @Query(CategoryApiQueryKeys.openLiveCount) int? openLiveCount,
  });

  @GET(CategoryApiPaths.categoryInfo)
  Future<ApiResponseDto<CategoryInfoDto>> getCategoryInfo({
    @Path(CategoryApiPathKeys.categoryType) required String categoryType,
    @Path(CategoryApiPathKeys.categoryId) required String categoryId,
  });

  @GET(CategoryApiPaths.categoryLives)
  Future<ApiResponseDto<CategoryLiveListDto>> getCategoryLives({
    @Path(CategoryApiPathKeys.categoryType) required String categoryType,
    @Path(CategoryApiPathKeys.categoryId) required String categoryId,
    @Query(CategoryApiQueryKeys.size) int size = CategoryApiDefaults.pageSize,
    @Query(CategoryApiQueryKeys.concurrentUserCount) int? concurrentUserCount,
    @Query(CategoryApiQueryKeys.liveId) int? liveId,
  });

  @GET(CategoryApiPaths.categoryVideos)
  Future<ApiResponseDto<CategoryVideoListDto>> getCategoryVideos({
    @Path(CategoryApiPathKeys.categoryType) required String categoryType,
    @Path(CategoryApiPathKeys.categoryId) required String categoryId,
    @Query(CategoryApiQueryKeys.size) int size = CategoryApiDefaults.pageSize,
    @Query(CategoryApiQueryKeys.publishDateAt) int? publishDateAt,
    @Query(CategoryApiQueryKeys.readCount) int? readCount,
  });

  @GET(CategoryApiPaths.followingCategories)
  Future<ApiResponseDto<FollowingCategoryListDto>> getFollowingCategories();

  @POST(CategoryApiPaths.categoryFollow)
  Future<void> followCategory({
    @Path(CategoryApiPathKeys.categoryType) required String categoryType,
    @Path(CategoryApiPathKeys.categoryId) required String categoryId,
  });

  @DELETE(CategoryApiPaths.categoryFollow)
  Future<void> unfollowCategory({
    @Path(CategoryApiPathKeys.categoryType) required String categoryType,
    @Path(CategoryApiPathKeys.categoryId) required String categoryId,
  });
}
