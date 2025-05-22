import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../common/constants/api.dart';

part 'update_repository.g.dart';

@RestApi(baseUrl: BaseUrl.githubLatestRelease)
abstract class UpdateRepository {
  factory UpdateRepository(Dio dio, {String baseUrl}) = _UpdateRepository;

  @GET('')
  Future<dynamic> getLatestVersion();
}
