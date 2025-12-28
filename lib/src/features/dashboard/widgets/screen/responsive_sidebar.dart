part of '../../dashboard_screen.dart';

// Icon, Menu text, AppRoute
typedef ResponsiveSidebarItem = (IconData, String, AppRoute);

class _ResponsiveSidebar extends HookConsumerWidget with DashboardEvent {
  /// A responsive sidebar with FocusScope located on the left side of the screen.
  ///
  /// If the sidebar's [FocusScopeNode] has focus, it will expand.
  const _ResponsiveSidebar({
    required this.sidebarFSN,
    required this.contentsFSN,
    required this.currentLocationName,
  });

  /// This sidebar's [FocusScopeNode].
  final FocusScopeNode sidebarFSN;

  /// Contents Area [FocusScopeNode] to navigate the focus.
  final FocusScopeNode contentsFSN;

  /// Current route location to highlight the color of currently activated sidebar item.
  final String currentLocationName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasFocus = useState<bool>(false);
    final screenHeight = context.screenHeight;

    // create menu items.
    final List<ResponsiveSidebarMenuItem> menuItems = List.generate(
      _sidebarItems.length,
      (index) {
        final item = _sidebarItems[index];
        return ResponsiveSidebarMenuItem(
          sidebarHasFocus: hasFocus.value,
          isCurrentScreen: currentLocationName == item.$3.routeName,
          iconData: item.$1,
          menuText: item.$2,
          onPressed: () {
            if (index == 0) {
              pushSearch(context);
            } else if (index == 1) {
              goHome(ref, context, currentLocationName: currentLocationName);
            } else {
              goTo(
                context,
                currentLocationName: currentLocationName,
                appRoute: item.$3,
              );
            }
          },
        );
      },
    );

    return AnimatedPositioned(
      duration: Duration(milliseconds: 100),
      left: 0.0,
      width: hasFocus.value ? _expandedWidth : _collapsedWidth,
      height: screenHeight,
      child: DpadFocusScopeNavigator(
        node: sidebarFSN,
        dpadKeyNodeMap: {DpadAction.arrowRight: contentsFSN},
        onFocusChange: (value) {
          hasFocus.value = value;
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          decoration: BoxDecoration(
            gradient: hasFocus.value ? _expandedGradient : null,
            color:
                hasFocus.value ? null : _backgroundColor.withValues(alpha: 0.7),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  ...menuItems,
                ],
              ),
              // user Button
              ResponsiveUserButton(
                sidebarHasFocus: hasFocus.value,
                onPressedSignInButton: () {
                  goTo(
                    context,
                    currentLocationName: currentLocationName,
                    appRoute: AppRoute.auth,
                  );
                },
                onPressedUserProfile: () async {
                  if (context.mounted) {
                    await PopupUtils.showButtonDialog(
                      buttonType: DialogButtonType.doubleButton,
                      context: context,
                      titleText: '로그아웃',
                      contentText: '로그아웃 하시겠습니까?',
                      confirmText: '로그아웃',
                      cancelText: '취소',
                      confirmCallback: () async {
                        await signOut(
                          ref: ref,
                          context: context,
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Fixed values
  final Color _backgroundColor = AppColors.backgroundColor;
  final double _collapsedWidth = Dimensions.collapsedSidebarWidth;
  final double _expandedWidth = Dimensions.expandedSidebarWidth;
  LinearGradient get _expandedGradient => LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          _backgroundColor.withValues(alpha: 1.0),
          _backgroundColor.withValues(alpha: 0.95),
        ],
        stops: [
          0.0,
          1.0,
        ],
      );
  List<ResponsiveSidebarItem> get _sidebarItems => [
        (Icons.search_rounded, '검색', AppRoute.search),
        (Icons.home_rounded, '홈', AppRoute.home),
        (Icons.favorite_rounded, '팔로잉', AppRoute.following),
        (Icons.category_rounded, '카테고리', AppRoute.category),
        (Icons.settings_rounded, '설정', AppRoute.settings),
      ];
}
