import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/channel/channel.dart';
import '../../model/live/live.dart';
import '../../service/live/live_repository.dart';
import '../../service/popular/popular_repository.dart';
import '../auth/auth_controller.dart';

part 'popular_controller.g.dart';

@riverpod
class PopularController extends _$PopularController {
  Options? _options;

  @override
  FutureOr<List<LiveDetail>?> build() async {
    final auth = ref.watch(authControllerProvider).value;

    _options = auth?.getOptions();

    return fetchPopularLives();
  }

  /// Get LiveDetail of populars from channels.
  Future<List<LiveDetail>?> fetchPopularLives() async {
    final List<Channel>? channels =
        await ref.watch(popularRepositoryProvider).getPopularChannels();

    if (channels != null) {
      return await ref.watch(liveRepositoryProvider).getLiveDetails(
            channels: channels,
            options: _options,
          );
    }

    return null;
  }
}
