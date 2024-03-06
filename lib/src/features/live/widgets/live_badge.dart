import 'package:flutter/material.dart';

import '../../../common/constants/styles.dart';
import '../../../common/widgets/rounded_container.dart';

class LiveBadge extends StatelessWidget {
  const LiveBadge({
    super.key,
    required this.text,
    required this.backgroundColor,
  });

  final String text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      backgroundColor: backgroundColor.withOpacity(0.85),
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 8.0,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 10.0,
          overflow: TextOverflow.ellipsis,
          color: AppColors.whiteColor,
        ),
      ),
    );
  }
}
