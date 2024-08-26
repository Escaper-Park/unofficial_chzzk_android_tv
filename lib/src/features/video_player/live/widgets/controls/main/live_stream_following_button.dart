import 'package:flutter/material.dart';

import '../../../../../../common/constants/styles.dart';
import '../../../../../../common/widgets/focused_widget.dart';

class LiveStreamFollowingButton extends StatelessWidget {
  const LiveStreamFollowingButton({
    super.key,
    required this.focusNode,
    required this.isFollowing,
    required this.onPressed,
  });

  final FocusNode? focusNode;
  final bool isFollowing;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FocusedOutlinedButton(
      focusNode: focusNode,
      onPressed: onPressed,
      focusedBackgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(5.0),
      child: (_) => SizedBox(
        width: 40.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isFollowing
                  ? Icons.favorite_rounded
                  : Icons.favorite_border_rounded,
              size: 25.0,
              color: AppColors.whiteColor,
            ),
            const SizedBox(height: 5.0),
            const Text(
              '팔로잉',
              style: TextStyle(
                fontSize: 11.0,
                overflow: TextOverflow.ellipsis,
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
