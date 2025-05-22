part of '../../group_screen.dart';

class _GroupListWithFunctions extends HookWidget {
  const _GroupListWithFunctions({
    required this.currentIndex,
    required this.groups,
    required this.itemNode,
    required this.aboveFSN,
    required this.rightFSN,
    required this.onPressedGroup,
  });

  final Groups groups;
  final int? currentIndex;
  final FocusScopeNode aboveFSN;
  final FocusScopeNode itemNode;
  final FocusScopeNode rightFSN;
  final void Function(int index) onPressedGroup;

  @override
  Widget build(BuildContext context) {
    final groupList = groups.groups;
    final focusNodes = useFocusNodes(groupList.length);

    return groupList.isEmpty
        ? CenteredText(text: '생성된 그룹이 없습니다')
        : SizedBox(
            width: Dimensions.groupListWidth,
            child: FocusScope(
              node: itemNode,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: groupList.length,
                itemBuilder: (context, index) {
                  return DpadCallbackShortcuts(
                    dpadKeyNodeMap: {
                      DpadAction.arrowRight: rightFSN,
                      DpadAction.arrowUp: aboveFSN,
                    },
                    bindings: _createBindings(index),
                    child: GroupListTile(
                      autofocus: index == 0,
                      focusNode: focusNodes[index],
                      currentIndex: currentIndex,
                      itemIndex: index,
                      group: groupList[index],
                      onPressedGroup: () {
                        if (currentIndex != index) {
                          onPressedGroup(index);
                        }
                      },
                    ),
                  );
                },
              ),
            ),
          );
  }

  ShortcutsBindings _createBindings(int index) {
    ShortcutsBindings bindings = {
      const SingleActivator(LogicalKeyboardKey.arrowRight): () {
        rightFSN.requestFocus();
      },
    };

    // request focus to header widget's FocusScopeNode
    if (index == 0) {
      bindings[const SingleActivator(LogicalKeyboardKey.arrowUp)] = () {
        aboveFSN.requestFocus();
      };
    }

    return bindings;
  }
}
