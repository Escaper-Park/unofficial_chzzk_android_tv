import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../common/constants/api.dart';
import '../model/clip_response.dart';

part 'clip_repository.g.dart';

@RestApi(baseUrl: BaseUrl.chzzkService)
abstract class ClipRepository {
  factory ClipRepository(Dio dio, {String baseUrl}) = _ClipRepository;

  @GET('${ChzzkServiceApi.channelClips}/{channelId}/clips')
  Future<ChannelClipResponse?> getChannelClipResponse({
    @Path('channelId') required String channelId,
    @Query('filterType') required String filterType,
    @Query('orderType') required String orderType,
    @Query('size') required int size,
    @Query('clipUID') required String? clipUID,
    @Query('readCount') required int? readCount,
  });

  @GET('${ChzzkServiceApi.categoryClips}/{categoryType}/{categoryId}/clips')
  Future<CategoryClipResponse?> getCategoryClipResponse({
    @Path('categoryType') required String categoryType,
    @Path('categoryId') required String categoryId,
    @Query('filterType') required String filterType,
    @Query('orderType') required String orderType,
    @Query('size') required int size,
    @Query('clipUID') required String? clipUID,
    @Query('readCount') required int? readCount,
  });

  @GET(ChzzkServiceApi.popularClips)
  Future<PopularClipResponse?> getPopularClipResponse({
    @Query('filtertType') required String filterType,
    @Query('orderType') required String orderType,
    @Query('next') required String? next,
  });
}
