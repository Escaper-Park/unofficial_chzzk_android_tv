import 'package:flutter/material.dart';

import '../../../../../../core/ui/ui.dart';
import '../../../bloc/channel_bloc.dart';
import '../../../channel_screen_design.dart';
import '../../../channel_screen_string.dart';

class ChannelHeader extends StatelessWidget {
  const ChannelHeader({
    super.key,
    required this.state,
  });

  final ChannelState state;

  @override
  Widget build(BuildContext context) {
    final profile = state.profile;
    final channelName = profile?.channelName.trim();
    final description = _singleLine(profile?.description);

    return SizedBox(
      height: ChannelScreenDesign.headerHeight,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          ChannelScreenDesign.headerHorizontalPadding,
          ChannelScreenDesign.headerTopPadding,
          ChannelScreenDesign.headerHorizontalPadding,
          ChannelScreenDesign.headerBottomPadding,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TvChannelAvatar(
              imageUrl: profile?.channelImageUrl,
              radius: ChannelScreenDesign.headerAvatarRadius,
              openLive: profile?.openLive ?? false,
              liveBadgeHeight: ChannelScreenDesign.headerAvatarBadgeHeight,
              liveBadgeOverlap: ChannelScreenDesign.headerAvatarBadgeOverlap,
            ),
            const SizedBox(width: ChannelScreenDesign.headerContentGap),
            Expanded(
              child: _ChannelHeaderText(
                title: channelName == null || channelName.isEmpty
                    ? null
                    : channelName,
                verified: profile?.verifiedMark ?? false,
                followerCount: profile?.followerCount,
                description: description,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String? _singleLine(String? value) {
  final trimmed = value?.trim();
  if (trimmed == null || trimmed.isEmpty) {
    return null;
  }

  return trimmed.replaceAll(RegExp(r'\s+'), ' ');
}

class _ChannelHeaderText extends StatelessWidget {
  const _ChannelHeaderText({
    required this.title,
    required this.verified,
    required this.followerCount,
    required this.description,
  });

  final String? title;
  final bool verified;
  final int? followerCount;
  final String? description;

  @override
  Widget build(BuildContext context) {
    if (title == null && followerCount == null && description == null) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      height: ChannelScreenDesign.headerContentHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            TvMediaChannelName(
              channelName: title!,
              verified: verified,
              style: ChannelScreenDesign.headerNameStyle(context),
            ),
          if (followerCount != null) ...[
            const SizedBox(height: ChannelScreenDesign.headerMetadataGap),
            Text(
              ChannelScreenString.followerCount(followerCount!),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: ChannelScreenDesign.headerMetadataStyle(context),
            ),
          ],
          if (description != null) ...[
            const SizedBox(height: ChannelScreenDesign.headerDescriptionTopGap),
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: ChannelScreenDesign.headerDescriptionMaxWidth,
              ),
              child: Text(
                description!,
                maxLines: ChannelScreenDesign.headerDescriptionMaxLines,
                overflow: TextOverflow.ellipsis,
                style: ChannelScreenDesign.headerDescriptionStyle(context),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
