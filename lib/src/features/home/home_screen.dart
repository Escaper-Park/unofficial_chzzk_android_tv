import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/constants/dimensions.dart';
import '../../common/constants/enums.dart' show AppRoute, DpadAction;
import '../../common/constants/styles.dart' show AppColors;
import '../../common/widgets/dpad/dpad_widgets.dart'
    show DpadFocusScopeNavigator;
import '../../common/widgets/ui/ui_widgets.dart'
    show CenteredText, FocusedOutlinedButton;
import '../../utils/hooks/custom_hooks.dart';
import '../auth/model/auth.dart';
import '../category/model/category.dart';
import '../dashboard/widgets/dashboard_widgets.dart'
    show InheritedSidebarFocusScope;
import '../dashboard/widgets/sidebar_callback_shortcuts.dart'
    show SidebarCallbackShortcuts;
import '../following/model/following.dart';
import '../live/model/live_info.dart';
import '../live/widgets/live_widgets.dart' show LiveContainer;
import 'widgets/home_widgets.dart';

import 'home_event.dart';
import 'home_state.dart';

part 'widgets/screen/home_body.dart';
part 'widgets/screen/home_top_menu.dart';
part 'widgets/screen/home_following_lives.dart';
part 'widgets/screen/home_popular_lives.dart';
part 'widgets/screen/home_following_categories.dart';

class HomeScreen extends HookConsumerWidget with HomeEvent, HomeState {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = getAuth(ref);
    final scrollController = useScrollController();
    final nodes = useFocusScopeNodes(4);
    final sidebarFSN = InheritedSidebarFocusScope.of(context);

    return authState.when(
      data: (auth) {
        final bool isAuth = auth != null;

        useAutoScroll(
          auth: auth,
          scrollController: scrollController,
          nodes: nodes,
        );

        return _HomeBody(
          auth: auth,
          scrollController: scrollController,
          topMenu: _HomeTopMenu(
            listViewFSN: nodes[0],
            belowFSN: isAuth ? nodes[1] : nodes[2],
            sidebarFSN: sidebarFSN,
            refreshAll: () async => await refresh(ref),
            pushLiveAll: () => pushLiveAll(context),
            pushVodAll: () => pushVodAll(context),
            pushPopularClips: () => pushPopularClips(context),
            pushSearchTag: () => pushSearchTag(context),
            pushGroup: () => pushGroup(context),
          ),
          followingLives: _HomeFollowingLives(
            asyncFollowingLives: getAsyncFollowingLives(ref),
            aboveFSN: nodes[0],
            listViewFSN: nodes[1],
            belowFSN: nodes[2],
            sidebarFSN: sidebarFSN,
            fallbackAction: () => goFollowing(context),
          ),
          popularLives: _HomePopularLives(
            asyncPopularLives: getAsyncPopularLives(ref),
            auth: auth,
            aboveFSN: isAuth ? nodes[1] : nodes[0],
            listViewFSN: nodes[2],
            belowFSN: isAuth ? nodes[3] : null,
            sidebarFSN: sidebarFSN,
            fallbackAction: () => refresh(ref),
          ),
          followingCategories: _HomeFollowingCategories(
            asyncFollowingCategories: getAsyncFollowingCategories(ref),
            aboveFSN: nodes[2],
            listViewFSN: nodes[3],
            sidebarFSN: sidebarFSN,
            fallbackAction: () => refresh(ref),
            pushToCategoryDetail: (category) =>
                pushCategoryDetail(context, category: category),
          ),
        );
      },
      error: (_, __) => const CenteredText(text: '로그인 에러'),
      loading: () => const SizedBox.shrink(),
    );
  }
}
