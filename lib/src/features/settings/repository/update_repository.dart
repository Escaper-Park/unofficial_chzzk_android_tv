import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/constants/api.dart';

part 'update_repository.g.dart';

enum ABI {
  v7a('v7a'),
  v8a('v8a'),
  any('any');

  final String abi;

  const ABI(this.abi);
}

@riverpod
UpdateRepository updateRepository(UpdateRepositoryRef ref) =>
    UpdateRepository();

class UpdateRepository {
  final Dio _dio = Dio();

  Future<dynamic> getLatestVersion() async {
    final response = await _dio.get(
      APIUrl.latestApp(),
    );

    if (response.statusCode == 200) {
      return response.data;
    } else {
      return 'error';
    }
  }

  Future<List<ABI>> getDeviceAbi() async {
    final deviceInfo = DeviceInfoPlugin();
    final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    final List<String> supportedAbis = androidInfo.supportedAbis;

    final bool containsV7A = supportedAbis.any((abi) => abi.contains('v7a'));
    final bool containsV8A = supportedAbis.any((abi) => abi.contains('v8a'));

    if (containsV7A && containsV8A) {
      return [ABI.v7a, ABI.v8a];
    } else if (containsV7A) {
      return [ABI.v7a];
    } else if (containsV8A) {
      return [ABI.v8a];
    } else {
      return [ABI.any];
    }
  }

  // Future<void> updateApp() async {}
  // Future<File> _downloadApk() async {}
  // Future<void> _installApk() async {}
}
