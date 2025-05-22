import 'package:flutter/material.dart';

import '../../constants/styles.dart' show AppColors;
import 'custom_badge.dart';

class TagBadge extends StatelessWidget {
  /// A live stream or vod container tag badge.
  const TagBadge({
    super.key,
    required this.backgroundColor,
    this.borderColor = Colors.transparent,
    required this.fontColor,
    required this.tag,
  });

  final Color backgroundColor;
  final Color borderColor;
  final Color fontColor;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return CustomBadge(
      borderRadius: 5.0,
      margin: const EdgeInsets.only(right: 3.0),
      verticalPadding: 1.5,
      horizontalPadding: 5.0,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      maxLines: 1,
      elements: [
        TextElement(
          text: tag,
          fontColor: fontColor,
        ),
      ],
    );
  }
}

class CategoryTagBadge extends StatelessWidget {
  /// Shows the current category.
  const CategoryTagBadge({super.key, required this.categoryValue});

  final String? categoryValue;

  @override
  Widget build(BuildContext context) {
    if (categoryValue == null || categoryValue!.isEmpty) {
      return const SizedBox.shrink();
    }

    const Color fontColor = AppColors.greyColor;
    const Color backgroundColor = AppColors.categoryTagBackgroundColor;

    return TagBadge(
      backgroundColor: backgroundColor,
      fontColor: fontColor,
      tag: categoryValue!,
    );
  }
}

class StreamerTagBadges extends StatelessWidget {
  /// Shows a list of tags set by the streamer.
  const StreamerTagBadges({
    super.key,
    this.tags,
    this.fontColor = AppColors.greyColor,
    this.backgroundColor = Colors.transparent,
    this.borderColor = AppColors.liveTagColor,
  });

  final List<String>? tags;

  final Color fontColor;
  final Color backgroundColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    if (tags == null || tags!.isEmpty) return const SizedBox.shrink();

    final tagBadges = List.generate(
      tags!.length,
      (index) => TagBadge(
        backgroundColor: backgroundColor,
        borderColor: borderColor,
        fontColor: fontColor,
        tag: (tags![index]),
      ),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: tagBadges,
    );
  }
}

class WatchPartyTagBadges extends StatelessWidget {
  /// If the streamer has set a watchparty, it will show the type of watchparty
  /// with a '같이보기' tag.
  const WatchPartyTagBadges({super.key, this.watchPartyTag});

  final String? watchPartyTag;

  @override
  Widget build(BuildContext context) {
    if (watchPartyTag == null) return SizedBox.shrink();

    const Color backgroundColor = Colors.transparent;
    const Color borderColor = AppColors.watchPartyTagBorderColor;
    const Color fontColor = AppColors.watchPartyTagFontColor;

    return StreamerTagBadges(
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      fontColor: fontColor,
      tags: ['같이보기', watchPartyTag!],
    );
  }
}
