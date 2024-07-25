import 'package:flutter/material.dart';
import 'package:unofficial_chzzk_android_tv/src/utils/marquee/marquee.dart';

import '../../../../common/constants/styles.dart';

class VodTitle extends StatelessWidget {
  const VodTitle({
    super.key,
    this.overflow = TextOverflow.clip,
    this.hasFocus,
    this.useMarquee = false,
    required this.vodTitle,
  });

  /// For marquee.
  final bool? hasFocus;

  /// Use marquee when using vod info with channel name.
  final bool useMarquee;

  /// Video title overflow.
  final TextOverflow overflow;
  final String vodTitle;

  @override
  Widget build(BuildContext context) {
    return useMarquee
        ? Marquee(
            behavior: MarqueeBehavior.scroll,
            hasFocus: hasFocus ?? false,
            items: [_vodTitle()],
          )
        : Expanded(
            child: _vodTitle(),
          );
  }

  Widget _vodTitle() {
    return Text(
      vodTitle.replaceAll('\n', ' '),
      style: TextStyle(
        fontSize: 13.0,
        color: AppColors.whiteColor,
        overflow: overflow,
      ),
    );
  }
}
