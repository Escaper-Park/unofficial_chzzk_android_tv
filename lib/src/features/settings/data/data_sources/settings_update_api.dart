import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/network/network.dart';
import '../dtos/settings_update_dtos.dart';
import 'settings_update_api_contract.dart';

part 'settings_update_api.g.dart';

@RestApi(baseUrl: ChzzkApiBaseUrls.github)
// ignore: one_member_abstracts
abstract class SettingsUpdateApi {
  factory SettingsUpdateApi(Dio dio, {String? baseUrl}) = _SettingsUpdateApi;

  @GET(SettingsUpdateApiPaths.latestRelease)
  Future<SettingsReleaseDto> getLatestRelease();
}
