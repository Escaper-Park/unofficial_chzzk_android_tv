import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../../../common/constants/api.dart';
import '../model/live.dart';

part 'live_repository.g.dart';

enum LiveSortType {
  popular('POPULAR'),
  latest('LATEST');

  final String value;

  const LiveSortType(this.value);
}

@RestApi(baseUrl: ApiUrl.chzzk)
abstract class LiveRepository {
  factory LiveRepository(Dio dio, {String baseUrl}) = _LiveRepository;

  @GET(ApiUrl.allLives)
  Future<LiveResponse?> getLiveResponse({
    @Query('size') required int size,
    @Query('sortType') required String sortType,
    @Query('concurrentUserCount') required int? concurrentUserCount,
    @Query('liveId') required int? liveId,
  });

  @GET('${ApiUrl.liveDetail}/{channelId}/live-detail')
  Future<LiveDetail?> getLiveDetail(
      {@Path('channelId') required String channelId});

  @GET('${ApiUrl.liveStatus}/{channelId}/live-status')
  Future<LiveStatus?> getLiveStatus(
      {@Path('channelId') required String channelId});
}
