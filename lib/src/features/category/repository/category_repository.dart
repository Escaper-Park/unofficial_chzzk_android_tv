import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../common/constants/api.dart' show BaseUrl, ChzzkServiceApi;

import '../../live/model/live_response.dart';
import '../../vod/model/vod_response.dart';
import '../model/category.dart';
import '../model/category_response.dart';

part 'category_repository.g.dart';

@RestApi(baseUrl: BaseUrl.chzzkService)
abstract class CategoryRepository {
  factory CategoryRepository(Dio dio, {String baseUrl}) = _CategoryRepository;

  @GET(ChzzkServiceApi.categories)
  Future<CategoryResponse?> getCategories({
    @Query('categoryId') required String? categoryId,
    @Query('concurrentUserCount') required int? concurrentUserCount,
    @Query('openLiveCount') required int? openLiveCount,
    @Query('size') required int size,
  });

  @GET('${ChzzkServiceApi.categoryInfo}/{categoryType}/{categoryId}/info')
  Future<Category?> getCategoryInfo({
    @Path('categoryType') required String categoryType,
    @Path('categoryId') required String categoryId,
  });

  @GET('${ChzzkServiceApi.categoryLives}/{categoryType}/{categoryId}/lives')
  Future<LiveResponse?> getCategoryLives({
    @Path('categoryType') required String categoryType,
    @Path('categoryId') required String categoryId,
    @Query('concurrentUserCount') required int? concurrentUserCount,
    @Query('liveId') required int? liveId,
    @Query('size') required int? size,
  });

  @GET('${ChzzkServiceApi.categoryVods}/{categoryType}/{categoryId}/videos')
  Future<CategoryVodResponse?> getCategoryVods({
    @Path('categoryType') required String categoryType,
    @Path('categoryId') required String categoryId,
    @Query('publishDateAt') required int? publishDateAt,
    @Query('readCount') required int? readCount,
    @Query('size') required int? size,
  });

  @GET(ChzzkServiceApi.followingCategories)
  Future<FollowingCategoryResponse?> getFollowingCategories();

  @POST('${ChzzkServiceApi.categoryFollow}/{categoryType}/{categoryId}/follow')
  Future<void> follow({
    @Path('categoryType') required String categoryType,
    @Path('categoryId') required String categoryId,
  });

  @DELETE(
    '${ChzzkServiceApi.categoryFollow}/{categoryType}/{categoryId}/follow',
  )
  Future<void> unFollow({
    @Path('categoryType') required String categoryType,
    @Path('categoryId') required String categoryId,
  });
}
