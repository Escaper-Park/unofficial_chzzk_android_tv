part of '../../channel_screen.dart';

class _ChannelClipHeader extends HookWidget {
  const _ChannelClipHeader({
    required this.leftFSN,
    required this.aboveFSN,
    required this.itemNode,
    required this.belowFSN,
    required this.pushChannelClip,
  });

  /// Left
  final FocusScopeNode? leftFSN;

  /// If the streamer is broadcasting, this must be a live container.
  /// Otherwise, this must be a following button.
  final FocusScopeNode aboveFSN;

  /// This button's [FocusScopeNode]
  final FocusScopeNode itemNode;

  /// Below
  final FocusScopeNode belowFSN;

  final VoidCallback pushChannelClip;

  @override
  Widget build(BuildContext context) {
    return ChannelHeaderWithShowMoreButton(
      autofocus: false,
      headerText: '클립',
      leftFSN: leftFSN,
      belowFSN: belowFSN,
      itemNode: itemNode,
      aboveFSN: aboveFSN,
      pushTo: pushChannelClip,
    );
  }
}
