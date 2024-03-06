import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/constants/dimensions.dart';
import '../../../common/widgets/circle_avatar_profile_image.dart';
import '../../user/controller/user_controller.dart';
import '../../user/model/user.dart';

class UserProfile extends ConsumerWidget {
  const UserProfile({
    super.key,
    required this.parentHasFocus,
  });

  final bool parentHasFocus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUser = ref.watch(userControllerProvider);

    const double imageContainerHeight = Dimensions.profileImageContainerHeight;

    return switch (asyncUser) {
      AsyncData(:final value) => value == null
          ? const SizedBox.shrink()
          : SizedBox(
              height: imageContainerHeight,
              child: _profile(value),
            ),
      AsyncError() => SizedBox(
          height: imageContainerHeight,
          child: parentHasFocus ? const Text('로그인 쿠키 기간 만료') : const Text('만료'),
        ),
      _ => const SizedBox(height: imageContainerHeight),
    };
  }

  Widget _profile(User user) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7.5),
      child: parentHasFocus
          ? Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _profileImage(user),
                Expanded(
                  child: Center(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        user.nickname,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          : SizedBox(width: 30.0, child: _profileImage(user)),
    );
  }

  Widget _profileImage(User user) {
    return Align(
      alignment: Alignment.centerLeft,
      child: CircleAvatarProfileImage(profileImageUrl: user.profileImageUrl),
    );
  }
}
