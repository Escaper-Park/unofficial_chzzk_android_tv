import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../common/constants/api.dart';
import '../model/user.dart';

part 'user_repository.g.dart';

@RestApi(baseUrl: ApiUrl.naverGame)
abstract class UserRepository {
  factory UserRepository(Dio dio, {String baseUrl}) = _UserRepository;

  @GET(ApiUrl.userStatus)
  Future<User?> getUser();

  @GET(ApiUrl.privateUserBlocks)
  Future<List<String>> getPrivateUserBlocks();
}
