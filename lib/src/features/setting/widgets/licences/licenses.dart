import 'package:flutter/material.dart';

import '../../../../common/constants/app_version.dart';

class OpenSourceLicencesScreen extends StatelessWidget {
  const OpenSourceLicencesScreen({super.key, required this.settingMenuFSN});

  final FocusScopeNode settingMenuFSN;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        settingMenuFSN.requestFocus();
      },
      child: const LicensePage(
        applicationName: 'UnOfficial Chzzk for Android TV',
        applicationVersion: AppVersion.version,
      ),
    );
  }
}
