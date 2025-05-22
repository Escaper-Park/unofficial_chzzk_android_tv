import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/dio/dio_client.dart';
import '../repository/user_repository.dart';

part 'private_user_blocks_controller.g.dart';

@riverpod
class PrivateUserBlocksController extends _$PrivateUserBlocksController {
  late UserRepository _repository;

  @override
  FutureOr<List<String>> build() async {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = UserRepository(dio);

    return await fetchPrivateUserBlocks();
  }

  Future<List<String>> fetchPrivateUserBlocks() async {
    final List<String> response =
        await _repository.getPrivateUserBlocks().catchError((_) {
      return [''];
    });

    return response;
  }
}
