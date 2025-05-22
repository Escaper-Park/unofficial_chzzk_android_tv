part of '../../following_screen.dart';

class _FollowingList extends StatelessWidget {
  const _FollowingList({
    required this.asyncFollowingList,
    required this.listViewFSN,
    required this.sidebarFSN,
    required this.channelDetailFSN,
    required this.goHome,
    required this.onPressed,
  });

  final AsyncValue<List<Following>?> asyncFollowingList;

  final FocusScopeNode listViewFSN;
  final FocusScopeNode sidebarFSN;
  final FocusScopeNode channelDetailFSN;

  final void Function(Following following) onPressed;

  final VoidCallback goHome;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // header
        HeaderText(text: '팔로잉 채널'),
        // following list
        Expanded(
          child: DpadListViewWithAsyncValue(
            asyncValue: asyncFollowingList,
            scrollDirection: Axis.vertical,
            sidebarFSN: sidebarFSN,
            leftFSN: sidebarFSN,
            rightFSN: channelDetailFSN,
            itemWidth: Dimensions.followingListWidth,
            itemHeight: context.screenHeight,
            listViewFSN: listViewFSN,
            emptyText: '팔로잉 채널이 없습니다',
            errorText: '팔로잉 채널을 불러올 수 없습니다',
            fallbackAction: goHome,
            itemBuilder: (index, focusNode, object) => FollowingChannelInfoCard(
              autofocus: index == 0,
              following: object,
              onPressed: () => onPressed(object),
            ),
          ),
        ),
      ],
    );
  }
}
