part of '../../channel_screen.dart';

class _ChannelVodHeader extends HookWidget {
  const _ChannelVodHeader({
    required this.autofocus,
    required this.leftFSN,
    required this.aboveFSN,
    required this.itemNode,
    required this.belowFSN,
    required this.pushChannelVod,
  });

  final bool autofocus;

  /// Left
  final FocusScopeNode? leftFSN;

  /// If the streamer is broadcasting, this must be a live container.
  /// Otherwise, this must be a following button.
  final FocusScopeNode aboveFSN;

  /// This button's [FocusScopeNode]
  final FocusScopeNode itemNode;

  /// Below
  final FocusScopeNode belowFSN;

  final VoidCallback pushChannelVod;

  @override
  Widget build(BuildContext context) {
    return ChannelHeaderWithShowMoreButton(
      autofocus: autofocus,
      headerText: '다시보기',
      leftFSN: leftFSN,
      belowFSN: belowFSN,
      itemNode: itemNode,
      aboveFSN: aboveFSN,
      pushTo: pushChannelVod,
    );
  }
}
