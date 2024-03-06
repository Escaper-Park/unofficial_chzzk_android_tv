import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../auth/controller/auth_controller.dart';
import '../../channel/model/channel.dart';
import '../repository/search_repository.dart';

part 'search_controller.g.dart';

@riverpod
class SearchController extends _$SearchController {
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
  Options? _options;

  @override
  FutureOr<List<Channel>?> build({required String keyword}) async {
    final auth = await ref.watch(authControllerProvider.future);

    _options = auth?.getOptions();

    return await searchChannel(keyword);
  }

  Future<List<Channel>?> searchChannel(String keyword) async {
    return await ref
        .watch(searchRepositoryProvider)
        .searchChannels(keyword: keyword, options: _options);
  }
}
