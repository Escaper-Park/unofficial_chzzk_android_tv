import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../common/constants/api.dart';
import '../model/clip.dart';

part 'clip_repository.g.dart';

enum ClipSortType {
  popular('POPULAR'),
  recent('RECENT');

  final String value;

  const ClipSortType(this.value);
}

@RestApi(baseUrl: ApiUrl.chzzkService)
abstract class ClipRepository {
  factory ClipRepository(Dio dio, {String baseUrl}) = _ClipRepository;

  @GET('${ApiUrl.channelClips}/{channelId}/clips')
  Future<ClipResponse?> getChannelClips({
    @Path('channelId') required String channelId,
    @Query('filterType') String filterType = 'ALL',
    @Query('orderType') String orderType = 'POPULAR',
    @Query('size') int size = 15,
    @Query('clipUID') String? clipUID,
    @Query('readCount') int? readCount,
  });

  @GET('${ApiUrl.categoryClips}/{CategoryType}/{categoryId}/clips')
  Future<ClipResponse?> getCategoryClips({
    @Path('CategoryType') required String categoryType,
    @Path('categoryId') required String categoryId,
    @Query('filterType') String filterType = 'ALL',
    @Query('orderType') String orderType = 'POPULAR',
    @Query('size') int size = 15,
    @Query('clipUID') String? clipUID,
    @Query('readCount') int? readCount,
  });

  @GET(ApiUrl.popularClips)
  Future<PopularClipResponse?> getPopularClips({
    @Query('next') required String? next,
  });
}
