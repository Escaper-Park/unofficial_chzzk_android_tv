import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/app/app_build_info.dart';

void main() {
  test('matches pubspec version', () {
    final versionLine = File('pubspec.yaml')
        .readAsLinesSync()
        .firstWhere((line) => line.startsWith('version: '));

    expect(
      AppBuildInfo.version,
      versionLine.substring('version: '.length).trim(),
    );
  });
}
