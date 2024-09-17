import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show LogicalKeyboardKey;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/constants/styles.dart';
import '../../../common/widgets/center_widgets.dart';
import '../../../common/widgets/dpad_widgets.dart';
import '../../../common/widgets/focused_widget.dart';
import '../../../utils/router/app_router.dart';
import '../../category/controller/category_controller.dart';
import '../../dashboard/controller/dashboard_controller.dart';
import '../../following/controller/following_controller.dart';
import '../../live/controller/live_controller.dart';
import './chzzk_text_logo.dart';

class HomeScreenHeader extends HookConsumerWidget {
  /// Some of function buttons and a text logo at the top of the home screen.
  const HomeScreenHeader({
    super.key,
    required this.headerFSN,
    required this.sidebarFSN,
    required this.belowFSN,
  });

  /// This Widget's [FocusScopeNode]
  final FocusScopeNode headerFSN;

  /// If focused widget's index is 0 and press arrow left key, sidebar has focus.
  final FocusScopeNode sidebarFSN;

  /// [FocusScopeNode] located below this widget.
  ///
  /// It depends on user login status.
  final FocusScopeNode belowFSN;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<(IconData, String, VoidCallback)> itemData = [
      (
        Icons.refresh_rounded,
        '새로고침',
        () async {
          ref.read(followingLivesControllerProvider.notifier).refresh();
          ref.read(homePopularLivesControllerProvider.notifier).refresh();
          ref.read(followingCategoriesControllerProvider.notifier).refresh();
        }
      ),
      (
        Icons.sort_rounded,
        '전체 라이브',
        () {
          ref
              .read(dashboardControllerProvider.notifier)
              .changeScreen(context, AppRoute.allLives);
        }
      ),
      (
        Icons.replay_circle_filled_rounded,
        '다시보기',
        () {
          ref
              .read(dashboardControllerProvider.notifier)
              .changeScreen(context, AppRoute.allVods);
        }
      ),
      (
        Icons.manage_search_rounded,
        '태그 검색',
        () {
          ref
              .read(dashboardControllerProvider.notifier)
              .changeScreen(context, AppRoute.searchTag);
        }
      ),
      (
        Icons.content_cut_rounded,
        '인기 클립',
        () {
          ref
              .read(dashboardControllerProvider.notifier)
              .changeScreen(context, AppRoute.popularClip);
        }
      ),
    ];

    final focusNodes = List.generate(itemData.length, (_) => useFocusNode());
    final isFirstFocused = useState<bool>(true);

    // Create function buttons
    final functionButtons = List.generate(itemData.length, (index) {
      final item = itemData[index];

      return HomeScreenHeaderButton(
        autofocus: false,
        focusNode: focusNodes[index],
        iconData: item.$1,
        text: item.$2,
        onPressed: item.$3,
      );
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Function buttons
        Expanded(
          child: DpadFocusScopeNavigator(
            node: headerFSN,
            dpadKeyFocusScopeNodeMap: {DpadAction.arrowDown: belowFSN},
            onFocusChange: (value) {
              if (value && isFirstFocused.value) {
                focusNodes[0].requestFocus();
                isFirstFocused.value = false;
              }
            },
            child: Row(
              children: [
                _expandedFlex1(
                  // Add [CallbackShortcuts] to move focus to the sidebar.
                  CallbackShortcuts(
                    bindings: {
                      const SingleActivator(LogicalKeyboardKey.arrowLeft):
                          sidebarFSN.requestFocus,
                    },
                    child: functionButtons[0],
                  ),
                ),
                _expandedFlex1(functionButtons[1]),
                _expandedFlex1(functionButtons[2]),
                _expandedFlex1(functionButtons[3]),
                _expandedFlex1(functionButtons[4]),
              ],
            ),
          ),
        ),
        // Gif text logo
        const ChzzkTextLogo(),
      ],
    );
  }

  Widget _expandedFlex1(Widget child) {
    return Expanded(flex: 1, child: child);
  }
}

class HomeScreenHeaderButton extends StatelessWidget {
  /// A button located at the top of the home screen.
  ///
  /// This consist of a icon and text.
  const HomeScreenHeaderButton({
    super.key,
    this.autofocus = false,
    required this.iconData,
    required this.text,
    required this.onPressed,
    this.focusNode,
  });

  final bool autofocus;
  final FocusNode? focusNode;
  final IconData iconData;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(12.0),
        color: AppColors.greyContainerColor,
        child: FocusedOutlinedButton(
          autofocus: autofocus,
          focusNode: focusNode,
          onPressed: onPressed,
          padding: const EdgeInsets.all(10.0),
          child: (_) => FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  iconData,
                  color: AppColors.whiteColor,
                ),
                const SizedBox(width: 10.0),
                CenteredText(text: text)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
