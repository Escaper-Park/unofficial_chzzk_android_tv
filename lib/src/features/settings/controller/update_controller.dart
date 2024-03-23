import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repository/update_repository.dart';

part 'update_controller.g.dart';

@riverpod
class UpdateController extends _$UpdateController {
  @override
  void build() {
    return;
  }

  Future<String?> checkUpdate() async {
    final latest = await ref.watch(updateRepositoryProvider).getLatestVersion();

    if (latest != 'error') {
      return latest['tag_name'];
    } else {
      return 'error';
    }
  }

  Future<List<ABI>> findSupportedABI() async {
    return await ref.watch(updateRepositoryProvider).getDeviceAbi();
  }
}
