import 'package:flutter/material.dart';

import 'tv_media_card_design.dart';

class TvMediaChannelName extends StatelessWidget {
  const TvMediaChannelName({
    super.key,
    required this.channelName,
    required this.verified,
    this.style,
    this.textAlign = TextAlign.left,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  final String channelName;
  final bool verified;
  final TextStyle? style;
  final TextAlign textAlign;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    final textStyle = _channelNameTextStyle(context);

    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Flexible(
          child: _TvMediaChannelNameText(
            channelName: channelName,
            style: textStyle,
            textAlign: textAlign,
          ),
        ),
        if (verified) ...[
          const SizedBox(width: 4),
          TvMediaVerifiedMark(size: _verifiedMarkSize(textStyle)),
        ],
      ],
    );
  }

  TextStyle? _channelNameTextStyle(BuildContext context) {
    if (style != null) {
      return style;
    }

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return textTheme.titleSmall?.copyWith(
      color: colorScheme.onSurface.withValues(alpha: 0.7),
      fontWeight: FontWeight.w600,
    );
  }

  double _verifiedMarkSize(TextStyle? textStyle) {
    return textStyle?.fontSize ?? TvMediaCardDesign.verifiedMarkSize;
  }
}

class TvMediaVerifiedMark extends StatelessWidget {
  const TvMediaVerifiedMark({
    super.key,
    this.size = TvMediaCardDesign.verifiedMarkSize,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Image.asset(
      TvMediaCardDesign.verifiedMarkAsset,
      width: size,
      height: size,
      errorBuilder: (context, error, stackTrace) {
        return Icon(
          Icons.verified_rounded,
          size: size,
          color: colorScheme.primary,
        );
      },
    );
  }
}

class _TvMediaChannelNameText extends StatelessWidget {
  const _TvMediaChannelNameText({
    required this.channelName,
    this.style,
    required this.textAlign,
  });

  final String channelName;
  final TextStyle? style;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      channelName,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      style: style,
    );
  }
}
