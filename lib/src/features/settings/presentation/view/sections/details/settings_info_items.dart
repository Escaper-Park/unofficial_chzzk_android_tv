import 'package:flutter/material.dart';

import '../../../../../../app/app_build_info.dart';
import '../../../../domain/entities/settings_preferences.dart';
import '../../../settings_screen_string.dart';

final class SettingsInfoItem {
  const SettingsInfoItem({
    required this.title,
    required this.description,
    required this.icon,
    this.action,
    this.pressAction,
    this.plainText = false,
  });

  final String title;
  final String description;
  final IconData icon;
  final String? action;
  final SettingsInfoItemAction? pressAction;
  final bool plainText;
}

enum SettingsInfoItemAction {
  openSourceLicenses,
}

List<SettingsInfoItem> settingsInfoItemsFor(SettingsCategoryId category) {
  return switch (category) {
    SettingsCategoryId.faq => const [
      SettingsInfoItem(
        title: SettingsScreenString.faqPlaybackNotStartingTitle,
        description: SettingsScreenString.faqPlaybackNotStartingDescription,
        icon: Icons.play_circle,
        plainText: true,
      ),
      SettingsInfoItem(
        title: SettingsScreenString.faqLoginPersistenceTitle,
        description: SettingsScreenString.faqLoginPersistenceDescription,
        icon: Icons.login,
        plainText: true,
      ),
      SettingsInfoItem(
        title: SettingsScreenString.faqOtherIssueTitle,
        description: SettingsScreenString.faqOtherIssueDescription,
        icon: Icons.help,
        plainText: true,
      ),
    ],
    SettingsCategoryId.appInfo => const [
      SettingsInfoItem(
        title: SettingsScreenString.appInfoVersionTitle,
        description: SettingsScreenString.appInfoVersionDescription,
        icon: Icons.new_releases,
        action: AppBuildInfo.version,
      ),
      SettingsInfoItem(
        title: SettingsScreenString.appInfoGithubTitle,
        description: SettingsScreenString.appInfoGithubDescription,
        icon: Icons.code,
      ),
      SettingsInfoItem(
        title: SettingsScreenString.appInfoCreatorTitle,
        description: SettingsScreenString.appInfoCreatorDescription,
        icon: Icons.person,
      ),
      SettingsInfoItem(
        title: SettingsScreenString.appInfoOpenSourceLicensesTitle,
        description: SettingsScreenString.appInfoOpenSourceLicensesDescription,
        icon: Icons.article,
        action: SettingsScreenString.open,
        pressAction: SettingsInfoItemAction.openSourceLicenses,
      ),
    ],
    _ => const [],
  };
}
