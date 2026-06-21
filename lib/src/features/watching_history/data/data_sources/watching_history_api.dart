import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/network/network.dart';
import '../dtos/watching_history_dtos.dart';
import 'watching_history_api_contract.dart';

part 'watching_history_api.g.dart';

@RestApi(baseUrl: ChzzkApiBaseUrls.service)
// ignore: one_member_abstracts
abstract class WatchingHistoryApi {
  factory WatchingHistoryApi(Dio dio, {String? baseUrl}) = _WatchingHistoryApi;

  @GET(WatchingHistoryApiPaths.watchingHistory)
  Future<ApiResponseDto<WatchingHistoryListDto>> getWatchingHistory({
    @Query(WatchingHistoryApiQueryKeys.size)
    int size = WatchingHistoryApiDefaults.pageSize,
    @Query(WatchingHistoryApiQueryKeys.lastTime) int? lastTime,
  });
}
