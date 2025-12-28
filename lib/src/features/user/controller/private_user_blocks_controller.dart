import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repository/user_repository_wrapper.dart';

part 'private_user_blocks_controller.g.dart';

@riverpod
class PrivateUserBlocksController extends _$PrivateUserBlocksController {
  late UserRepositoryWrapper _repository;

  @override
  FutureOr<List<String>> build() async {
    _repository = ref.watch(userRepositoryWrapperProvider);

    return await fetchPrivateUserBlocks();
  }

  Future<List<String>> fetchPrivateUserBlocks() async {
    final result = await _repository.getPrivateUserBlocks();

    return result.when(
      success: (data) => data,
      failure: (_) => [''],
    );
  }
}
