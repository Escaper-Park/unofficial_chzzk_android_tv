part of '../../settings_screen.dart';

class _SettingsBody extends StatelessWidget {
  const _SettingsBody({
    required this.settingMenuList,
    required this.settingDetail,
    required this.appInfo,
  });

  final Widget settingMenuList;
  final Widget settingDetail;
  final Widget appInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                settingMenuList,
                Expanded(
                  child: settingDetail,
                ),
              ],
            ),
          ),
          appInfo,
        ],
      ),
    );
  }
}
