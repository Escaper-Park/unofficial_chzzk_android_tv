import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../../../common/constants/api.dart';
import '../../following/model/following.dart';
import '../../live/model/live.dart';
import '../../vod/model/vod.dart';
import '../model/category.dart';

part 'category_repository.g.dart';

enum CategorySortType {
  live('POPULAR'),
  vod('VOD'),
  popularClip('POPULAR'),
  recentClip('RECENT');

  final String value;

  const CategorySortType(this.value);
}

@RestApi(baseUrl: ApiUrl.chzzkService)
abstract class CategoryRepository {
  factory CategoryRepository(Dio dio, {String baseUrl}) = _CategoryRepository;

  @GET('${ApiUrl.category}/live')
  Future<CategoryResponse?> getCategories({
    @Query('size') required int size,
    @Query('categoryId') required String? categoryId,
    @Query('concurrentUserCount') required int? concurrentUserCount,
    @Query('openLiveCount') required int? openLiveCount,
  });

  @GET('${ApiUrl.categoryLives}/{categoryType}/{categoryId}/lives')
  Future<LiveResponse?> getCategoryLives({
    @Path('categoryType') required String categoryType,
    @Path('categoryId') required String categoryId,
    @Query('size') required int size,
    @Query('concurrentUserCount') required int? concurrentUserCount,
    @Query('liveId') required int? liveId,
  });

  @GET('${ApiUrl.categoryLives}/{categoryType}/{categoryId}/videos')
  Future<CategoryVodResponse?> getCategoryVods({
    @Path('categoryType') required String categoryType,
    @Path('categoryId') required String categoryId,
    @Query('size') required int size,
    @Query('publishDateAt') required int? publishDateAt,
    @Query('readCount') required int? readCount,
  });

  @GET(ApiUrl.followingCategories)
  Future<FollowingCategoryResponse?> getFollowingCategories();

  @POST('${ApiUrl.category}/{categoryType}/{categoryId}/follow')
  Future<void> follow({
    @Path('categoryType') required String categoryType,
    @Path('categoryId') required String categoryId,
  });

  @DELETE('${ApiUrl.category}/{categoryType}/{categoryId}/follow')
  Future<void> unfollow({
    @Path('categoryType') required String categoryType,
    @Path('categoryId') required String categoryId,
  });
}
