part of '../following_channel_info_card.dart';

class _FollowingChannelLiveStatus extends StatelessWidget {
  const _FollowingChannelLiveStatus({
    required this.concurrentUserCount,
  });

  final int concurrentUserCount;

  @override
  Widget build(BuildContext context) {
    final String formattedUserCount = concurrentUserCount.commaFormat();

    return Row(
      mainAxisAlignment: MainAxisAlignment.end, // right
      children: [
        // red dot icon to show the openLive state.
        _redDot(),
        const SizedBox(width: 5.0),
        Expanded(
          child: _userCouter(formattedUserCount),
        ),
      ],
    );
  }

  Widget _redDot() {
    return Icon(
      Icons.circle,
      size: 5.0,
      color: AppColors.lightRedColor,
    );
  }

  Widget _userCouter(String userCount) {
    return Align(
      alignment: Alignment.centerRight,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          userCount,
          style: const TextStyle(
            fontSize: 11.0,
            color: AppColors.lightRedColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
