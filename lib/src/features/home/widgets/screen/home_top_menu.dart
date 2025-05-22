part of '../../home_screen.dart';

// Icon, Subject, function
typedef TopHeaderItem = (IconData, String, dynamic);

class _HomeTopMenu extends HookWidget {
  const _HomeTopMenu({
    required this.listViewFSN,
    required this.sidebarFSN,
    required this.belowFSN,
    required this.refreshAll,
    required this.pushLiveAll,
    required this.pushVodAll,
    required this.pushPopularClips,
    required this.pushSearchTag,
    required this.pushGroup,
  });

  final FocusScopeNode listViewFSN;
  final FocusScopeNode belowFSN;
  final FocusScopeNode sidebarFSN;

  final Future<void> Function() refreshAll;
  final VoidCallback pushLiveAll;
  final VoidCallback pushVodAll;
  final VoidCallback pushPopularClips;
  final VoidCallback pushSearchTag;
  final VoidCallback pushGroup;

  @override
  Widget build(BuildContext context) {
    final isFirstFocused = useState<bool>(true);
    final focusNodes = useFocusNodes(itemData.length);

    final topMenus = List.generate(
      itemData.length,
      (index) {
        final item = itemData[index];
        final button = _HomeTopMenuButton(
          focusNode: focusNodes[index],
          item: item,
        );

        return _expandedFlex(
          index == 0
              ? SidebarCallbackShortcuts(sidebarFSN: sidebarFSN, child: button)
              : button,
        );
      },
    );

    return DpadFocusScopeNavigator(
      node: listViewFSN,
      onFocusChange: (value) {
        if (value && isFirstFocused.value) {
          focusNodes[0].requestFocus();
          isFirstFocused.value = false;
        }
      },
      dpadKeyNodeMap: {DpadAction.arrowDown: belowFSN},
      child: Row(children: topMenus),
    );
  }

  Widget _expandedFlex(Widget child) {
    return Expanded(flex: 1, child: child);
  }

  List<TopHeaderItem> get itemData => [
        (Icons.refresh_rounded, '새로고침', refreshAll),
        (Icons.sort_rounded, '전체 라이브', pushLiveAll),
        (Icons.replay_circle_filled_rounded, '다시보기', pushVodAll),
        (Icons.content_cut_rounded, '인기 클립', pushPopularClips),
        (Icons.tag_rounded, '태그 검색', pushSearchTag),
        (Icons.group_rounded, '그룹', pushGroup),
      ];
}

class _HomeTopMenuButton extends StatelessWidget {
  const _HomeTopMenuButton({
    required this.focusNode,
    required this.item,
  });

  final FocusNode focusNode;
  final TopHeaderItem item;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.only(right: 10.0),
        child: FocusedOutlinedButton(
          autofocus: false,
          focusNode: focusNode,
          borderRadius: 12.0,
          backgroundColor: AppColors.greyContainerColor,
          padding: EdgeInsets.all(10.0),
          onPressed: item.$3,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon
                Icon(item.$1, color: AppColors.whiteColor),
                // padding
                const SizedBox(width: 10.0),
                // text
                CenteredText(text: item.$2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
