import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../ui/common/circle_avatar_profile_image.dart';
import './multi_view_control_buttons.dart';

class MultiViewControlCard extends ConsumerWidget {
  const MultiViewControlCard({
    super.key,
    required this.index,
    required this.profileImageUrl,
    required this.videoFocusNode,
    required this.controller,
    this.autofocus = false,
  });

  final int index;
  final String? profileImageUrl;
  final FocusNode videoFocusNode;
  final ChewieController controller;
  final bool autofocus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 10.0,
          ),
          child: CircleAvatarProfileImage(
            profileImageUrl: profileImageUrl,
            radius: 20.0,
            hasBorder: false,
          ),
        ),
        Expanded(
          child: MultiViewControlButtons(
            controller: controller,
            index: index,
            autofocus: autofocus,
            videoFocusNode: videoFocusNode,
          ),
        )
      ],
    );
  }
}
