part of '../../channel_screen.dart';

class _ChannelFunctionButtons extends HookWidget {
  /// Following button of a channel.
  const _ChannelFunctionButtons({
    required this.asyncFollowingList,
    required this.itemNode,
    required this.belowFSN,
    this.leftFSN,
    required this.channel,
    required this.toggleFollow,
    required this.addMemberToGroup,
  });

  final AsyncValue<List<Following>?> asyncFollowingList;
  final FocusScopeNode itemNode;
  final FocusScopeNode belowFSN;
  final FocusScopeNode? leftFSN;
  final Channel channel;
  final Future<void> Function(bool isFollowing, Channel channel) toggleFollow;
  final Future<void> Function(Channel channel) addMemberToGroup;

  @override
  Widget build(BuildContext context) {
    final focusNodes = useFocusNodes(2);
    final isFirstFocused = useState<bool>(true);

    return Align(
      alignment: Alignment.topRight,
      child: DpadFocusScopeNavigator(
        node: itemNode,
        dpadKeyNodeMap: {
          DpadAction.arrowDown: belowFSN,
        },
        onFocusChange: (value) {
          if (value && isFirstFocused.value) {
            focusNodes[0].requestFocus();
            isFirstFocused.value = false;
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _button(
              true,
              FollowingButtonWithAsyncValue<Following>(
                focusNode: focusNodes[0],
                asyncFollowingList: asyncFollowingList,
                containsFollowing: (Following following) =>
                    following.channelId == channel.channelId,
                unFollowWarning: '[${channel.channelName}] 채널 팔로우를 취소하시겠습니까?',
                onPressed: (isFollowing) async {
                  await toggleFollow(isFollowing, channel);
                },
              ),
            ),
            const SizedBox(width: 10.0),
            _button(
              false,
              _ChannelAddGroupButton(
                focusNode: focusNodes[1],
                channel: channel,
                addMemberToGroup: addMemberToGroup,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _button(
    bool isFirstItem,
    Widget child,
  ) {
    return DpadCallbackShortcuts(
      dpadKeyNodeMap: {},
      bindings: _createBindings(isFirstItem),
      child: child,
    );
  }

  ShortcutsBindings _createBindings(bool isFirstItem) {
    ShortcutsBindings bindings = {};

    bindings[const SingleActivator(LogicalKeyboardKey.arrowDown)] = () {
      belowFSN.requestFocus();
    };

    // Add up arrow binding for top row items
    if (isFirstItem) {
      bindings[const SingleActivator(LogicalKeyboardKey.arrowLeft)] = () {
        leftFSN?.requestFocus();
      };
    }

    return bindings;
  }
}
