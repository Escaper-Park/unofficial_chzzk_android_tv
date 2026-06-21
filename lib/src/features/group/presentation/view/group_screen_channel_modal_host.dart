part of 'group_screen.dart';

class _GroupChannelModalHost extends StatelessWidget {
  const _GroupChannelModalHost({
    required this.activeModal,
    required this.activeModalGroup,
    required this.modalNode,
    required this.focusRegistry,
  });

  final GroupChannelModalState? activeModal;
  final GroupItem? activeModalGroup;
  final FocusScopeNode modalNode;
  final GroupChannelFocusRegistry focusRegistry;

  @override
  Widget build(BuildContext context) {
    final modal = activeModal;
    final group = activeModalGroup;
    if (modal == null || group == null) {
      return const SizedBox.shrink();
    }

    return GroupChannelModal(
      group: group,
      channel: modal.channel,
      node: modalNode,
      openerNode: focusRegistry.maybeNodeFor(modal.channel.channelId),
      onWatchLive: (channel) {
        context.read<GroupBloc>().add(const GroupEvent.channelModalClosed());
        unawaited(
          openLivePlayerFromChannel(
            context,
            channelId: channel.channelId,
            title: channel.channelName,
          ),
        );
      },
      onMoveToChannel: (channel) {
        context.read<GroupBloc>().add(const GroupEvent.channelModalClosed());
        unawaited(
          context.pushNamed(
            AppRoute.channel.name,
            pathParameters: {'channelId': channel.channelId},
          ),
        );
      },
      onRemoveFromGroup: (channel) {
        unawaited(
          _confirmRemoveMember(
            context: context,
            group: group,
            channel: channel,
          ),
        );
      },
      onDismiss: () {
        context.read<GroupBloc>().add(const GroupEvent.channelModalClosed());
        focusRegistry.maybeNodeFor(modal.channel.channelId)?.requestFocus();
      },
    );
  }
}
