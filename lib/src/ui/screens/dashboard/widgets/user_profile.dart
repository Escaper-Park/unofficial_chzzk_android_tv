import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../constants/styles.dart';
import '../../../../controller/user/user_controller.dart';
import '../../../../model/user/user.dart';
import '../../../common/circle_avatar_profile_image.dart';

class UserProfile extends ConsumerWidget {
  const UserProfile({
    super.key,
    required this.parentHasFocus,
  });

  final bool parentHasFocus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUserProvider = ref.watch(userControllerProvider);

    return asyncUserProvider.when(
      data: (user) {
        return user == null
            ? const SizedBox.shrink()
            : SizedBox(
                height: 50.0,
                child: _profile(user),
              );
      },
      error: (error, stackTrace) => parentHasFocus
          ? const Center(child: Text('로그인 쿠키 기간 만료'))
          : const Center(child: Text('에러')),
      loading: () => const SizedBox(height: 50.0),
    );
  }

  Widget _profile(User user) {
    return parentHasFocus
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 50.0,
                  child: CircleAvatarProfileImage(
                    profileImageUrl: user.profileImageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        user.nickname,
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: AppColors.greyColor,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        : CircleAvatarProfileImage(
            profileImageUrl: user.profileImageUrl,
          );
  }
}
