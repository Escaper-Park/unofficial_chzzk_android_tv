import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/constants/api.dart';
import '../model/user.dart';

part 'user_repository.g.dart';

@riverpod
UserRepository userRepository(UserRepositoryRef ref) => UserRepository();

class UserRepository {
  final Dio _dio = Dio(
    BaseOptions(
      headers: {
        'User-Agent':
            'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3',
      },
    ),
  );

  Future<User?> getUser({required Options? options}) async {
    final url = APIUrl.user();

    final response = await _dio.get(url, options: options);

    return User.fromJson(response.data['content']);
  }
}
