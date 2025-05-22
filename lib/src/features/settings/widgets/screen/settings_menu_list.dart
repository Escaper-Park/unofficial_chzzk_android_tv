part of '../../settings_screen.dart';

class _SettingsMenuList extends StatelessWidget {
  const _SettingsMenuList({
    required this.currentIndex,
    required this.focusNodes,
    required this.settingMenuFSN,
    required this.sidebarFSN,
    required this.detailScreenFSN,
    required this.onPressed,
  });

  final int currentIndex;
  final List<FocusNode> focusNodes;
  final FocusScopeNode settingMenuFSN;
  final FocusScopeNode sidebarFSN;
  final FocusScopeNode detailScreenFSN;

  final void Function(int index) onPressed;

  @override
  Widget build(BuildContext context) {
    final List<(IconData, String)> itemData = [
      (Icons.video_settings_rounded, '스트리밍 설정'),
      (Icons.mark_chat_read_rounded, '채팅 설정'),
      (Icons.system_update_alt_rounded, '업데이트 확인'),
      (Icons.question_answer_rounded, 'FAQ'),
      (Icons.flutter_dash_rounded, '오픈소스 라이선스'),
      (Icons.coffee_rounded, '후원하기'),
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // header
        HeaderText(text: '설정 메뉴'),
        // list
        Expanded(
          child: SizedBox(
            width: Dimensions.settingMenuWidth,
            child: DpadListView(
              scrollDirection: Axis.vertical,
              focusNodes: focusNodes,
              itemList: itemData,
              // sidebarFSN: sidebarFSN,
              leftFSN: sidebarFSN,
              rightFSN: detailScreenFSN,
              listViewFSN: settingMenuFSN,
              itemBuilder: (index, focusNode, object) => SettingMenuCard(
                currentIndex: currentIndex,
                itemIndex: index,
                autofocus: index == 0,
                focusNode: focusNode,
                onPressed: () => onPressed(index),
                icon: itemData[index].$1,
                subject: itemData[index].$2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
