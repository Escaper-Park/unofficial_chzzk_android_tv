import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repository/update_repository.dart';

part 'update_controller.g.dart';

@riverpod
class UpdateController extends _$UpdateController {
  late UpdateRepository _repository;

  @override
  FutureOr<(String, String)> build() async {
    /// (tag_name, body)
    final Dio dio = Dio();
    _repository = UpdateRepository(dio);

    return await _checkUpdateAndGetLatestVersion();
  }

  Future<(String, String)> _checkUpdateAndGetLatestVersion() async {
    final response = await _repository.getLatestVersion().catchError((_) {
      return ('error', 'error');
    });

    if (response != null) {
      return (response['tag_name'] as String, response['body'] as String);
    }

    return ('error', 'error');
  }
}
