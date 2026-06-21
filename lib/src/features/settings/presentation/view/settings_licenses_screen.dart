import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../core/tv/back/back.dart';
import '../../../../core/ui/ui.dart';
import '../settings_screen_design.dart';
import '../settings_screen_string.dart';
import 'sections/licenses/settings_license_browser.dart';
import 'sections/licenses/settings_license_loader.dart';

class SettingsLicensesScreen extends HookWidget {
  const SettingsLicensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final licensesFuture = useMemoized(loadSettingsLicenseItems);
    final licensesSnapshot = useFuture(licensesFuture);
    final licenses = licensesSnapshot.data;

    return TvScaffold(
      backController: TvBackController(
        onBack: () => _popOrSettings(context),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
          SettingsScreenDesign.horizontalPadding,
          SettingsScreenDesign.headerTopPadding,
          SettingsScreenDesign.horizontalPadding,
          SettingsScreenDesign.listVerticalPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TvListHeader(
              text: SettingsScreenString.appInfoOpenSourceLicensesTitle,
              leading: Icon(Icons.article_outlined),
            ),
            const SizedBox(height: SettingsScreenDesign.licensesContentTopGap),
            Expanded(
              child: licenses == null
                  ? const ContentStateView.loading(
                      message: SettingsScreenString.loading,
                    )
                  : licenses.isEmpty
                  ? const Center(
                      child: Text(SettingsScreenString.noLicenseNotices),
                    )
                  : SettingsLicenseBrowser(licenses: licenses),
            ),
          ],
        ),
      ),
    );
  }
}

void _popOrSettings(BuildContext context) {
  if (context.canPop()) {
    context.pop();
    return;
  }

  context.go(AppRoute.settings.path);
}
