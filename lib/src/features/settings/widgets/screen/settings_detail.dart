part of '../../settings_screen.dart';

class _SettingsDetail extends StatelessWidget {
  const _SettingsDetail({
    required this.currentIndex,
    required this.detailScreenFSN,
    required this.settingMenuFSN,
    required this.detailFSN,
  });

  final int currentIndex;
  final FocusScopeNode detailScreenFSN;
  final FocusScopeNode settingMenuFSN;

  final FocusScopeNode detailFSN;

  @override
  Widget build(BuildContext context) {
    final Widget detailScreenWidget = switch (currentIndex) {
      0 => SettingsDetailStreaming(
          settingMenuFSN: settingMenuFSN,
          streamSettingListFSN: detailScreenFSN,
        ),
      1 => SettingsDetailChat(
          settingMenuFSN: settingMenuFSN,
          chatSettingListFSN: detailScreenFSN,
        ),
      2 => SettingsDetailUpdate(
          settingMenuFSN: settingMenuFSN,
          updateDetailFSN: detailScreenFSN,
        ),
      3 => SettingsDetailFaq(),
      4 => SettingsDetailLicenses(
          settingMenuFSN: settingMenuFSN,
          licenseListViewFSN: detailScreenFSN,
          licenseDetailFSN: detailFSN,
        ),
      _ => Container(),
    };

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: detailScreenWidget,
    );
  }
}
