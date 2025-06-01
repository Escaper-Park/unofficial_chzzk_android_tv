part of '../live_container.dart';

class _LiveUptimeBadge extends StatelessWidget {
  /// Show the uptime of the live broadcast.
  ///
  /// The DateTime format in the origin LiveInfo is ('yyyy-MM-dd HH:mm:ss') and
  /// this parses the string DateTime into the Dart DateTime format.
  const _LiveUptimeBadge(this.dateTimeStr);

  final String? dateTimeStr;

  @override
  Widget build(BuildContext context) {
    final DateTime nowDate =
        DateTime.now().toUtc().add(const Duration(hours: 9));

    final DateTime openDate = dateTimeStr == null
        ? DateTime.now()
        : CustomFormatter.parseDateTimeFromDateTimeStr(dateTimeStr!);

    final Duration diff =
        nowDate.difference(openDate.toUtc().add(const Duration(hours: 9)));
    final String paddedDuration = diff.paddedDuration();

    return CustomBadge(
      alignment: Alignment.bottomLeft,
      margin: const EdgeInsets.all(8.0),
      backgroundColor: AppColors.blackColor,
      elements: [TextElement(text: paddedDuration)],
    );
  }
}
