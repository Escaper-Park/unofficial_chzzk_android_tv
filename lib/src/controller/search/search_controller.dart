import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/channel/channel.dart';
import '../../service/recommendation/recommend_repository.dart';
import '../../service/search/search_repository.dart';

part 'search_controller.g.dart';

@riverpod
class CurrentSearchController extends _$CurrentSearchController {
  @override
  Channel? build() {
    return null;
  }

  void setCurrentChannel(Channel channel) {
    state = channel;
  }
}

@riverpod
class SearchResultsController extends _$SearchResultsController {
  @override
  FutureOr<List<Channel>?> build() async {
    return await ref.watch(recommendRepositoryProvider).getRecommendChannels();
  }

  Future<void> searchChannel(String keyword) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final results = await ref
          .watch(searchRepositoryProvider)
          .searchChannel(keyword: keyword);

      return results;
    });
  }
}
