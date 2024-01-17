import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unofficial_chzzk_android_tv/src/features/client/repository/client_repository.dart';

import '../../dashboard/screen/dashboard_screen.dart';
import '../following.dart';
import '../widgets/all_following_channels.dart';
import '../widgets/following_channel_info.dart';

class FollowingScreen extends ConsumerWidget {
  const FollowingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(clientRepositoryProvider).value;

    return DashboardScreen(
      body: auth == null
          ? const Center(
              child: Text('아직 로그인을 하지 않았습니다.'),
            )
          : Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const MenuHeaderText(text: '팔로우 채널'),
                      const SizedBox(height: 12.0),
                      Expanded(
                        child: AllFollowingChannels(auth),
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  flex: 4,
                  child: FollowingChannelInfo(),
                ),
              ],
            ),
    );
  }
}
