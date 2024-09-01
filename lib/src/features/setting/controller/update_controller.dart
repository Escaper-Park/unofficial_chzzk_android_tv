import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/dio/dio_client.dart';
import '../repository/update_repository.dart';

part 'update_controller.g.dart';

@riverpod
class UpdateController extends _$UpdateController {
  late UpdateRepository _repository;

  /// (tag_name, body)
  @override
  Future<(String, String)> build() async {
    final Dio dio = Dio();
    _repository = UpdateRepository(dio);

    return await checkUpdateAndGetLatestVersion();
  }

  Future<(String, String)> checkUpdateAndGetLatestVersion() async {
    final response = await _repository.getLatestVersion().catchError((_) {
      return ('error', 'error');
    });

    if (response != null) {
      return (response['tag_name'] as String, response['body'] as String);
    }

    return ('error', 'error');
  }
}
