part of '../live_container.dart';

class _LiveStatusBadge extends StatelessWidget {
  /// Display the live status and current user count at the top left.
  const _LiveStatusBadge(
    this.concurrentUserCount,
  );

  final int concurrentUserCount;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _liveBadge(),
            const SizedBox(width: 5.0),
            _userCountBadge(),
          ],
        ),
      ),
    );
  }

  Widget _liveBadge() {
    return CustomBadge(
      backgroundColor: AppColors.redColor,
      elements: [TextElement(text: 'LIVE')],
    );
  }

  Widget _userCountBadge() {
    final userCount = '${concurrentUserCount.commaFormat()}명 시청';

    return CustomBadge(
      backgroundColor: AppColors.backgroundColor,
      elements: [TextElement(text: userCount)],
    );
  }
}
