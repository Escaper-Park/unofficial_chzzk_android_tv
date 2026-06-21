part of 'channel_home_section.dart';

class _ChannelHomeStateView extends StatelessWidget {
  const _ChannelHomeStateView({
    required this.status,
    required this.node,
    required this.tabsNode,
    required this.onRetry,
  });

  final ChannelLoadStatus status;
  final FocusScopeNode node;
  final FocusScopeNode tabsNode;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final content = switch (status) {
      ChannelLoadStatus.initial || ChannelLoadStatus.loading =>
        ContentStateView.loading(message: channelHomeStateMessage(status)),
      ChannelLoadStatus.ready => ContentStateView.empty(
        message: channelHomeStateMessage(status),
        action: TvButton.label(
          text: ChannelScreenString.retry,
          type: TvButtonType.outline,
          autofocus: true,
          onPressed: onRetry,
        ),
      ),
      ChannelLoadStatus.failure => ContentStateView.error(
        message: channelHomeStateMessage(status),
        action: TvButton.label(
          text: ChannelScreenString.retry,
          autofocus: true,
          onPressed: onRetry,
        ),
      ),
    };

    return TvFocusSection.list(
      node: node,
      up: tabsNode,
      child: SizedBox(
        height: ChannelScreenDesign.stateViewHeight,
        child: Center(child: content),
      ),
    );
  }
}
