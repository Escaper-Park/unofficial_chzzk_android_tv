import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/presentation/models/settings_app_version.dart';

void main() {
  group('isSettingsUpdateAvailable', () {
    test('treats v-prefixed tags with build metadata as the same app version', () {
      expect(
        isSettingsUpdateAvailable(
          currentVersion: '0.4.1+1',
          latestTag: 'v0.4.1+1',
        ),
        isFalse,
      );
    });

    test('compares version segments numerically', () {
      expect(
        isSettingsUpdateAvailable(
          currentVersion: '0.4.9+1',
          latestTag: 'v0.4.10',
        ),
        isTrue,
      );
    });

    test('does not mark older releases as available updates', () {
      expect(
        isSettingsUpdateAvailable(
          currentVersion: '0.4.1+1',
          latestTag: 'v0.4.0',
        ),
        isFalse,
      );
    });

    test('treats invalid latest tags as no update', () {
      expect(
        isSettingsUpdateAvailable(
          currentVersion: '0.4.1+1',
          latestTag: 'release-latest',
        ),
        isFalse,
      );
    });
  });
}
