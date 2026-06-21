import 'package:flutter/material.dart';

import '../../../../../../core/ui/ui.dart';
import '../../../following_screen_design.dart';
import '../../../following_screen_string.dart';

class FollowingSignedOutSection extends StatelessWidget {
  const FollowingSignedOutSection({
    super.key,
    required this.onAuthPressed,
  });

  final VoidCallback onAuthPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: FollowingScreenDesign.signedOutMaxWidth,
        ),
        child: ContentStateView.empty(
          message: FollowingScreenString.signedOutMessage,
          visual: Text(
            FollowingScreenString.signedOutTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          action: Padding(
            padding: const EdgeInsets.only(
              top: FollowingScreenDesign.signedOutActionGap,
            ),
            child: TvButton.label(
              text: FollowingScreenString.moveToAuth,
              icon: Icons.login_rounded,
              autofocus: true,
              onPressed: onAuthPressed,
            ),
          ),
        ),
      ),
    );
  }
}
