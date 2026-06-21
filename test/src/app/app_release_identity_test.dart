import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

const _androidPackageIdentity = 'com.escaperbgp.unofficial_chzzk_android_tv';
const _androidPackagePath =
    'android/app/src/main/kotlin/com/escaperbgp/unofficial_chzzk_android_tv';

void main() {
  test('android namespace and application id match the release identity', () {
    final buildGradle = File('android/app/build.gradle.kts').readAsStringSync();

    expect(
      buildGradle,
      contains('namespace = "$_androidPackageIdentity"'),
    );
    expect(
      buildGradle,
      contains('applicationId = "$_androidPackageIdentity"'),
    );
  });

  test('kotlin entry points use the matching package declaration and path', () {
    for (final fileName in ['MainActivity.kt', 'AuthCookieChannel.kt']) {
      final file = File('$_androidPackagePath/$fileName');

      expect(file.existsSync(), isTrue, reason: file.path);
      expect(
        file.readAsStringSync(),
        startsWith('package $_androidPackageIdentity'),
      );
    }
  });
}
