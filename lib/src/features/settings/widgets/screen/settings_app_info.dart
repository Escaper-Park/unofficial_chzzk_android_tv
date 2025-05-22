part of '../../settings_screen.dart';

class _SettingsAppInfo extends StatelessWidget {
  const _SettingsAppInfo();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _text(AppVersion.version),
        _text('escaper.bgp@gmail.com'),
      ],
    );
  }

  Widget _text(String text) {
    const Color color = AppColors.greyColor;
    const double fontSize = 11.0;

    return CenteredText(
      text: text,
      fontSize: fontSize,
      fontColor: color,
    );
  }
}
