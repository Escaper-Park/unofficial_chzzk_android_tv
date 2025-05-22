import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../common/constants/api.dart';
import '../model/channel.dart';

part 'channel_repository.g.dart';

@RestApi(baseUrl: BaseUrl.chzzkService)
abstract class ChannelRepository {
  factory ChannelRepository(Dio dio, {String baseUrl}) = _ChannelRepository;

  @GET('${ChzzkServiceApi.channels}/{channelId}')
  Future<Channel?> getChannel({
    @Path('channelId') required String channelId,
  });

  @POST('${ChzzkServiceApi.channelFollow}/{channelId}/follow')
  Future<void> follow({
    @Path('channelId') required String channelId,
  });

  @DELETE('${ChzzkServiceApi.channelFollow}/{channelId}/follow')
  Future<void> unFollow({
    @Path('channelId') required String channelId,
  });

  @DELETE('${ChzzkServiceApi.channelFollow}/{channelId}/notification')
  Future<void> deleteNotification({
    @Path('channelId') required String channelId,
  });
}
