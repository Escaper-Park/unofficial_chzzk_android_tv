import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/circle_avatar_profile.dart';
import '../../user/user.dart';

class UserProfile extends ConsumerWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUserProvider = ref.watch(userProvider);

    return asyncUserProvider.when(
      data: (user) {
        if (user != null) {
          return Row(
            children: [
              CircleAvatarProfile(profileImgUrl: user.profileImageUrl),
              const SizedBox(width: 5.0),
              Text(user.nickname),
            ],
          );
        } else {
          return const Text('User Error');
        }
      },
      error: (error, stackTrace) => const Text('Error'),
      loading: () => const SizedBox.shrink(),
    );
  }
}
