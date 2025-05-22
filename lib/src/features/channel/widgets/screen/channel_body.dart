part of '../../channel_screen.dart';

class _ChannelBody extends StatelessWidget {
  const _ChannelBody({
    required this.scrollController,
    required this.node,
    required this.openLive,
    required this.channelProfile,
    required this.channelFunctionButtons,
    required this.channelLive,
    required this.channelVodHeader,
    required this.channelVodList,
    required this.channelClipHeader,
    required this.channelClipList,
  });

  final ScrollController scrollController;
  final FocusScopeNode node;
  final bool openLive;

  final Widget channelProfile;
  final Widget channelFunctionButtons;
  final Widget channelLive;
  final Widget channelVodHeader;
  final Widget channelVodList;
  final Widget channelClipHeader;
  final Widget channelClipList;

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      node: node,
      child: SingleChildScrollView(
        controller: scrollController,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 10.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  channelProfile,
                  channelFunctionButtons,
                ],
              ),
              if (openLive) channelLive,
              const SizedBox(height: 10.0),
              channelVodHeader,
              channelVodList,
              const SizedBox(height: 10.0),
              channelClipHeader,
              channelClipList,
            ],
          ),
        ),
      ),
    );
  }
}
