import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/dio/dio_client.dart';
import '../model/channel.dart';
import '../repository/channel_repository.dart';

part 'channel_controller.g.dart';

@riverpod

/// Channe screen's current selected channel.
class ChannelController extends _$ChannelController {
  late ChannelRepository _repository;

  @override
  FutureOr<Channel?> build({required String routeName}) async {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = ChannelRepository(dio);

    return null;
  }

  /// Get channel and set current state.
  Future<void> setCurrentChannel({required String channelId}) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(
      () async {
        final response = await _repository.getChannel(channelId: channelId);

        return response;
      },
    );
  }

  // Future<Channel>
}
