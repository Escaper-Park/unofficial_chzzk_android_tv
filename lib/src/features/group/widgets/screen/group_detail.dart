part of '../../group_screen.dart';

class _GroupDetail extends HookWidget {
  const _GroupDetail({
    required this.asyncChannels,
    required this.aboveFSN,
    required this.itemNode,
    required this.leftFSN,
    required this.removeMemberFromGroup,
    required this.pushSearch,
    required this.removeGroup,
  });

  final AsyncValue<List<Channel>?> asyncChannels;

  final FocusScopeNode aboveFSN;
  final FocusScopeNode itemNode;
  final FocusScopeNode leftFSN;
  final void Function(Channel channel) removeMemberFromGroup;

  final int _crossAxisCount = 4;
  final VoidCallback pushSearch;
  final VoidCallback removeGroup;

  @override
  Widget build(BuildContext context) {
    return asyncChannels.when(
      data: (data) {
        if (data == null) {
          return CenteredText(text: '그룹 데이터를 불러올 수 없습니다');
        }

        final focusNodes = useFocusNodes(data.length);

        return Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            top: 5.0,
            bottom: 10.0,
          ),
          child: FocusScope(
            node: itemNode,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: _crossAxisCount,
                mainAxisExtent: Dimensions.groupChannelItemHeight,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: data.length + 2, // add member button,
              itemBuilder: (context, index) {
                Widget child;
                if (index == 0) {
                  child = _functions(
                    true,
                    Icons.group_add_rounded,
                    '멤버 추가',
                    pushSearch,
                  );
                } else if (index == 1) {
                  child = _functions(
                    false,
                    Icons.delete_rounded,
                    '그룹 삭제',
                    removeGroup,
                  );
                } else {
                  child = GroupChannelItem(
                    autofocus: false,
                    channel: data[index - 2],
                    focusNode: focusNodes[index - 2],
                    onPressedChannel: (channel) {
                      removeMemberFromGroup(channel);
                    },
                  );
                }

                return DpadCallbackShortcuts(
                  dpadKeyNodeMap: {},
                  bindings: _getBindingsForPosition(index),
                  child: child,
                );
              },
            ),
          ),
        );
      },
      error: (_, __) => CenteredText(text: '그룹 정보를 불러올 수 없습니다'),
      loading: () => const SizedBox.shrink(),
    );
  }

  Widget _functions(
    bool autofocus,
    IconData iconData,
    String text,
    VoidCallback onPressed,
  ) {
    return RoundedContainer(
      width: Dimensions.groupChannelItemWidth,
      height: Dimensions.groupChannelItemHeight,
      backgroundColor: AppColors.greyContainerColor,
      child: FocusedOutlinedButton(
        autofocus: true,
        padding: const EdgeInsets.all(10.0),
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              // Icons.group_add_rounded,
              color: AppColors.whiteColor,
              size: 45.0,
            ),
            CenteredText(text: text),
          ],
        ),
      ),
    );
  }

  ShortcutsBindings _getBindingsForPosition(int index) {
    ShortcutsBindings bindings = {};

    final bool isTopRow = index < _crossAxisCount;
    final bool isLeftColumn = index % _crossAxisCount == 0;
    final bool isTopLeft = index == 0;

    // Add left arrow binding for leftmost items
    if (isLeftColumn || isTopLeft) {
      bindings[const SingleActivator(LogicalKeyboardKey.arrowLeft)] = () {
        leftFSN.requestFocus();
      };
    }

    // Add up arrow binding for top row items
    if (isTopRow || isTopLeft) {
      bindings[const SingleActivator(LogicalKeyboardKey.arrowUp)] = () {
        aboveFSN.requestFocus();
      };
    }

    return bindings;
  }
}
