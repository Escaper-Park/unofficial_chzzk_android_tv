import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/channel_screen.dart';

import '../../common/constants/dimensions.dart' show Dimensions;
import '../../common/constants/enums.dart' show AppRoute;
import '../../common/widgets/dpad/dpad_list_view.dart'
    show DpadListViewWithAsyncValue;
import '../../common/widgets/ui/ui_widgets.dart';

import '../../utils/extensions/custom_extensions.dart';
import '../../utils/hooks/custom_hooks.dart';
import '../channel/model/channel.dart';
import '../dashboard/widgets/dashboard_widgets.dart'
    show InheritedSidebarFocusScope;
import 'following_event.dart';
import 'following_state.dart';
import 'model/following.dart';
import 'widgets/following_widgets.dart' show FollowingChannelInfoCard;

part 'widgets/screen/following_body.dart';
part 'widgets/screen/following_channel_detail.dart';
part 'widgets/screen/following_list.dart';

class FollowingScreen extends HookConsumerWidget
    with FollowingEvent, FollowingState {
  const FollowingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = getAuth(ref);
    final nodes = useFocusScopeNodes(2);
    final sidebarFSN = InheritedSidebarFocusScope.of(context);
    final asyncFollowingList = getAsyncFollowingList(ref);
    final asyncChannel = getAsyncChannel(ref);

    return authState.when(
      data: (data) {
        if (data == null) {
          sidebarFSN.requestFocus();
          return const CenteredText(text: '팔로잉 메뉴는 로그인 후 사용할 수 있습니다');
        }

        return _FollowingBody(
          followingList: _FollowingList(
            asyncFollowingList: asyncFollowingList,
            listViewFSN: nodes[0],
            sidebarFSN: sidebarFSN,
            channelDetailFSN: nodes[1],
            goHome: () => goHome(ref, context),
            onPressed: (following) =>
                setCurrentSelectedChannel(ref, channelId: following.channelId),
          ),
          followingChannelDetail: _FollowingChannelDetail(
            asyncChannel: asyncChannel,
            followingListFSN: nodes[0], // FollowingList <-> ChannelDetailScreen
            channelDetailFSN: nodes[1],
          ),
        );
      },
      error: (_, __) => const CenteredText(text: '로그인 에러'),
      loading: () => const SizedBox.shrink(),
    );
  }
}
