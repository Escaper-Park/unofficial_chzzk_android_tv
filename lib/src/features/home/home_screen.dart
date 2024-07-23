import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/constants/dimensions.dart';
import '../../common/widgets/center_widgets.dart';
import '../dashboard/dashboard_screen.dart';
import '../user/controller/user_controller.dart';

import './widgets/home_widgets.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ScrollController to move scroll position to current focused widget.
    final scrollController = useScrollController();
    final sidebarFSN = useFocusScopeNode();
    final contentScreenFSN = useFocusScopeNode();

    final List<FocusScopeNode> nodes = List.generate(
      4,
      (_) => useFocusScopeNode(),
    );

    // Add a user state to show suitable only the lists that is appropriate for
    // the current login status.
    final asyncUser = ref.watch(userControllerProvider);

    return DashboardScreen(
      sidebarFSN: sidebarFSN,
      contentScreenFSN: contentScreenFSN,
      contentScreen: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FocusScope(
          node: contentScreenFSN,
          child: asyncUser.when(
            data: (user) {
              SchedulerBinding.instance.addPostFrameCallback(
                (_) {
                  final List<double> offsets = [
                    0.0,
                    0.0,
                    Dimensions.videoContainerHeight + 80.0,
                    scrollController.position.maxScrollExtent,
                  ];

                  for (int i = 0; i < nodes.length; i++) {
                    final node = nodes[i];
                    node.addListener(
                      () {
                        if (node.hasFocus) {
                          scrollController.animateTo(
                            offsets[i],
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                    );
                  }
                },
              );

              return SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeScreenHeader(
                      headerFSN: nodes[0],
                      sidebarFSN: sidebarFSN,
                      belowFSN: nodes[1],
                    ),
                    if (user != null)
                      HomeFollowingLives(
                        listFSN: nodes[1],
                        sidebarFSN: sidebarFSN,
                        aboveFSN: nodes[0],
                        belowFSN: nodes[2],
                      ),
                    HomePopularLives(
                      autofocus: user == null ? true : false,
                      listFSN: nodes[2],
                      sidebarFSN: sidebarFSN,
                      aboveFSN: user == null ? nodes[0] : nodes[1],
                      belowFSN: nodes[3],
                    ),
                    if (user != null)
                      HomeFollowingCategories(
                        listFSN: nodes[3],
                        sidebarFSN: sidebarFSN,
                        aboveFSN: nodes[2],
                      ),
                  ],
                ),
              );
            },
            error: (error, stackTrace) => const CenteredText(text: '로그인 에러'),
            loading: () => const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}
