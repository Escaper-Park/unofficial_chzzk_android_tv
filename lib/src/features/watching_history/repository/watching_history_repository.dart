import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../common/constants/api.dart';

import '../model/watching_history_response.dart';

part 'watching_history_repository.g.dart';

@RestApi(baseUrl: BaseUrl.chzzkService)
abstract class WatchingHistoryRepository {
  factory WatchingHistoryRepository(Dio dio, {String baseUrl}) =
      _WatchingHistoryRepository;

  @GET(ChzzkServiceApi.watchingHistory)
  Future<WatchingHistoryResponse?> getWatchingHistories({
    @Query('size') required int size,
    @Query('lastTime') required int? lastTime,
  });
}
