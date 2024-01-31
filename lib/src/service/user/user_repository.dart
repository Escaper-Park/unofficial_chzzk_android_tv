import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../constants/api.dart';
import '../../model/user/user.dart';

part 'user_repository.g.dart';

@riverpod
UserRepository userRepository(UserRepositoryRef ref) => UserRepository();

class UserRepository {
  final Dio _dio = Dio();

  Future<User?> getUser({required Options? options}) async {
    final url = APIUrl.user();

    final response = await _dio.get(url, options: options);

    return User.fromJson(response.data['content']);
  }
}
