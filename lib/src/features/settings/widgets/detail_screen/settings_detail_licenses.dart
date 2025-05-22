import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide LicensePage;

import '../../../../common/widgets/ui/ui_widgets.dart' show CenteredText;
import '../settings_widgets.dart';

class SettingsDetailLicenses extends StatelessWidget {
  const SettingsDetailLicenses({
    super.key,
    required this.settingMenuFSN,
    required this.licenseListViewFSN,
    required this.licenseDetailFSN,
  });

  final FocusScopeNode settingMenuFSN;
  final FocusScopeNode licenseListViewFSN;
  final FocusScopeNode licenseDetailFSN;

  @override
  Widget build(BuildContext context) {
    final Future<LicenseData> licenses = LicenseRegistry.licenses
        .fold<LicenseData>(
          LicenseData(),
          (LicenseData prev, LicenseEntry license) => prev..addLicense(license),
        )
        .then((LicenseData licenseData) => licenseData..sortPackages());

    return FutureBuilder<LicenseData>(
      future: licenses,
      builder: (BuildContext context, AsyncSnapshot<LicenseData> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.active:
          case ConnectionState.waiting:
            return CenteredText(
              text: '로딩중 ...',
              fontSize: 14.0,
            );
          case ConnectionState.done:
            if (snapshot.hasError) {
              return CenteredText(
                text: snapshot.error.toString(),
                fontSize: 11.0,
              );
            }

            final licenseData = snapshot.data!;

            return CustomLicensePage(
              licenseData: licenseData,
              settingMenuFSN: settingMenuFSN,
              licenseListViewFSN: licenseListViewFSN,
              licenseDetailFSN: licenseDetailFSN,
            );
        }
      },
    );
  }
}
