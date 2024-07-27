import 'package:flutter/material.dart';

import '../../../../common/constants/styles.dart';
import '../../../../common/widgets/circle_avatar_profile_image.dart';
import '../../../../common/widgets/rounded_container.dart';

import '../../../../utils/marquee/marquee.dart';
import '../../../channel/model/channel.dart';
import '../../../channel/widgets/channel_data/channel_name_with_verified_mark.dart';

import '../../model/live.dart';

class LiveInfoCard extends StatelessWidget {
  /// Basic live information.
  const LiveInfoCard({
    super.key,
    required this.hasFocus,
    required this.channel,
    required this.liveInfo,
  });

  final bool hasFocus;
  final Channel channel;
  final LiveInfo liveInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 5.0,
      ),
      child: Row(
        children: [
          // ProfileImage
          SizedBox(
            width: 30.0,
            child: CircleAvatarProfileImage(
              radius: 15.0,
              profileImageUrl: channel.channelImageUrl,
              useBorder: channel.openLive ?? false,
            ),
          ),
          const SizedBox(width: 15.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Live title
                LiveTitle(
                  hasFocus: hasFocus,
                  liveTitle: liveInfo.liveTitle ?? '',
                ),
                const SizedBox(height: 3.0),
                // Channel name
                ChannelNameWithVerifiedMark(
                  channel: channel,
                  fontSize: 13.0,
                ),
                // Category
                const SizedBox(height: 3.0),
                LiveCategoryWithTags(
                  hasFocus: hasFocus,
                  liveInfo: liveInfo,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LiveTitle extends StatelessWidget {
  const LiveTitle({
    super.key,
    required this.hasFocus,
    required this.liveTitle,
  });

  final bool hasFocus;
  final String liveTitle;

  @override
  Widget build(BuildContext context) {
    // remove new line
    final newlineRemovedTitle = liveTitle.replaceAll('\n', ' ');

    return Marquee(
      behavior: MarqueeBehavior.scroll,
      hasFocus: hasFocus,
      items: [
        Text(
          newlineRemovedTitle,
          style: const TextStyle(
            fontSize: 13.0,
            // overflow: TextOverflow.ellipsis,
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class LiveCategoryWithTags extends StatelessWidget {
  /// Live category with tags.
  const LiveCategoryWithTags({
    super.key,
    required this.hasFocus,
    required this.liveInfo,
  });

  final bool hasFocus;
  final LiveInfo liveInfo;

  @override
  Widget build(BuildContext context) {
    final categoryValue = liveInfo.liveCategoryValue;
    final tags = liveInfo.tags;

    final List<Widget> items = [
      LiveTagBadge(tag: categoryValue),
      if (tags != null && tags.isNotEmpty) LiveTags(tags: tags),
    ];

    return Marquee(
      behavior: MarqueeBehavior.alternate,
      hasFocus: hasFocus,
      items: items,
    );
  }
}

class LiveTagBadge extends StatelessWidget {
  /// Live tag badge
  const LiveTagBadge({
    super.key,
    required this.tag,
    this.backgroundColor = Colors.black54,
    this.textColor = AppColors.greyColor,
  });

  final Color backgroundColor;
  final Color textColor;
  final String? tag;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      margin: const EdgeInsets.only(right: 3.0),
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      borderRadius: 3.0,
      backgroundColor: (tag == null) ? Colors.transparent : backgroundColor,
      child: Text(
        (tag == null || tag!.isEmpty) ? '?' : tag!,
        maxLines: 1,
        style: TextStyle(
          fontSize: 11.0,
          color: textColor,
          overflow: TextOverflow.ellipsis,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class LiveTags extends StatelessWidget {
  const LiveTags({super.key, required this.tags});

  final List<String>? tags;

  @override
  Widget build(BuildContext context) {
    if (tags == null || tags!.isEmpty) return const SizedBox.shrink();

    final tagBadges = List.generate(
      tags!.length,
      (index) => LiveTagBadge(
        tag: tags![index],
        textColor: AppColors.whiteColor.withOpacity(0.7),
        backgroundColor: AppColors.greyColor.withOpacity(0.5),
      ),
    );

    // Add scroll view to prevent the overflow error.
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: tagBadges,
    );
  }
}
