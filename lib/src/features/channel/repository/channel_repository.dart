import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../common/constants/api.dart';
import '../model/channel.dart';

part 'channel_repository.g.dart';

@RestApi(baseUrl: ApiUrl.channel)
abstract class ChannelRepository {
  factory ChannelRepository(Dio dio, {String baseUrl}) = _ChannelRepository;

  @GET('/{channelId}')
  Future<Channel?> getChannel({@Path('channelId') required String channelId});

  @POST('/{channelId}/follow')
  Future<void> follow({@Path('channelId') required String channelId});

  @DELETE('/{channelId}/follow')
  Future<void> unFollow({@Path('channelId') required String channelId});
}

// TODO : Category Controller