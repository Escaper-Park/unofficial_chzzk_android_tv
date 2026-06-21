import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/network/network.dart';
import '../dtos/home_dtos.dart';
import 'home_api_contract.dart';

part 'home_api.g.dart';

@RestApi(baseUrl: ChzzkApiBaseUrls.service)
// ignore: one_member_abstracts
abstract class HomeApi {
  factory HomeApi(Dio dio, {String? baseUrl}) = _HomeApi;

  @GET(HomeApiPaths.main)
  Future<ApiResponseDto<HomeMainDto>> getMain({
    @Query(HomeApiQueryKeys.slotSize)
    int slotSize = HomeApiDefaults.mainSlotSize,
  });
}
