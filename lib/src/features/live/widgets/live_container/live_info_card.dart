part of '../live_container.dart';

class _LiveInfoCard extends StatelessWidget {
  /// A basic live information.
  const _LiveInfoCard(
    this.channel,
    this.liveInfo,
  );

  final Channel channel;
  final LiveInfo liveInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 8.0,
      ),
      child: Row(
        children: [
          // Profile Image
          _channelImage(),
          // padding
          const SizedBox(width: 15.0),
          // info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // live title
                Expanded(
                  child: _LiveTitle(liveInfo.liveTitle),
                ),
                // padding
                const SizedBox(height: 5.0),
                // channel name
                _LiveChannelName(channel),
                // padding
                const SizedBox(height: 5.0),
                // tags
                LiveTagsAll(
                  categoryValue: liveInfo.liveCategoryValue,
                  watchPartyTag: liveInfo.watchPartyTag,
                  tags: liveInfo.tags,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _channelImage() {
    final radius = Dimensions.infoCardProfileImageRadius;

    return SizedBox(
      width: radius * 2,
      child: CircleAvatarProfileImage(
        radius: radius,
        profileImageUrl: channel.channelImageUrl,
        useBorder: channel.openLive ?? false,
      ),
    );
  }
}
