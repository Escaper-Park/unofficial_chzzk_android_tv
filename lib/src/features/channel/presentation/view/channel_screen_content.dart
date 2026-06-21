part of 'channel_screen.dart';

Widget _channelScreenContent({
  required BuildContext context,
  required ChannelState state,
  required FocusScopeNode tabsNode,
  required FocusScopeNode homeStateNode,
  required FocusScopeNode homeLiveNode,
  required FocusScopeNode homeVodNode,
  required FocusScopeNode? homePreferredContentNode,
  required FocusScopeNode vodGridNode,
  required ValueNotifier<bool> showSortPanel,
  required OverlayPortalController sortOverlayController,
  required String? snackbarMessage,
}) {
  return Stack(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ChannelHeader(state: state),
          Expanded(
            child: ChannelLayout(
              state: state,
              tabsNode: tabsNode,
              homeStateNode: homeStateNode,
              homeLiveNode: homeLiveNode,
              homeVodNode: homeVodNode,
              homePreferredContentNode: homePreferredContentNode,
              vodGridNode: vodGridNode,
              onTabSelected: (tab) {
                context.read<ChannelBloc>().add(
                  ChannelEvent.tabSelected(tab),
                );
              },
              onSortPressed: () {
                showSortPanel.value = true;
                sortOverlayController.show();
              },
              onFollowPressed: () {
                unawaited(
                  _handleFollowPressed(
                    context: context,
                    state: state,
                  ),
                );
              },
              onGroupPressed: () {
                context.read<ChannelBloc>().add(
                  const ChannelEvent.groupPanelRequested(),
                );
              },
              onRetry: () {
                context.read<ChannelBloc>().add(
                  const ChannelEvent.retryRequested(),
                );
              },
              onLoadMore: () {
                context.read<ChannelBloc>().add(
                  const ChannelEvent.loadMoreRequested(),
                );
              },
              onLivePressed: (item) {
                unawaited(openLivePlayerFromCard(context, item));
              },
              onVodPressed: (item) {
                unawaited(openVodPlayerFromCard(context, item));
              },
            ),
          ),
        ],
      ),
      if (snackbarMessage != null) TvSnackbar(message: snackbarMessage),
    ],
  );
}
