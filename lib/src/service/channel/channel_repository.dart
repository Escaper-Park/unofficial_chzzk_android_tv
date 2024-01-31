import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../constants/api.dart';
import '../../model/channel/channel.dart';

part 'channel_repository.g.dart';

@riverpod
ChannelRepository channelRepository(ChannelRepositoryRef ref) =>
    ChannelRepository();

class ChannelRepository {
  final Dio _dio = Dio();

  Future<Channel?> getChannel(String channelId) async {
    final url = APIUrl.channel(channelId);

    final response = await _dio.get(url);

    return Channel.fromJson(response.data['content']);
  }
}
