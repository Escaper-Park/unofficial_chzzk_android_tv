import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../common/constants/api.dart' show BaseUrl, NaverGameApi;
import '../model/user.dart';

part 'user_repository.g.dart';

@RestApi(baseUrl: BaseUrl.naverGame)
abstract class UserRepository {
  factory UserRepository(Dio dio, {String baseUrl}) = _UserRepository;

  @GET(NaverGameApi.userStatus)
  Future<User?> getUser();

  @GET(NaverGameApi.privateUserBlocks)
  Future<List<String>> getPrivateUserBlocks();
}
