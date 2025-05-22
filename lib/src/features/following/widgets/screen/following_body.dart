part of '../../following_screen.dart';

class _FollowingBody extends StatelessWidget {
  const _FollowingBody({
    required this.followingList,
    required this.followingChannelDetail,
  });

  final Widget followingList;
  final Widget followingChannelDetail;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 10.0,
          ),
          child: followingList,
        ),
        Expanded(child: followingChannelDetail),
      ],
    );
  }
}
