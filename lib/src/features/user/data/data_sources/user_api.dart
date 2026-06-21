import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/network/network.dart';
import '../dtos/user_dtos.dart';
import 'user_api_contract.dart';

part 'user_api.g.dart';

@RestApi(baseUrl: ChzzkApiBaseUrls.comm)
abstract class UserApi {
  factory UserApi(Dio dio, {String? baseUrl}) = _UserApi;

  @GET(UserApiPaths.userStatus)
  Future<ApiResponseDto<UserStatusDto>> getUserStatus();

  @GET(UserApiPaths.privateUserBlocks)
  Future<ApiResponseDto<List<String>>> getPrivateUserBlocks();
}
