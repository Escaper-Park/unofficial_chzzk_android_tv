part of '../vod_container.dart';

class _VodInfoCard extends StatelessWidget {
  const _VodInfoCard({
    required this.vod,
    this.displayChannelData = true,
  });

  final Vod vod;

  /// Display channel data such as channe name, profile image, etc.
  final bool displayChannelData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 8.0,
      ),
      child: displayChannelData
          ? _VodInfoCardWithChannelProfile(vod: vod)
          : _VodInfo(vod: vod),
    );
  }
}

class _VodInfoCardWithChannelProfile extends StatelessWidget {
  const _VodInfoCardWithChannelProfile({required this.vod});

  final Vod vod;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // profile image
        _channelImage(),
        // padding
        const SizedBox(width: 15.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // title
              Expanded(
                child: _VodTitle(title: vod.videoTitle),
              ),
              const SizedBox(height: 5.0),
              // channel name
              ChannelNameWithVerifiedMark(channel: vod.channel!),
              const SizedBox(height: 5.0),
              // tags
              VodTags(vod: vod),
              const SizedBox(height: 3.0),
              // read count, publish date,
              VodReadCountAndPublishDate(vod: vod),
            ],
          ),
        ),
      ],
    );
  }

  Widget _channelImage() {
    final radius = Dimensions.infoCardProfileImageRadius;
    return SizedBox(
      width: radius * 2,
      child: CircleAvatarProfileImage(
        radius: radius,
        profileImageUrl: vod.channel?.channelImageUrl,
      ),
    );
  }
}

class _VodInfo extends StatelessWidget {
  const _VodInfo({required this.vod});

  final Vod vod;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // title
          Expanded(
            child: _VodTitle(title: vod.videoTitle, maxLines: 2),
          ),
          const SizedBox(height: 5.0),
          // tags
          VodTags(vod: vod),
          const SizedBox(height: 3.0),
          // read count, publish date,
          VodReadCountAndPublishDate(vod: vod),
        ],
      ),
    );
  }
}
