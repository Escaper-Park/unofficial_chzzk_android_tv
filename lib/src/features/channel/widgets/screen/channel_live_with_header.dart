part of '../../channel_screen.dart';

class _ChannelLiveWithHeader extends HookWidget {
  /// If this streamer is broadcasting, display the live.
  ///
  /// It uses [LiveDetail] instead of [LiveInfo] because there is no way
  /// to get just one specific channel's LiveInfo directly.
  const _ChannelLiveWithHeader({
    required this.baseRoute,
    required this.asyncLiveDetail,
    required this.aboveFSN,
    required this.itemNode,
    required this.belowFSN,
    required this.leftFSN,
    required this.watchLive,
  });

  final AppRoute baseRoute;
  final AsyncValue<LiveDetail?> asyncLiveDetail;
  final FocusScopeNode aboveFSN;
  final FocusScopeNode itemNode;
  final FocusScopeNode belowFSN;
  final FocusScopeNode? leftFSN;
  final VoidCallback watchLive;

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // header text
          const HeaderText(text: '라이브 방송', horizontalPadding: 0.0),
          // live
          SizedBox(
            height: Dimensions.videoContainerHeight,
            child: switch (asyncLiveDetail) {
              AsyncData(:final value) => value == null
                  ? _errorText()
                  : DpadFocusScopeNavigator(
                      node: itemNode,
                      dpadKeyNodeMap: {
                        DpadAction.arrowUp: aboveFSN,
                        DpadAction.arrowDown: belowFSN,
                        DpadAction.arrowLeft: leftFSN,
                      },
                      child: LiveContainer(
                        autofocus: true,
                        appRoute: baseRoute,
                        focusNode: focusNode,
                        channel: value.channel,
                        liveInfo: LiveInfo.fromJson(value.toJson()),
                      ),
                    ),
              AsyncError() => _errorText(),
              _ => const SizedBox.shrink(),
            },
          ),
        ],
      ),
    );
  }

  Widget _errorText() {
    return CenteredText(text: '라이브를 불러올 수 없습니다');
  }
}
