import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:unofficial_chzzk_android_tv/src/features/client/repository/client_repository.dart';

import '../../channel/model/channel.dart';

part 'search_controller.g.dart';

@riverpod
class SearchController extends _$SearchController {
  @override
  FutureOr<Channel?> build() async {
    return null;
  }

  Future<void> setCurrentChannel(Channel channel) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      return channel;
    });
  }
}

@riverpod
class SearchResultsController extends _$SearchResultsController {
  @override
  FutureOr<List<Channel>?> build() {
    return null;
  }

  Future<void> search(String keyword) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final results =
          await ref.read(clientRepositoryProvider.notifier).search(keyword);

      return results;
    });
  }
}
