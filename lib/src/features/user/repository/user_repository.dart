import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../common/constants/api.dart';
import '../model/user.dart';

part 'user_repository.g.dart';

@RestApi(baseUrl: ApiUrl.userStatus)
abstract class UserRepository {
  factory UserRepository(Dio dio, {String baseUrl}) = _UserRepository;

  @GET('')
  Future<User?> getUser();
}
